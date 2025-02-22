# Neovim Configuration with Lazy.nvim



## 🔗 Quick Links

📖 [Neovim Docs](https://neovim.io/doc/) | 🛠️ [Lazy.nvim](https://github.com/folke/lazy.nvim) | 🎨 [Neovim](https://neovim.io/)

---

## Overview

This is a **Neovim** configuration using **Lazy.nvim** as the plugin manager. It provides an optimized and modern setup with essential settings, key mappings, and a structured plugin management system.

## 🛠️ Requirements

- **Neovim 0.9+** (latest version is recommended)
- **Git** (for cloning Lazy.nvim)
- **tmux** (if you want clipboard integration)
- **wl-clipboard** (for Wayland users)

## 📥 Installation

Clone this repository into your Neovim config directory:

```sh
mkdir -p ~/.config/nvim
cd ~/.config/nvim
git clone <your-repo-url> .
```

Launch Neovim, and Lazy.nvim will automatically install the necessary plugins.

```sh
nvim
```

## ⚙️ Configuration Breakdown

### 🏁 1. **init.lua** - Entry Point

The `init.lua` file initializes the configuration by requiring the necessary modules:

```lua
require('config.vim').setup() -- Load Vim settings
require('config.lazy')        -- Load Lazy.nvim plugin manager
require('config.maps')        -- Load key mappings
```

### 🎛️ 2. **vim.lua** - Core Settings

This file contains essential **Neovim settings**, such as:

- Relative line numbers
- Clipboard integration
- Auto-indentation and tab settings
- Split window behaviors
- Mouse support

Example configurations from `vim.lua`:

```lua
vim.opt.number = true       -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.termguicolors = true -- Enable true color support
```

Clipboard setup for Wayland:

```lua
vim.g.clipboard = {
  name = "wayland",
  copy = {
    ["+"] = "wl-copy --type text/plain",
    ["*"] = "wl-copy --type text/plain",
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
    ["*"] = "wl-paste --no-newline",
  },
  cache_enabled = true,
}
```

### 📦 3. **lazy.lua** - Plugin Management with Lazy.nvim

This file bootstraps **Lazy.nvim**, ensuring it's installed and configured correctly:

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)
```

Plugins are managed using:

```lua
require("lazy").setup({
  spec = {
    { import = "config.plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
```

## 🚀 Usage

- Open Neovim:
  ```sh
  nvim
  ```
- Lazy.nvim will install missing plugins on the first run.
- Use `:Lazy` inside Neovim to open the Lazy.nvim interface.

## 🔌 How to Install Plugins

To install plugins, add them to the `config/plugins/nvim-telescope.lua` file. Example:

```lua
return {
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}
```

Then run:

```sh
nvim
:Lazy sync
```

## 🔧 Additional Notes

- Modify `config/plugins.lua` to add or remove plugins.
- Customize `config/maps.lua` for custom key mappings.

## 📚 References

- 📖 [Neovim Docs](https://neovim.io/doc/)
- 🛠️ [Lazy.nvim](https://github.com/folke/lazy.nvim)
- 🎨 [Neovim](https://neovim.io/)

Enjoy your optimized **Neovim** setup! 🚀
