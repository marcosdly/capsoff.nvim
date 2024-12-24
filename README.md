**You need to install `gcc` berfore installing this package.**  
I only tested it on my windows and linux system with the Lazy plugin manager.  
```lua
{
  "zongben/capsoff.nvim",
  build = ":CapsLockOffBuild",
  config = function()
    require("capsoff").setup({})
  end,
}
```

After installation, you can turn off Caps Lock when leaving insert mode or by calling
```bash
:CapsLockOff
```

If it doesn't work, you can try to rebuild the binary by calling
```bash
:CapsLockOffBuild
```

***
If you encounter any problems, or have improvements for my little code. please create an issue or PR. thx!
