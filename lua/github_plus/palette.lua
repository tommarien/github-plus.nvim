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

--- @class GithubPlus.Palette.Syntax
--- @field punctuation string
--- @field types string
--- @field escape string

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
--- @field pink GithubPlus.Palette.EmphasisColor
--- @field none string
--- @field diagnostics { hint: string, info: string, warn:string, error: string }
--- @field git { add:string, change:string, delete:string }
--- @field diff { add:string, change:string, delete:string, text:string }
--- @field syntax GithubPlus.Palette.Syntax
--- @field ui GithubPlus.Palette.UI
local p = {
    black  = { base = '#282c33', emphasis = '#768390' },
    red    = { base = '#f47067', emphasis = '#ff938a' },
    green  = { base = '#57ab5a', emphasis = '#8edb8c' },
    yellow = { base = '#daaa3f', emphasis = '#f2cc60' },
    orange = { base = '#f69d50', emphasis = '#ffb86b' },
    blue   = { base = '#539bf5', emphasis = '#79c0ff' },
    purple = { base = '#b377cf', emphasis = '#dcbdfb' },
    cyan   = { base = '#96d0ff', emphasis = '#a5d6ff' },
    white  = { base = '#d1d7e0', emphasis = '#fbffff' },
    pink   = { base = '#e275ad', emphasis = '#ffb3d8' },
    none   = 'NONE'
}

p.bg = { base = p.black.base, emphasis = '#2d323b', muted = '#1c2128' }
p.fg = { base = p.white.base, muted = p.black.emphasis }

p.diagnostics = {
    hint = p.black.emphasis,
    info = p.blue.base,
    warn = p.yellow.base,
    error = colors.blend(p.red.base, p.black.base, 0.1),
}

p.git = {
    add = p.green.base,
    change = p.yellow.base,
    delete = p.red.base,
}

p.ui = {
    border    = '#444c56',
    reference = '#303a46',
    selection = '#454a56',
    search    = '#496380',
    visual    = '#3c444d',
    comment   = '#9198a1',
    line_nr   = '#4e5a5f',
    indent    = '#4e5054'
}

p.syntax = {
    types       = p.blue.emphasis,
    punctuation = '#b2b9c6',
    escape      = '#858c96'
}

p.diff = {
    add = colors.blend(p.git.add, p.bg.muted, 0.8),
    change = colors.blend(p.git.change, p.bg.muted, 0.9),
    delete = colors.blend(p.git.delete, p.bg.muted, 0.8),
    text = p.ui.search
}

return p
