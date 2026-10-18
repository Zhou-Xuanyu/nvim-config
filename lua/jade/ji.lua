-- Intro
-- leader jl to create a daily log file in log/ folder
-- auto name the file with date
-- auto generate h1 with date
-- auto generate h2 with lua date function every time called
-- leader jt to open the todo.md file
-- leader jm to open the mirror (monthly)

-- root folder of ji; change this if the folder moves
local ji_root = vim.fn.expand("~/Documents/ji")

-- Create new daily log file if it doesn't exist
local function create_new_log_file(file_path, date)
    if vim.fn.filereadable(file_path) == 0 then
        local header = string.format("# %s", date)
        vim.fn.writefile({ header }, file_path, "b")
        -- passing b to avoid empty line
    end
end

-- copy of the function from time.lua
local function insert_markdown_h2_date()
    local time = os.date("%a %b %e %H:%M:%S %Z %Y")
    vim.cmd("normal! i## " .. time .. "\n")
    vim.cmd("normal! o")
end

-- Open daily log file
local function open_daily_log()
    local log_dir = ji_root .. "/log"
    local date = os.date("%Y-%m-%d")
    local file_path = log_dir .. "/" .. date .. ".md"

    -- ensure directory exists
    vim.fn.mkdir(log_dir, "p")

    -- create file if it doesn't exist
    create_new_log_file(file_path, date)

    vim.cmd("edit " .. file_path)
    vim.cmd("normal! G")
    vim.cmd("normal! 2o")

    insert_markdown_h2_date()
end

local function open_todo_file()
    local file_path = ji_root .. "/todo.md"
    vim.cmd("edit " .. file_path)
end

-- Create new mirror file if it doesn't exist
local function create_new_mirror_file(file_path, year_month)
    if vim.fn.filereadable(file_path) == 0 then
        local header = string.format("# Mirror %s", year_month)
        vim.fn.writefile({ header }, file_path, "b")
        -- passing b to avoid empty line
    end
end

-- Open mirror file
local function open_mirror_file()
    local mirror_dir = ji_root .. "/mirror"
    local year_month = os.date("%Y%m")
    local file_path = mirror_dir .. "/" .. year_month .. ".md"

    -- ensure directory exists
    vim.fn.mkdir(mirror_dir, "p")

    -- create file if it doesn't exist
    create_new_mirror_file(file_path, year_month)

    vim.cmd("edit " .. file_path)
    vim.cmd("normal! G")
    vim.cmd("normal! 2o")

    insert_markdown_h2_date()
end

vim.keymap.set("n", "<leader>jm", open_mirror_file, { desc = "Open mirror" })
vim.keymap.set("n", "<leader>jl", open_daily_log, { desc = "Open daily log" })
vim.keymap.set("n", "<leader>jt", open_todo_file, { desc = "Open todo file" })
