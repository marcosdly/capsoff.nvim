# capsoff.nvim

## Installation
**You need to install `gcc` before installing this package.**  
```lua
--Lazy
{
  "zongben/capsoff.nvim",
  build = ":CapsLockOffBuild",
  config = function()
    require("capsoff").setup()
  end,
}
```

## Configuration
```lua
{
    -- Automatically turn off Caps Lock when leaving insert mode
    -- If you want to turn off Caps Lock manually, you can set it to false
    auto = true,
}
```

## Usage

After installation, you can turn off Caps Lock when leaving insert mode or by calling
```bash
:CapsLockOff
```

If it doesn't work, you can try to rebuild the binary by calling
```bash
:CapsLockOffBuild
```

## Note
I only tested it on my windows and linux X11 system with the Lazy plugin manager.  
If you encounter any problems, or have improvements for my little code. please create an issue or PR. thx!
