After installing, you can turn off capslock by calling 
```bash
:CapsLockOff
```
Then you can set an autocmd that automatically turns off Caps Lock after leaving insert mode
```bash
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("CapsLockOff")
  end,
})
```
***
I only tested it on my windows and linux system with the Lazy plugin manager. After installation, it will compile the C file into an executable or object file based on your OS. If you encounter any problems, or have improvements for my code. please create an issue or PR. thx!
