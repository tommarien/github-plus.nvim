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
    local semantic = opts.semantic

    ---@type table<string, Highlight>
    return {
        -- Editor highlights
        ColorColumn                       = { bg = p.bg.emphasis },
        Cursor                            = { fg = p.bg.base, bg = p.blue.base },
        CursorColumn                      = { bg = p.ui.cursorline },
        CursorLine                        = { bg = p.ui.cursorline },
        CursorLineNr                      = { fg = p.fg.base },
        CurSearch                         = { link = 'IncSearch' },
        Directory                         = { fg = p.blue.base },
        ErrorMsg                          = { fg = p.diagnostics.error },
        FoldColumn                        = { fg = p.fg.muted, bg = p.bg.base },
        Folded                            = { fg = p.fg.muted, bg = p.bg.emphasis },
        IncSearch                         = { fg = p.bg.base, bg = p.orange.base, bold = true },
        LineNr                            = { fg = p.ui.line_nr },
        MatchParen                        = { fg = p.fg.base, bg = p.ui.visual },
        ModeMsg                           = { fg = p.fg.base },
        MoreMsg                           = { fg = p.blue.base },
        NonText                           = { fg = p.fg.muted },
        Normal                            = { fg = p.fg.base, bg = opts.transparent and 'NONE' or p.bg.base },
        NormalFloat                       = { fg = p.fg.base, bg = p.bg.muted },
        FloatBorder                       = { fg = p.ui.border, bg = p.bg.muted },
        Pmenu                             = { fg = p.fg.base, bg = p.bg.base },
        PmenuSbar                         = { bg = p.bg.emphasis },
        PmenuSel                          = { bg = p.ui.selection },
        PmenuThumb                        = { bg = p.fg.muted },
        Question                          = { fg = p.blue.base },
        Search                            = { bg = p.ui.visual, fg = p.fg.base },
        SignColumn                        = { bg = opts.transparent and 'NONE' or p.bg.base },
        SpecialKey                        = { fg = p.fg.muted },
        StatusLine                        = { fg = p.fg.base, bg = p.bg.emphasis },
        StatusLineNC                      = { fg = p.fg.muted, bg = p.bg.emphasis },
        TabLine                           = { fg = p.fg.muted, bg = p.bg.emphasis },
        TabLineFill                       = { bg = p.bg.muted },
        TabLineSel                        = { fg = p.fg.base, bg = p.bg.base },
        Title                             = { fg = p.blue.base, bold = true },
        VertSplit                         = { fg = p.ui.border },
        Visual                            = { bg = p.ui.visual },
        WarningMsg                        = { fg = p.diagnostics.warn },
        Whitespace                        = { fg = p.fg.muted },
        WinSeparator                      = { fg = p.ui.border },
        Added                             = { fg = p.git.add, bg = p.diff.add, bold = true },
        Changed                           = { fg = p.git.change, bg = p.diff.change, bold = true },
        Removed                           = { fg = p.git.delete, bg = p.diff.delete, bold = true },

        -- Syntax highlighting
        Comment                           = applyStyles({ fg = p.ui.comment }, opts.styles.comments),
        Constant                          = { fg = p.cyan.emphasis },
        String                            = applyStyles({ fg = p.green.emphasis }, opts.styles.strings),
        Character                         = { link = 'String' },
        Number                            = applyStyles({ fg = p.cyan.emphasis }, opts.styles.numbers),
        Float                             = { link = 'Number' },
        Boolean                           = { fg = p.cyan.emphasis },

        Identifier                        = { fg = p.fg.base },
        Function                          = applyStyles({ fg = p.purple.emphasis }, opts.styles.functions),

        Statement                         = { fg = p.red.base },
        Conditional                       = applyStyles({ fg = p.red.base }, opts.styles.conditionals),
        Repeat                            = { link = 'Conditional' },
        Label                             = { link = 'Conditional' }, -- case, default

        Operator                          = applyStyles({ fg = p.red.base }, opts.styles.operators),
        Keyword                           = applyStyles({ fg = p.red.base }, opts.styles.keywords),
        Exception                         = { fg = p.red.base },

        PreProc                           = { fg = p.red.base },
        Include                           = { link = 'PreProc' },
        Define                            = { link = 'PreProc' },
        Macro                             = { link = 'PreProc' },
        PreCondit                         = { link = 'PreProc' },

        Type                              = applyStyles({ fg = p.syntax.types }, opts.styles.types),
        Typedef                           = { link = 'Type' },
        Structure                         = { link = 'Type' },
        StorageClass                      = { link = 'Type' }, -- static, register

        -- Special                       = { fg = p.red.base },
        Special                           = { fg = p.red.base },
        SpecialChar                       = { link = 'Special' },
        Tag                               = { fg = p.green.emphasis },
        Delimiter                         = { fg = p.fg.base },
        SpecialComment                    = { link = 'Comment' }, -- special things inside comments
        Debug                             = { link = 'Special' },

        Underlined                        = { underline = true },
        bold                              = { bold = true },
        Italic                            = { italic = true },

        Error                             = { fg = p.diagnostics.error },
        Todo                              = { fg = p.blue.base, bold = true },
        Ignore                            = { fg = p.fg.muted },

        -- Treesitter highlights
        ['@text.literal']                 = { fg = p.cyan.emphasis },
        ['@text.reference']               = { fg = p.blue.base },
        ['@text.title']                   = { fg = p.blue.base, bold = true },
        ['@text.uri']                     = { fg = p.blue.base, underline = true },
        ['@text.underline']               = { underline = true },
        ['@text.todo']                    = { fg = p.purple.base, bold = true },
        ['@comment']                      = { link = 'Comment' },
        ['@punctuation']                  = { fg = p.syntax.punctuation },
        ['@punctuation.special.markdown'] = { fg = p.fg.base },
        ['@constant']                     = { link = 'Constant' },
        ['@constant.builtin']             = { link = '@constant' },
        ['@constant.macro']               = { link = '@constant' },
        ['@define']                       = { fg = p.red.base },
        ['@macro']                        = { fg = p.red.base },
        ['@string']                       = { link = 'String' },
        ['@string.escape']                = { fg = p.syntax.escape },
        ['@string.regexp']                = { link = 'String' },
        ['@string.special']               = { link = 'Special' },
        ['@string.special.path']          = { link = 'Directory' },
        ['@string.special.url']           = { fg = p.blue.base },
        ['@character']                    = { link = 'Character' },
        ['@number']                       = { link = 'Number' },
        ['@boolean']                      = { link = 'Boolean' },
        ['@float']                        = { link = 'Float' },
        ['@function']                     = { link = 'Function' },
        ['@function.builtin']             = { link = '@function' },
        ['@function.macro']               = { link = '@function' },
        ['@parameter']                    = { fg = p.fg.base },
        ['@method']                       = { link = 'Function' },
        ['@field']                        = { fg = p.fg.base },
        ['@property']                     = { fg = semantic and p.syntax.property or p.fg.base },
        ['@constructor']                  = { link = 'Function' },
        ['@conditional']                  = { link = 'Conditional' },
        ['@repeat']                       = { fg = p.red.base },
        ['@label']                        = { fg = p.red.base },
        ['@operator']                     = { link = 'Operator' },
        ['@keyword']                      = { link = 'Keyword' },
        ['@keyword.conditional']          = { link = 'Conditional' },
        ['@module.go']                    = { fg = p.fg.base },
        ['@exception']                    = { fg = p.red.base },
        ['@variable']                     = { fg = p.fg.base },
        ['@variable.builtin']             = { fg = p.red.base },
        ['@variable.member']              = { fg = semantic and p.syntax.property or p.fg.base },
        ['@type']                         = { link = 'Type' },
        ['@type.definition']              = { link = 'Typedef' },
        ['@type.builtin']                 = { link = 'Type' },
        ['@storageclass']                 = { fg = p.red.base },
        ['@namespace']                    = { fg = p.fg.base },
        ['@include']                      = { fg = p.red.base },
        ['@preproc']                      = { fg = p.red.base },
        ['@debug']                        = { fg = p.red.base },
        ['@tag']                          = { fg = p.blue.emphasis },
        ['@tag.attribute']                = { fg = p.fg.base },
        ['@tag.delimiter']                = { fg = p.fg.base },
        ['@tag.builtin']                  = { link = 'Tag' },

        -- Markdown
        ['@markup.italic']                = { italic = true },
        ['@markup.strong']                = { bold = true },
        ['@markup.strikethrough']         = { strikethrough = true },
        ['@markup.underline']             = { underline = true },

        ['@markup.heading']               = { fg = p.syntax.markup },

        ['@markup.link']                  = { fg = p.syntax.markup },
        ['@markup.link.label']            = { fg = p.syntax.markup },
        ['@markup.link.url']              = { fg = p.blue.base },

        ['@markup.quote.markdown']        = { fg = p.fg.base },
        ['@markup.raw.block']             = { fg = p.fg.base },
        ['@markup.raw.markdown_inline']   = { fg = p.green.emphasis },

        -- LSP highlights
        DiagnosticError                   = { fg = p.diagnostics.error },
        DiagnosticWarn                    = { fg = p.diagnostics.warn },
        DiagnosticInfo                    = { fg = p.diagnostics.info },
        DiagnosticHint                    = { fg = p.diagnostics.hint },
        DiagnosticUnnecessary             = { fg = p.ui.comment },
        DiagnosticUnderlineError          = { sp = p.diagnostics.error, undercurl = true },
        DiagnosticUnderlineWarn           = { sp = p.diagnostics.warn, undercurl = true },
        DiagnosticUnderlineInfo           = { sp = p.diagnostics.info, undercurl = true },
        DiagnosticUnderlineHint           = { sp = p.diagnostics.hint, undercurl = true },
        LspReferenceText                  = { bg = p.ui.reference },
        LspReferenceRead                  = { bg = p.ui.reference },
        LspReferenceWrite                 = { bg = p.ui.reference },
        LspSignatureActiveParameter       = { fg = p.orange.base, bold = true },

        -- Git signs
        GitSignsAdd                       = { fg = p.git.add },
        GitSignsChange                    = { fg = p.git.change },
        GitSignsDelete                    = { fg = p.git.delete },

        -- Quickfix
        QuickFixLine                      = { bg = p.ui.selection, bold = true },
        qfLineNr                          = { link = 'LineNr' },
        qfFileName                        = { link = 'Directory' },

        -- Diff
        DiffviewAdd                       = { bg = p.diff.add, bold = true },
        DiffviewChange                    = { bg = p.diff.change, bold = true },
        DiffviewDelete                    = { bg = p.diff.delete, bold = true },
        DiffviewText                      = { bg = p.diff.text, bold = true },
        DiffAdd                           = { bg = p.diff.add, bold = true },
        DiffChange                        = { bg = p.diff.change },
        DiffDelete                        = { bg = p.diff.delete },
        DiffText                          = { bg = p.diff.text },

        -- Telescope
        TelescopeBorder                   = { fg = p.ui.border },
        TelescopePromptBorder             = { fg = p.ui.border },
        TelescopeResultsBorder            = { fg = p.ui.border },
        TelescopePreviewBorder            = { fg = p.ui.border },
        TelescopeSelection                = { link = 'PmenuSel' },
        TelescopeMatching                 = { fg = p.blue.base, bold = true },
        TelescopeMultiSelection           = { bg = p.ui.selection },

        -- Which-key
        WhichKey                          = { fg = p.purple.base },
        WhichKeyGroup                     = { fg = p.blue.base },
        WhichKeyDesc                      = { fg = p.fg.base },
        WhichKeySeparator                 = { fg = p.ui.comment },
        WhichKeyFloat                     = { bg = p.bg.emphasis },

        -- Notify
        NotifyERRORBorder                 = { fg = p.diagnostics.error },
        NotifyWARNBorder                  = { fg = p.diagnostics.warn },
        NotifyINFOBorder                  = { fg = p.diagnostics.info },
        NotifyDEBUGBorder                 = { fg = p.diagnostics.hint },
        NotifyTRACEBorder                 = { fg = p.purple.base },
        NotifyERRORIcon                   = { fg = p.diagnostics.error },
        NotifyWARNIcon                    = { fg = p.diagnostics.warn },
        NotifyINFOIcon                    = { fg = p.diagnostics.info },
        NotifyDEBUGIcon                   = { fg = p.diagnostics.hint },
        NotifyTRACEIcon                   = { fg = p.purple.base },
        NotifyERRORTitle                  = { fg = p.diagnostics.error },
        NotifyWARNTitle                   = { fg = p.diagnostics.warn },
        NotifyINFOTitle                   = { fg = p.diagnostics.info },
        NotifyDEBUGTitle                  = { fg = p.diagnostics.hint },
        NotifyTRACETitle                  = { fg = p.purple.base },

        -- Leap
        LeapMatch                         = { fg = p.bg.base, bg = p.purple.base, bold = true },
        LeapLabelPrimary                  = { fg = p.bg.base, bg = p.orange.base, bold = true },
        LeapLabelSecondary                = { fg = p.bg.base, bg = p.cyan.emphasis, bold = true },
        LeapBackdrop                      = { fg = p.ui.comment },

        -- Blink.cmp
        BlinkCmpMenu                      = { fg = p.fg.base, bg = p.bg.base },
        BlinkCmpMenuBorder                = { link = 'FloatBorder' },
        BlinkCmpMenuSelection             = { link = 'PmenuSel' },

        BlinkCmpDoc                       = { fg = p.fg.base, bg = p.bg.emphasis },
        BlinkCmpDocBorder                 = { link = 'FloatBorder' },
        BlinkCmpDocSeparator              = { link = 'FloatBorder' },

        BlinkCmpSource                    = { link = 'Comment' },

        BlinkCmpLabel                     = { fg = p.fg.base },
        BlinkCmpLabelDeprecated           = { fg = p.fg.muted, strikethrough = true },
        BlinkCmpLabelMatch                = { bold = true },
        BlinkCmpLabelDetail               = { fg = p.ui.comment },
        BlinkCmpLabelDescription          = { link = 'BlinkCmpLabelDetail' },

        BlinkCmpKind                      = { fg = p.fg.muted, },
        BlinkCmpKindKeyword               = { link = 'Keyword' },
        BlinkCmpKindVariable              = { link = '@variable' },
        BlinkCmpKindConstant              = { link = '@constant' },
        BlinkCmpKindReference             = { link = 'Keyword' },
        BlinkCmpKindValue                 = { link = 'Keyword' },

        BlinkCmpKindFunction              = { link = 'Function' },
        BlinkCmpKindMethod                = { link = 'Function' },
        BlinkCmpKindConstructor           = { link = '@constructor' },
        BlinkCmpKindInterface             = { link = 'Constant' },
        BlinkCmpKindEvent                 = { link = 'Constant' },
        BlinkCmpKindEnum                  = { link = 'Constant' },
        BlinkCmpKindUnit                  = { link = 'Constant' },
        BlinkCmpKindClass                 = { link = 'Type' },
        BlinkCmpKindStruct                = { link = 'Type' },
        BlinkCmpKindModule                = { link = '@module' },
        BlinkCmpKindProperty              = { link = '@property' },
        BlinkCmpKindField                 = { link = '@variable.member' },
        BlinkCmpKindTypeParameter         = { link = '@variable.member' },
        BlinkCmpKindEnumMember            = { link = '@variable.member' },
        BlinkCmpKindOperator              = { link = 'Operator' },
        BlinkCmpKindSnippet               = { fg = p.fg.muted },

        -- nvim-cmp
        CmpItemAbbr                       = { fg = p.fg.base },
        CmpItemAbbrDeprecated             = { fg = p.fg.muted, strikethrough = true },
        CmpItemAbbrMatch                  = { bold = true },
        CmpItemAbbrMatchFuzzy             = { bold = true },
        CmpItemMenu                       = { link = 'Comment' },

        CmpItemKind                       = { fg = p.fg.muted },
        CmpItemKindKeyword                = { link = 'Keyword' },
        CmpItemKindVariable               = { link = '@variable' },
        CmpItemKindConstant               = { link = '@constant' },
        CmpItemKindReference              = { link = 'Keyword' },
        CmpItemKindValue                  = { link = 'Keyword' },

        CmpItemKindFunction               = { link = 'Function' },
        CmpItemKindMethod                 = { link = 'Function' },
        CmpItemKindConstructor            = { link = '@constructor' },
        CmpItemKindInterface              = { link = 'Constant' },
        CmpItemKindEvent                  = { link = 'Constant' },
        CmpItemKindEnum                   = { link = 'Constant' },
        CmpItemKindUnit                   = { link = 'Constant' },
        CmpItemKindClass                  = { link = 'Type' },
        CmpItemKindStruct                 = { link = 'Type' },
        CmpItemKindModule                 = { link = '@module' },
        CmpItemKindProperty               = { link = '@property' },
        CmpItemKindField                  = { link = '@variable.member' },
        CmpItemKindTypeParameter          = { link = '@variable.member' },
        CmpItemKindEnumMember             = { link = '@variable.member' },
        CmpItemKindOperator               = { link = 'Operator' },
        CmpItemKindSnippet                = { fg = p.fg.muted },

        -- Snacks nvim
        SnacksPicker                      = { link = 'Normal' },
        SnacksPickerBorder                = { fg = p.ui.border },
        SnacksPickerDir                   = { fg = p.none, bg = p.none, nocombine = true },
        SnacksPickerDirectory             = { fg = p.none, bg = p.none, nocombine = true },
        SnacksIndent                      = { fg = p.ui.indent, bg = p.none, nocombine = true },
        SnacksPickerListCursorLine        = { link = 'PmenuSel' },
        SnacksPickerPreviewCursorLine     = { fg = p.none, bg = p.none, nocombine = true },

        -- Treesitter Context
        TreesitterContext                 = { bg = p.bg.base },
        TreesitterContextBottom           = { sp = p.ui.visual, underline = true },

        -- Oil
        OilHidden                         = { fg = p.ui.comment }
    }
end

return M
