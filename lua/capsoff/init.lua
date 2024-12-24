local utils = require("utils")

local root = debug.getinfo(1, "S").source:sub(2):match("(.*)/(.*)/(.*)/.*")
local os_name = utils.get_os()
local isWindows = os_name == "Windows"
local execute_path = isWindows and root .. "\\dist\\capsLockOff.exe" or root .. "/dist/capsLockOff"

local M = {}

M.setup = function(opts)
  opts = opts or {}
  vim.api.nvim_create_user_command("CapsLockOff", function()
    vim.fn.system(execute_path)
  end, { nargs = 0 })

  vim.api.nvim_create_user_command("CapsLockOffBuild", function()
    vim.fn.system("make build -C " .. root)
  end, { nargs = 0 })

  vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
      vim.cmd("CapsLockOff")
    end,
  })
end

return M
