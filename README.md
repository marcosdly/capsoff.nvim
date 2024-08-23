You need to install GCC berfore installing this package.  
I only tested it on my windows and linux system with the Lazy plugin manager.  
After installation, it will compile the C file into an executable or object file based on your OS.  
Then you can turn off Caps Lock by calling
```bash
:CapsLockOff
```
and you can set an autocmd that automatically turns off Caps Lock after leaving insert mode
```bash
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("CapsLockOff")
  end,
})
```
***
If you encounter any problems, or have improvements for my little code. please create an issue or PR. thx!
