-- nREPL server lifecycle for Conjure. Needs the :nrepl alias in ~/.clojure/deps.edn.
local job = nil
local port = nil
local root = nil

local function running()
  return job ~= nil and vim.fn.jobwait({ job }, 0)[1] == -1
end

-- Walk up from the current file for a project marker; fall back to cwd.
local function project_root()
  local marker = vim.fs.find(
    { "deps.edn", "project.clj", "bb.edn", "shadow-cljs.edn" },
    { upward = true, path = vim.fn.expand("%:p:h") }
  )[1]
  return marker and vim.fs.dirname(marker) or vim.fn.getcwd()
end

local function start()
  if running() then
    vim.notify(
      "nREPL already up on port " .. (port or "?") .. " (" .. (root or "?") .. ")",
      vim.log.levels.INFO
    )
    return
  end

  root = project_root()
  port = nil
  job = vim.fn.jobstart({ "clojure", "-M:nrepl" }, {
    cwd = root,
    on_exit = function(_, code)
      job, port = nil, nil
      vim.notify("nREPL stopped (exit " .. code .. ")", vim.log.levels.INFO)
    end,
  })

  if job <= 0 then
    job = nil
    vim.notify("failed to start nREPL", vim.log.levels.ERROR)
    return
  end

  vim.notify("starting nREPL in " .. root .. " ...", vim.log.levels.INFO)

  -- JVM + dep resolution takes a while; poll for the port file, then connect.
  local port_file = root .. "/.nrepl-port"
  local waited = 0
  local timer = vim.uv.new_timer()
  timer:start(500, 500, vim.schedule_wrap(function()
    if not running() then
      timer:stop()
      timer:close()
      return
    end
    if vim.fn.filereadable(port_file) == 1 then
      timer:stop()
      timer:close()
      port = vim.trim(vim.fn.readfile(port_file)[1])
      vim.cmd("ConjureConnect")
      vim.notify("nREPL up on port " .. port, vim.log.levels.INFO)
      return
    end
    waited = waited + 500
    if waited >= 90000 then
      timer:stop()
      timer:close()
      vim.notify("no .nrepl-port after 90s", vim.log.levels.ERROR)
    end
  end))
end

-- `clojure` is a shell wrapper that forks java instead of exec'ing it, and the
-- JVM is its own process-group leader. jobstop() reaps only the wrapper, so the
-- server would survive as an orphan unless its children are killed directly.
local function terminate()
  vim.fn.system({ "pkill", "-TERM", "-P", tostring(vim.fn.jobpid(job)) })
  vim.fn.jobstop(job)
end

local function stop()
  if not running() then
    vim.notify("no nREPL running", vim.log.levels.WARN)
    return
  end
  -- Loud: killing the server discards every def and loaded ns in it.
  vim.notify("killing nREPL on port " .. (port or "?") .. " -- REPL state is lost", vim.log.levels.WARN)
  terminate()
end

vim.api.nvim_create_user_command("RS", start, { desc = "nREPL: start + connect Conjure" })
vim.api.nvim_create_user_command("RSStop", stop, { desc = "nREPL: stop server" })

-- Don't leave a stray JVM behind on :qa.
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if running() then terminate() end
  end,
})
