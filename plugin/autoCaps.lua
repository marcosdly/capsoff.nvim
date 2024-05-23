local isWindows = vim.loop.os_uname().sysname == "Windows_NT"
local root = vim.fn.fnamemodify(vim.fn.expand("<sfile>:p:h"), ":h")
local distDir
if isWindows then
	distDir = root .. "\\dist"
else
	distDir = root .. "/dist"
end

if vim.fn.isdirectory(distDir) ~= 1 then
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

if isWindows then
	vim.api.nvim_create_user_command("CapsLockOff", function()
		vim.fn.system(root .. "\\dist\\capsLockOff.exe")
	end, { nargs = 0 })
else
	vim.api.nvim_create_user_command("CapsLockOff", function()
		vim.fn.system(root .. "/dist/capsLockOff")
	end, { nargs = 0 })
end
