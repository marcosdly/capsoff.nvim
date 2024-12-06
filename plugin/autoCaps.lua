local isWindows = vim.loop.os_uname().sysname == "Windows_NT"
local root = vim.fn.fnamemodify(vim.fn.expand("<sfile>:p:h"), ":h")
local distDir
if isWindows then
	distDir = root .. "\\dist"
else
	distDir = root .. "/dist"
end

local function build()
  if isWindows then
    vim.fn.mkdir(root .. "\\dist")
    local dir = root .. "\\src\\windows"
    os.execute("gcc -o " .. root .. "\\dist\\capsLockOff.exe " .. dir .. "\\capsLockOff.c")
  else
    vim.fn.mkdir(root .. "/dist")
    local dir = root .. "/src/linux"
    os.execute("gcc -o " .. root .. "/dist/capsLockOff " .. dir .. "/capsLockOff.c -lX11 -lXtst")
  end
end

if vim.fn.isdirectory(distDir) ~= 1 then
  build()
end

vim.api.nvim_create_user_command("CapsLockOff", function()
  if isWindows then
    vim.fn.system(root .. "\\dist\\capsLockOff.exe")
  else
    vim.fn.system(root .. "/dist/capsLockOff")
  end
end, { nargs = 0 })

vim.api.nvim_create_user_command("CapsLockRebuild", function()
  build()
end, { nargs = 0 })

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("CapsLockOff")
  end,
})
