# github-plus.nvim

A lua port of the nikso theme for [VSCode](https://github.com/thenikso/nikso-vscode-theme), which was inspired on Github coloring.

## Installation

Download with your favorite package manager.

```lua
{ --- Lazy.nvim
    'tommarien/github-plus.nvim',
    lazy = false,
    priority = 1000,
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
  - `keywords` (table): Options for keyword styling.
  - `numbers` (table): Options for numbers, such as bold or italic.
  - `operators` (table): Customize operator appearance.
  - `strings` (table): Style string values.
  - `types` (table): Adjust type highlight settings.

### Usage

Simply set the colorscheme with the builtin command `:colorscheme`

```vim
colorscheme github_plus
```

```lua
vim.cmd("colorscheme github_plus")
```
