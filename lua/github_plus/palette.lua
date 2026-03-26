local colors = require('github_plus.utils.colors')

--- @class GithubPlus.Palette.EmphasisColor
--- @field base string
--- @field emphasis string

--- @class GithubPlus.Palette.MutedColor
--- @field base string
--- @field muted string

--- @class GithubPlus.Palette.EmphasisMutedColor
--- @field base string
--- @field emphasis string
--- @field muted string

--- @class GithubPlus.Palette.UI
--- @field border string
--- @field reference string
--- @field selection string
--- @field search string
--- @field visual string
--- @field comment string
--- @field line_nr string
--- @field indent string
--- @field cursorline string

--- @class GithubPlus.Palette.Syntax
--- @field punctuation string
--- @field types string
--- @field escape string
--- @field property string
--- @field markup string

--- @class GithubPlus.Palette
--- @field bg GithubPlus.Palette.EmphasisMutedColor
--- @field fg GithubPlus.Palette.MutedColor
--- @field black GithubPlus.Palette.EmphasisColor
--- @field red GithubPlus.Palette.EmphasisColor
--- @field green GithubPlus.Palette.EmphasisColor
--- @field yellow GithubPlus.Palette.EmphasisColor
--- @field orange GithubPlus.Palette.EmphasisColor
--- @field blue GithubPlus.Palette.EmphasisColor
--- @field purple GithubPlus.Palette.EmphasisColor
--- @field cyan GithubPlus.Palette.EmphasisColor
--- @field white GithubPlus.Palette.EmphasisColor
--- @field none string
--- @field diagnostics { hint: string, info: string, warn:string, error: string }
--- @field git { add:string, change:string, delete:string }
--- @field diff { add:string, change:string, delete:string, text:string }
--- @field syntax GithubPlus.Palette.Syntax
--- @field ui GithubPlus.Palette.UI

local M = {}

--- @param bg string The value of vim.o.background ('light' or 'dark')
--- @return GithubPlus.Palette
M.get = function(bg)
    if bg ~= 'light' then
        -- Dark palette (Nikso Dark)
        local p       = {
            black  = { base = '#282c33', emphasis = '#768390' },
            red    = { base = '#f47067', emphasis = '#ff938a' },
            green  = { base = '#57ab5a', emphasis = '#8edb8c' },
            yellow = { base = '#daaa3f', emphasis = '#f2cc60' },
            orange = { base = '#f69d50', emphasis = '#ffb86b' },
            blue   = { base = '#539bf5', emphasis = '#79c0ff' },
            purple = { base = '#b377cf', emphasis = '#dcbdfb' },
            cyan   = { base = '#96d0ff', emphasis = '#a5d6ff' },
            white  = { base = '#d1d7e0', emphasis = '#fbffff' },
            none   = 'NONE',
        }

        p.bg          = { base = p.black.base, emphasis = '#2d323b', muted = '#1c2128' }
        p.fg          = { base = p.white.base, muted = p.black.emphasis }

        p.diagnostics = {
            hint  = p.black.emphasis,
            info  = p.blue.base,
            warn  = p.yellow.base,
            error = colors.blend(p.red.base, p.black.base, 0.1),
        }

        p.git         = {
            add    = p.green.base,
            change = p.yellow.base,
            delete = p.red.base,
        }

        p.ui          = {
            border     = '#444c56',
            reference  = '#303a46',
            selection  = '#454a56',
            search     = '#496380',
            visual     = '#3c444d',
            comment    = '#9198a1',
            line_nr    = '#4e5a5f',
            indent     = '#4e5054',
            cursorline = p.bg.emphasis,
        }

        p.syntax      = {
            types       = p.blue.emphasis,
            punctuation = '#b2b9c6',
            escape      = '#858c96',
            property    = p.cyan.base,
            markup      = p.cyan.base,
        }

        p.diff        = {
            add    = colors.blend(p.git.add, p.bg.muted, 0.8),
            change = colors.blend(p.git.change, p.bg.muted, 0.9),
            delete = colors.blend(p.git.delete, p.bg.muted, 0.8),
            text   = p.ui.search,
        }

        return p
    end

    -- Light palette (Nikso Light)
    -- Terminal colors 0–15 are anchored by Zed values.
    -- All other values (bg, fg, ui, syntax, diff) are placeholders — see Task 4.
    local p       = {
        black  = { base = '#414141', emphasis = '#989898' },
        red    = { base = '#d73949', emphasis = '#fa6e71' },
        green  = { base = '#90d159', emphasis = '#22863a' },
        yellow = { base = '#f7c400', emphasis = '#ffca39' },
        orange = { base = '#e36209', emphasis = '#f69d50' },
        blue   = { base = '#005bc5', emphasis = '#1b22d6' },
        purple = { base = '#6f42c1', emphasis = '#6f42c1' },
        cyan   = { base = '#0ac7d7', emphasis = '#005cc5' },
        white  = { base = '#bfbfbf', emphasis = '#e0e0e0' },
        none   = 'NONE',
    }

    p.bg          = { base = '#ffffff', emphasis = '#f6f8fa', muted = '#f0f2f4' }
    p.fg          = { base = '#24292e', muted = '#586069' }

    p.diagnostics = {
        hint  = '#586069',
        info  = p.blue.base,
        warn  = '#d3a040',
        error = colors.blend(p.red.base, p.bg.base, 0.1),
    }

    p.git         = {
        add    = '#22863a',
        change = '#d3a040',
        delete = p.red.base,
    }

    p.ui          = {
        border     = '#cbcdd1',
        reference  = '#e7e6e5',
        selection  = '#e4e6f1',
        search     = '#e7e6e5',
        visual     = '#d8dff8',
        comment    = '#6a737d',
        line_nr    = '#cccccc',
        indent     = '#eeeeee',
        cursorline = '#fffbdd',
    }

    p.syntax      = {
        types       = p.purple.base,
        punctuation = p.fg.base,
        escape      = '#032f62',
        property    = p.blue.base,
        markup      = p.blue.base,
    }

    p.diff        = {
        add    = colors.blend(p.git.add, p.bg.base, 0.8),
        change = colors.blend(p.git.change, p.bg.base, 0.9),
        delete = colors.blend(p.git.delete, p.bg.base, 0.8),
        text   = p.ui.search,
    }

    return p
end

return M
