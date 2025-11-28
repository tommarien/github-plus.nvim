local M = {}


--- @param highlight Highlight
--- @param styles? GithubPlus.Style
local applyStyles = function(highlight, styles)
    if not styles then
        return highlight
    end

    if styles.bold then
        highlight.bold = true
    end
    if styles.italic then
        highlight.italic = true
    end
    if styles.underline then
        highlight.underline = true
    end

    return highlight
end


--- @class Highlight
--- @field fg? string
--- @field bg? string
--- @field sp? string
--- @field bold? boolean
--- @field link? string
--- @field italic? boolean
--- @field underline? boolean
--- @field undercurl? boolean

--- @param p GithubPlus.Palette
--- @param opts GithubPlus.Options
M.setup = function(p, opts)
    ---@type table<string, Highlight>
    return {
        -- Editor highlights
        ColorColumn                   = { bg = p.bg.bright },
        Cursor                        = { fg = p.bg.base, bg = p.blue.base },
        CursorColumn                  = { bg = p.bg.bright },
        CursorLine                    = { bg = p.bg.bright },
        CursorLineNr                  = { fg = p.fg.base },
        CurSearch                     = { link = 'IncSearch' },
        Directory                     = { fg = p.blue.base },
        ErrorMsg                      = { fg = p.diagnostics.error },
        FloatBorder                   = { fg = p.ui.border, bg = p.bg.bright },
        FoldColumn                    = { fg = p.fg.dim, bg = p.bg.base },
        Folded                        = { fg = p.fg.dim, bg = p.bg.bright },
        IncSearch                     = { fg = p.bg.base, bg = p.orange.base, bold = true },
        LineNr                        = { fg = p.fg.dim },
        MatchParen                    = { fg = p.cyan.bright, bg = p.ui.visual, bold = true },
        ModeMsg                       = { fg = p.fg.base },
        MoreMsg                       = { fg = p.blue.base },
        NonText                       = { fg = p.fg.dim },
        Normal                        = { fg = p.fg.base, bg = opts.transparent and 'NONE' or p.bg.base },
        NormalFloat                   = { fg = p.fg.base, bg = p.bg.bright },
        Pmenu                         = { fg = p.fg.base, bg = p.bg.bright },
        PmenuSbar                     = { bg = p.bg.bright },
        PmenuSel                      = { bg = p.ui.selection },
        PmenuThumb                    = { bg = p.fg.dim },
        Question                      = { fg = p.blue.base },
        Search                        = { bg = p.ui.visual, fg = p.fg.base },
        SignColumn                    = { bg = opts.transparent and 'NONE' or p.bg.base },
        SpecialKey                    = { fg = p.fg.dim },
        StatusLine                    = { fg = p.fg.base, bg = p.bg.bright },
        StatusLineNC                  = { fg = p.fg.dim, bg = p.bg.bright },
        TabLine                       = { fg = p.fg.dim, bg = p.bg.bright },
        TabLineFill                   = { bg = p.bg.dim },
        TabLineSel                    = { fg = p.fg.base, bg = p.bg.base },
        Title                         = { fg = p.blue.base, bold = true },
        VertSplit                     = { fg = p.ui.border },
        Visual                        = { bg = p.ui.visual },
        WarningMsg                    = { fg = p.diagnostics.warn },
        Whitespace                    = { fg = p.fg.dim },
        WinSeparator                  = { fg = p.ui.border },
        Added                         = { fg = p.git.add, bg = p.diff.add, bold = true },
        Changed                       = { fg = p.git.change, bg = p.diff.change, bold = true },
        Removed                       = { fg = p.git.delete, bg = p.diff.delete, bold = true },

        -- Syntax highlighting
        Comment                       = applyStyles({ fg = p.ui.comment }, opts.styles.comments),
        Constant                      = { fg = p.cyan.bright },
        String                        = applyStyles({ fg = p.green.bright }, opts.styles.strings),
        Character                     = { fg = p.red.base }, -- TODO: should be aligned with rest
        Number                        = applyStyles({ fg = p.cyan.bright }, opts.styles.numbers),
        Float                         = { link = 'Number' },
        Boolean                       = { fg = p.cyan.bright },

        Identifier                    = { fg = p.fg.base },
        Function                      = { fg = p.purple.bright },

        Statement                     = { fg = p.red.base },
        Conditional                   = { fg = p.red.base },
        Repeat                        = { link = 'Conditional' },
        Label                         = { link = 'Conditional' }, -- case, default

        Operator                      = applyStyles({ fg = p.ui.punctuation }, opts.styles.operators),
        Keyword                       = applyStyles({ fg = p.red.base }, opts.styles.keywords),
        Exception                     = { fg = p.red.base },

        PreProc                       = { fg = p.red.base },
        Include                       = { link = 'PreProc' },
        Define                        = { link = 'PreProc' },
        Macro                         = { link = 'PreProc' },
        PreCondit                     = { link = 'PreProc' },

        Type                          = applyStyles({ fg = p.blue.bright }, opts.styles.types),
        Typedef                       = { link = 'Type' },
        Structure                     = { link = 'Type' },
        StorageClass                  = { link = 'Type' }, -- static, register

        Special                       = { fg = p.red.base },
        SpecialChar                   = { link = 'Special' },
        Tag                           = { fg = p.green.bright },
        Delimiter                     = { fg = p.fg.base },
        SpecialComment                = { link = 'Comment' }, -- special things inside comments
        Debug                         = { link = 'Special' },

        Underlined                    = { underline = true },
        bold                          = { bold = true },
        Italic                        = { italic = true },

        Error                         = { fg = p.diagnostics.error },
        Todo                          = { fg = p.purple.base, bold = true },
        Ignore                        = { fg = p.fg.dim },

        -- Treesitter highlights
        ['@text.literal']             = { fg = p.cyan.bright },
        ['@text.reference']           = { fg = p.blue.base },
        ['@text.title']               = { fg = p.blue.base, bold = true },
        ['@text.uri']                 = { fg = p.blue.base, underline = true },
        ['@text.underline']           = { underline = true },
        ['@text.todo']                = { fg = p.purple.base, bold = true },
        ['@comment']                  = { link = 'Comment' },
        ['@punctuation']              = { fg = p.ui.punctuation },
        ['@constant']                 = { link = 'Constant' },
        ['@constant.builtin']         = { link = '@constant' },
        ['@constant.macro']           = { link = '@constant' },
        ['@define']                   = { fg = p.red.base },
        ['@macro']                    = { fg = p.red.base },
        ['@string']                   = { link = 'String' },
        ['@string.escape']            = { fg = p.ui.escape },
        ['@string.special']           = { link = 'Special' },
        ['@character']                = { link = 'Character' },
        ['@character.special']        = { link = 'Character' },
        ['@number']                   = { link = 'Number' },
        ['@boolean']                  = { link = 'Boolean' },
        ['@float']                    = { link = 'Float' },
        ['@function']                 = { link = 'Function' },
        ['@function.builtin']         = { link = '@function' },
        ['@function.macro']           = { link = '@function' },
        ['@parameter']                = { fg = p.fg.base },
        ['@method']                   = { link = 'Function' },
        ['@field']                    = { fg = p.fg.base },
        ['@property']                 = { fg = p.fg.base },
        ['@constructor']              = { link = 'Function' },
        ['@conditional']              = { link = 'Conditional' },
        ['@repeat']                   = { fg = p.red.base },
        ['@label']                    = { fg = p.red.base },
        ['@operator']                 = { link = 'Operator' },
        ['@keyword']                  = { link = 'Keyword' },
        ['@module.go']                = { fg = p.fg.base },
        ['@exception']                = { fg = p.red.base },
        ['@variable']                 = { fg = p.fg.base },
        ['@variable.builtin']         = { fg = p.red.base },
        ['@variable.member']          = { fg = p.fg.base },
        ['@type']                     = { link = 'Type' },
        ['@type.definition']          = { link = 'Typedef' },
        ['@type.builtin']             = { link = 'Type' },
        ['@storageclass']             = { fg = p.red.base },
        ['@namespace']                = { fg = p.fg.base },
        ['@include']                  = { fg = p.red.base },
        ['@preproc']                  = { fg = p.red.base },
        ['@debug']                    = { fg = p.red.base },
        ['@tag']                      = { fg = p.blue.bright },
        ['@tag.attribute']            = { fg = p.fg.base },
        ['@tag.delimiter']            = { fg = p.fg.base },
        ['@tag.builtin']              = { link = 'Tag' },

        -- LSP highlights
        DiagnosticError               = { fg = p.diagnostics.error },
        DiagnosticWarn                = { fg = p.diagnostics.warn },
        DiagnosticInfo                = { fg = p.diagnostics.info },
        DiagnosticHint                = { fg = p.diagnostics.hint },
        DiagnosticUnnecessary         = { fg = p.ui.comment },
        DiagnosticUnderlineError      = { sp = p.diagnostics.error, undercurl = true },
        DiagnosticUnderlineWarn       = { sp = p.diagnostics.warn, undercurl = true },
        DiagnosticUnderlineInfo       = { sp = p.diagnostics.info, undercurl = true },
        DiagnosticUnderlineHint       = { sp = p.diagnostics.hint, undercurl = true },
        LspReferenceText              = { bg = p.ui.selection },
        LspReferenceRead              = { bg = p.ui.selection },
        LspReferenceWrite             = { bg = p.ui.selection },
        LspSignatureActiveParameter   = { fg = p.orange.base, bold = true },

        -- Git signs
        GitSignsAdd                   = { fg = p.git.add },
        GitSignsChange                = { fg = p.git.change },
        GitSignsDelete                = { fg = p.git.delete },

        -- Quickfix
        QuickFixLine                  = { bg = p.ui.selection, bold = true },
        qfLineNr                      = { link = 'LineNr' },
        qfFileName                    = { link = 'Directory' },

        -- Diff
        DiffviewAdd                   = { bg = p.diff.add, bold = true },
        DiffviewChange                = { bg = p.diff.change, bold = true },
        DiffviewDelete                = { bg = p.diff.delete, bold = true },
        DiffviewText                  = { bg = p.diff.text, bold = true },
        DiffAdd                       = { fg = p.git.add, bg = p.diff.add, bold = true },
        DiffChange                    = { bg = p.diff.change },
        DiffDelete                    = { fg = p.git.delete, bg = p.diff.delete },
        DiffText                      = { bg = p.diff.text },

        -- Telescope
        TelescopeBorder               = { fg = p.ui.border },
        TelescopePromptBorder         = { fg = p.ui.border },
        TelescopeResultsBorder        = { fg = p.ui.border },
        TelescopePreviewBorder        = { fg = p.ui.border },
        TelescopeSelection            = { bg = p.ui.selection },
        TelescopeMultiSelection       = { bg = p.ui.selection },

        -- Which-key
        WhichKey                      = { fg = p.purple.base },
        WhichKeyGroup                 = { fg = p.blue.base },
        WhichKeyDesc                  = { fg = p.fg.base },
        WhichKeySeparator             = { fg = p.ui.comment },
        WhichKeyFloat                 = { bg = p.bg.bright },

        -- Notify
        NotifyERRORBorder             = { fg = p.diagnostics.error },
        NotifyWARNBorder              = { fg = p.diagnostics.warn },
        NotifyINFOBorder              = { fg = p.diagnostics.info },
        NotifyDEBUGBorder             = { fg = p.diagnostics.hint },
        NotifyTRACEBorder             = { fg = p.purple.base },
        NotifyERRORIcon               = { fg = p.diagnostics.error },
        NotifyWARNIcon                = { fg = p.diagnostics.warn },
        NotifyINFOIcon                = { fg = p.diagnostics.info },
        NotifyDEBUGIcon               = { fg = p.diagnostics.hint },
        NotifyTRACEIcon               = { fg = p.purple.base },
        NotifyERRORTitle              = { fg = p.diagnostics.error },
        NotifyWARNTitle               = { fg = p.diagnostics.warn },
        NotifyINFOTitle               = { fg = p.diagnostics.info },
        NotifyDEBUGTitle              = { fg = p.diagnostics.hint },
        NotifyTRACETitle              = { fg = p.purple.base },

        -- Leap
        LeapMatch                     = { fg = p.bg.base, bg = p.purple.base, bold = true },
        LeapLabelPrimary              = { fg = p.bg.base, bg = p.pink.base, bold = true },
        LeapLabelSecondary            = { fg = p.bg.base, bg = p.cyan.bright, bold = true },
        LeapBackdrop                  = { fg = p.ui.comment },

        -- Blink.cmp
        BlinkCmpMenu                  = { fg = p.fg.base, bg = p.bg.bright },
        BlinkCmpMenuBorder            = { fg = p.ui.border, bg = p.bg.bright },

        BlinkCmpDoc                   = { fg = p.fg.base, bg = p.bg.bright },
        BlinkCmpDocBorder             = { link = 'FloatBorder' },
        BlinkCmpDocSeparator          = { link = 'FloatBorder' },

        BlinkCmpSource                = { link = 'Comment' },

        BlinkCmpLabel                 = { fg = p.fg.base },
        BlinkCmpLabelDeprecated       = { fg = p.fg.dim, strikethrough = true },
        BlinkCmpLabelMatch            = { fg = p.purple.base },
        BlinkCmpLabelDetail           = { fg = p.ui.comment },
        BlinkCmpLabelDescription      = { link = 'BlinkCmpLabelDetail' },

        BlinkCmpKind                  = { fg = p.fg.dim, },
        BlinkCmpKindKeyword           = { link = 'Keyword' },
        BlinkCmpKindVariable          = { link = '@variable' },
        BlinkCmpKindConstant          = { link = '@constant' },
        BlinkCmpKindReference         = { link = 'Keyword' },
        BlinkCmpKindValue             = { link = 'Keyword' },

        BlinkCmpKindFunction          = { link = 'Function' },
        BlinkCmpKindMethod            = { link = 'Function' },
        BlinkCmpKindConstructor       = { link = '@constructor' },
        BlinkCmpKindInterface         = { link = 'Constant' },
        BlinkCmpKindEvent             = { link = 'Constant' },
        BlinkCmpKindEnum              = { link = 'Constant' },
        BlinkCmpKindUnit              = { link = 'Constant' },
        BlinkCmpKindClass             = { link = 'Type' },
        BlinkCmpKindStruct            = { link = 'Type' },
        BlinkCmpKindModule            = { link = '@module' },
        BlinkCmpKindProperty          = { link = '@property' },
        BlinkCmpKindField             = { link = '@variable.member' },
        BlinkCmpKindTypeParameter     = { link = '@variable.member' },
        BlinkCmpKindEnumMember        = { link = '@variable.member' },
        BlinkCmpKindOperator          = { link = 'Operator' },
        BlinkCmpKindSnippet           = { fg = p.fg.dim },

        -- Snacks nvim
        SnacksPicker                  = { link = 'Normal' },
        SnacksPickerBorder            = { fg = p.ui.border },
        SnacksPickerDir               = { fg = p.none, bg = p.none, nocombine = true },
        SnacksPickerDirectory         = { fg = p.none, bg = p.none, nocombine = true },
        SnacksIndent                  = { fg = p.ui.comment, bg = p.none, nocombine = true },
        SnacksPickerListCursorLine    = { link = 'PmenuSel' },
        SnacksPickerPreviewCursorLine = { fg = p.none, bg = p.none, nocombine = true },

        -- Treesitter Context
        TreesitterContext             = { bg = p.bg.base },
        TreesitterContextBottom       = { sp = p.ui.visual, underline = true },

        -- Oil
        OilHidden                     = { fg = p.ui.comment }
    }
end

return M
