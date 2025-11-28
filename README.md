# github-plus.nvim

A lua port of the nikso theme for [VSCode](https://github.com/thenikso/nikso-vscode-theme), which was inspired on Github coloring.

## Screenshots

<div align="center">
  <h3>Lua</h3><img src="https://github.com/tommarien/github-plus.nvim/blob/main/assets/Screenshot%202025-11-22%20at%2013.03.30.png" alt="nightfox" style="border-radius:1%" />
  <h3>Go</h3><img src="https://github.com/tommarien/github-plus.nvim/blob/main/assets/Screenshot%202025-11-22%20at%2013.04.19.png" alt="dayfox" style="border-radius:1%" />
</div>

## Installation

Download with your favorite package manager.

```lua
{ --- Lazy.nvim
    'tommarien/github-plus.nvim',
    lazy = false,
    priority = 1000,
    version = '*',
    --- @type GithubPlus.Overrides
    opts = {
        transparent = true,
    },
    config = function(_, opts)
        require('github_plus').setup(opts)
        vim.cmd('colorscheme github_plus')
    end
}
```

## Options

### Default Configuration

The plugin provides the following default settings:

```lua
{
    terminal_colors = true, -- Enables terminal color highlighting
    transparent = false,    -- Disables transparent background by default
    styles = {
        comments = {
            italic = true,  -- Italic comments
        },
    },
}
```

### Possible Configuration Overrides

You can customize the plugin using the available options below:

- **`transparent`** (boolean): Enable transparent background.
- **`terminal_colors`** (boolean): Apply colors to the terminal.
- **`styles`** (table): Customize syntax highlighting styles. This table supports the following keys:
  - `comments` (table): Options for styling comments (e.g., `{ italic = true }`). Supported booleans: `bold`, `italic`, `underline`.
  - `keywords` (table): Options for styling keywords.
  - `numbers` (table): Options for styling numbers.
  - `operators` (table): Options for styling operators.
  - `strings` (table): Options for styling strings.
  - `types` (table): Options for styling types.
  - `conditionals` (table): Options for styling conditionals.
  - `functions` (table): Options for styling functions.

### Usage

Simply set the colorscheme with the builtin command `:colorscheme`

```vim
colorscheme github_plus
```

```lua
vim.cmd("colorscheme github_plus")
```
