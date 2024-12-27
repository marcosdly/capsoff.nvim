local utils = require("utils")
local config = require("capsoff.config")

local root = debug.getinfo(1, "S").source:sub(2):match("(.*)/(.*)/(.*)/.*")
local os_name = utils.get_os()
local execute_path = os_name == "Windows" and utils.combined_path(root, "dist", "capslock_off.exe")
	or utils.combined_path(root, "dist", "capslock_off")

local M = {}

M.options = {}

M.setup = function(opts)
	M.options = vim.tbl_deep_extend("force", config.defaults, opts or {})

	vim.api.nvim_create_user_command("CapsLockOff", function()
		vim.fn.system(execute_path)
	end, { nargs = 0 })

	vim.api.nvim_create_user_command("CapsLockOffBuild", function()
		vim.fn.system("make build -C " .. root)
	end, { nargs = 0 })

	if M.options.auto then
		vim.api.nvim_create_autocmd("InsertLeave", {
			pattern = "*",
			callback = function()
				vim.cmd("CapsLockOff")
			end,
		})
	end
end

return M
