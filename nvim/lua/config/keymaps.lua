-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local function file_exists(name)
-- 	local root_path = vim.fs.root(0, "make.bat")
-- 	local file_path = vim.fs.joinpath(root_path, name)
--
-- 	if vim.uv.os_uname().sysname == "Windows_NT" then
-- 		file_path = file_path:gsub("/", "\\\\")
-- 	end
--
-- 	return root_path ~= nil, file_path
-- end

-- -- vim.keymap.set("i", "<C-BS>", "<C-W>", { silent = true, desc = "Delete from cursor to ending word" })

vim.keymap.set("n", "<F5>", function()
	vim.cmd("w")
	os.execute("odin run .")
end, { silent = true, desc = "run" })

-- vim.keymap.set("n", "<F6>", function()
-- 	vim.cmd("w")
-- 	os.execute("odin build . -o:speed")
-- end, { silent = true, desc = "build" })

-- local make_bat_exists, make_bat_path = file_exists("make.bat")
-- -- local clean_bat_exists, clean_bat_path = file_exists("clean.bat")
-- local run_bat_exists, run_bat_path = file_exists("run.bat")
--
-- if make_bat_exists then
-- 	vim.keymap.set("n", "<F5>", function()
-- 		vim.cmd("w")
-- 		os.execute(run_bat_path)
-- 	end, { silent = true, desc = "run" })
--
-- 	vim.keymap.set("n", "<F6>", function()
-- 		vim.cmd("w")
-- 		os.execute(make_bat_path)
-- 		os.execute(run_bat_path)
-- 	end, { silent = true, desc = "run" })
-- end
