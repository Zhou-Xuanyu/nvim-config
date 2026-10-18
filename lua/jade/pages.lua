-- pages
-- short cut for editing pages
-- pages is my personal website
-- source code are in ~/Documents/pages
--
-- <leader>pn to open ~/Documents/pages/src/noise/YYYYMM.md 
-- file name is current date, if non-exist create it
-- if exist, insert h2 header at the very top after meta data
-- Create new daily log file if it doesn't exist
--

-- root folder of pages; change this if the folder moves
local pages_root = vim.fn.expand("~/Documents/pages")

local function create_new_noise_file(file_path)
    if vim.fn.filereadable(file_path) == 0 then
        local year = os.date("%Y")
        local month_num = tonumber(os.date("%m"))
        local month_en = os.date("%B")
        local title = string.format("%s年%s月 %s %s", year, month_num, month_en, year)

        local lines = {
            "---",
            "title: " .. title,
            "layout: layouts/noise.html",
            "tags: noise",
            "extra_css: css/noise.css",
            "---",
            "",
            "# " .. title,
            "",
        }
        vim.fn.writefile(lines, file_path)
    end
end

-- insert ## Tue May 19 14:35:09 PDT 2026
local function insert_markdown_h2_date()
    local time = os.date("%a %b %e %H:%M:%S %Z %Y")
    vim.cmd("normal! i## " .. time .. "\n")
    vim.cmd("normal! 2o")
    vim.cmd("normal! k")
end

-- Open daily log file
local function open_monthly_noise()
    local log_dir = pages_root .. "/src/noise"
    local month = os.date("%Y-%m")
    local file_path = log_dir .. "/" .. month .. ".md"

    -- ensure directory exists
    vim.fn.mkdir(log_dir, "p")

    -- create file if it doesn't exist
    create_new_noise_file(file_path)

    vim.cmd("edit " .. file_path)
    -- position after H1, which sits below frontmatter
    vim.cmd("normal! gg")
    vim.fn.search("^# ", "W")
    vim.cmd("normal! jo")

    insert_markdown_h2_date()
end

vim.keymap.set("n", "<leader>pn", open_monthly_noise, { desc = "Open monthly noise" })
