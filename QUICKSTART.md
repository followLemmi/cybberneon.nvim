# Quick Start Guide

Get started with **cyberneon.nvim** in under 5 minutes!

## 1. Installation

### With lazy.nvim (most popular)

Add to your `~/.config/nvim/lua/plugins/colorscheme.lua`:

```lua
return {
  "yourusername/cyberneon.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme cyberneon]])
  end,
}
```

### Manual Test

Before installing, you can test the theme:

```bash
# Clone to a temporary location
git clone https://github.com/yourusername/cyberneon.nvim ~/.local/share/nvim/temp-themes/cyberneon.nvim

# In Neovim, run:
# :set runtimepath+=~/.local/share/nvim/temp-themes/cyberneon.nvim
# :colorscheme cyberneon
```

## 2. Activate the Theme

### Option A: Set as default (recommended)

In your config file (init.lua or plugins/colorscheme.lua):

```lua
vim.cmd([[colorscheme cyberneon]])
```

### Option B: Try it first

Just run in Neovim:

```vim
:colorscheme cyberneon
```

## 3. Verify It Works

Open a code file and check:
- ✅ Background is dark blue (`#151144`)
- ✅ Text is bright green (`#00ff92`)  
- ✅ Syntax highlighting is colorful
- ✅ No errors in `:messages`

## 4. Customize (Optional)

The theme works great out of the box, but you can customize it by copying and modifying the colorscheme file if needed.

## 5. Take Screenshots

Try opening the demo files to see the theme in action:

```bash
cd ~/.local/share/nvim/lazy/cyberneon.nvim/examples
nvim demo.lua
nvim demo.py
nvim demo.ts
```

## Troubleshooting

### Colors look wrong?

Make sure your terminal supports true color:

```lua
-- Add to your init.lua
vim.opt.termguicolors = true
```

### Theme not loading?

Check the plugin is installed:

```vim
:Lazy check
```

### Still having issues?

1. Check `:messages` for errors
2. Open an issue on GitHub with:
   - Your Neovim version (`:version`)
   - Your terminal emulator
   - Error messages if any

## Next Steps

- Read the full [README.md](README.md) for all features
- Check [CONTRIBUTING.md](CONTRIBUTING.md) to improve the theme
- Share your setup with screenshots!

---

Enjoy the cyberpunk aesthetic! 💚
