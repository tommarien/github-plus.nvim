local colors = require('github_plus.utils.colors')

--- @class GithubPlus.Palette.BrightColor
--- @field base string
--- @field bright string

--- @class GithubPlus.Palette.DimColor
--- @field base string
--- @field dim string

--- @class GithubPlus.Palette.BrightDimColor
--- @field base string
--- @field bright string
--- @field dim string

--- @class GithubPlus.Palette.UI
--- @field border string
--- @field selection string
--- @field search string
--- @field visual string
--- @field comment string
--- @field line_nr string
--- @field indent string

--- @class GithubPlus.Palette.Syntax
--- @field punctuation string
--- @field types string

--- @class GithubPlus.Palette
--- @field bg GithubPlus.Palette.BrightDimColor
--- @field fg GithubPlus.Palette.DimColor
--- @field black GithubPlus.Palette.BrightColor
--- @field red GithubPlus.Palette.BrightColor
--- @field green GithubPlus.Palette.BrightColor
--- @field yellow GithubPlus.Palette.BrightColor
--- @field orange GithubPlus.Palette.BrightColor
--- @field blue GithubPlus.Palette.BrightColor
--- @field purple GithubPlus.Palette.BrightColor
--- @field cyan GithubPlus.Palette.BrightColor
--- @field white GithubPlus.Palette.BrightColor
--- @field pink GithubPlus.Palette.BrightColor
--- @field none string
--- @field diagnostics { hint: string, info: string, warn:string, error: string }
--- @field git { add:string, change:string, delete:string }
--- @field diff { add:string, change:string, delete:string, text:string }
--- @field ui GithubPlus.Palette.UI
local p = {
    black  = { base = '#282c33', bright = '#768390' },
    red    = { base = '#f47067', bright = '#ff938a' },
    green  = { base = '#57ab5a', bright = '#8edb8c' },
    yellow = { base = '#daaa3f', bright = '#f2cc60' },
    orange = { base = '#f69d50', bright = '#ffb86b' },
    blue   = { base = '#539bf5', bright = '#79c0ff' },
    purple = { base = '#b377cf', bright = '#dcbdfb' },
    cyan   = { base = '#96d0ff', bright = '#a5d6ff' },
    white  = { base = '#d1d7e0', bright = '#fbffff' },
    pink   = { base = '#e275ad', bright = '#ffb3d8' },
    none   = 'NONE'
}

p.bg = { base = p.black.base, bright = '#2d323b', dim = '#1c2128' }
p.fg = { base = p.white.base, dim = p.black.bright }

p.diagnostics = {
    hint = p.black.bright,
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
    selection = '#303a46',
    selection = '#454a56',
    search    = '#496380',
    visual    = '#3c444d',
    comment   = '#9198a1',
    line_nr   = '#4e5a5f',
    indent    = '#4e5054'
}

p.syntax = {
    types       = p.blue.bright,
    punctuation = '#b2b9c6',
    escape      = '#858c96'
}

p.diff = {
    add = '#2f4839',
    change = '#29384c',
    delete = '#57393c',
    text = p.ui.search
}

return p
