# Neovim configuration 2025

The configuration is modularized and updated to work with Neovim 0.11.x versions.

Refer to the older configuration at [the other repo](https://github.com/creativecomposer/neovim-config)
for earlier Neovim versions.

---

## Requirements

- **Neovim >= 0.11.**

## Setup

1. Install [Neovim](https://neovim.io/) for your Operating System.

    Tip: For Linux and macOS, the best way is to install using [Homebrew](https://brew.sh/).

2. Clone this repository to the Neovim configuration folder.

On Linux, normally it is `~/.config/nvim` and on Windows `~/AppData/Local/nvim`.

```
cd ~/.config/nvim
git clone https://github.com/creativecomposer/neovim-config-2025.git .
```

3. `cd` to your desired project folder. Start Neovim.

4. At startup, Neovim will download any missing plugins. If any plugins are outdated, you will see a message.
Type `<space>l` to open the lazy.nvim plugin manager dashboard. You will be able to see which plugins need to be updated.
Press `U` to update all the outdated plugins.

After you updated the plugins, press `q` to close the lazy.nvim dashboard.

5. Type `<space>ff` to open the fuzzy file finder dialog. Find your desired file and press `<enter>` to open it.

## Features

The configuration in this repository is set up for *JavaScript/TypeScript* and *Python* based Web Development.

Therefore, you will get syntax highlighting, autocomplete, etc. for JavaScript, Typescript, React, and Python.

If you want syntax highlighting for more languages, install a
[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages) parser
for the desired language.

If you want autocomplete and code actions like Rename, Goto Definition, etc. for additional languages,
install a [LSP Server configuration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md) for the desired language.

## Tips and tricks

- If you want to see the existing keymaps while within Neovim, press `<space>?`.

- The Neovim configuration is written using the *Lua* programming language. Therefore, learn Lua and
modify the configuration. Specifically Neovim comes embedded with [Lua 5.1](https://www.lua.org/manual/5.1/).

- If you want to be fast and efficient in editing files, learn the Vim modal editing and Vim motions.
Couple of fun learning resources are [openvim](https://openvim.com/) and [VIM Adventures](https://vim-adventures.com/).
