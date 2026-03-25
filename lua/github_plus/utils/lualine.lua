local palette = require('github_plus.palette')

return function()
    local c = palette.get(vim.o.background)
    local theme = {}

    theme.normal = {
        a = { bg = c.blue.base,     fg = c.bg.base, gui = 'bold' },
        b = { bg = c.bg.muted,      fg = c.fg.base },
        c = { bg = c.bg.muted,      fg = c.fg.muted },
    }

    theme.insert = {
        a = { bg = c.green.emphasis, fg = c.bg.base, gui = 'bold' },
        b = { bg = c.bg.muted,       fg = c.fg.base },
    }

    theme.terminal = {
        a = { bg = c.blue.base, fg = c.bg.base, gui = 'bold' },
        b = { bg = c.bg.muted,  fg = c.fg.base },
    }

    theme.command = {
        a = { bg = c.yellow.base, fg = c.bg.base, gui = 'bold' },
        b = { bg = c.bg.muted,    fg = c.fg.base },
    }

    theme.visual = {
        a = { bg = c.purple.emphasis, fg = c.bg.base, gui = 'bold' },
        b = { bg = c.bg.muted,        fg = c.fg.base },
    }

    theme.replace = {
        a = { bg = c.cyan.base, fg = c.bg.base, gui = 'bold' },
        b = { bg = c.bg.muted,  fg = c.fg.base },
    }

    theme.inactive = {
        a = { bg = c.bg.base, fg = c.blue.base },
        b = { bg = c.bg.base, fg = c.fg.base, gui = 'bold' },
        c = { bg = c.bg.base, fg = c.fg.base },
    }

    return theme
end
