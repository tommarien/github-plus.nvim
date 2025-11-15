local M = {}

--- @class Highlight
--- @field fg? string
--- @field bg? string
--- @field sp? string
--- @field bold? boolean
--- @field link? string


--- @param p GithubPlus.Palette
--- @param opts GithubPlus.Options
M.setup = function(p, opts)
    ---@type table<string, Highlight>
    return {
        -- Editor highlights
        ColorColumn                 = { bg = p.bg.bright },
        Cursor                      = { fg = p.bg.base, bg = p.blue.base },
        CursorColumn                = { bg = p.bg.bright },
        CursorLine                  = { bg = p.bg.bright },
        CursorLineNr                = { fg = p.fg.base },
        CurSearch                   = { link = 'IncSearch' },
        Directory                   = { fg = p.blue.base },
        ErrorMsg                    = { fg = p.diagnostics.error },
        FloatBorder                 = { fg = p.ui.border, bg = p.bg.bright },
        FoldColumn                  = { fg = p.fg.dim, bg = p.bg.base },
        Folded                      = { fg = p.fg.dim, bg = p.bg.bright },
        IncSearch                   = { fg = p.bg.base, bg = p.orange.base, bold = true },
        LineNr                      = { fg = p.fg.dim },
        MatchParen                  = { fg = p.cyan.bright, bg = p.ui.visual, bold = true },
        ModeMsg                     = { fg = p.fg.base },
        MoreMsg                     = { fg = p.blue.base },
        NonText                     = { fg = p.fg.dim },
        Normal                      = { fg = p.fg.base, bg = opts.transparent and 'NONE' or p.bg.base },
        NormalFloat                 = { fg = p.fg.base, bg = p.bg.bright },
        Pmenu                       = { fg = p.fg.base, bg = p.bg.bright },
        PmenuSbar                   = { bg = p.bg.bright },
        PmenuSel                    = { bg = p.ui.selection },
        PmenuThumb                  = { bg = p.fg.dim },
        Question                    = { fg = p.blue.base },
        Search                      = { bg = p.ui.search, fg = p.fg.base },
        SignColumn                  = { bg = p.bg.base },
        SpecialKey                  = { fg = p.fg.dim },
        StatusLine                  = { fg = p.fg.base, bg = p.bg.bright },
        StatusLineNC                = { fg = p.fg.dim, bg = p.bg.bright },
        TabLine                     = { fg = p.fg.dim, bg = p.bg.bright },
        TabLineFill                 = { bg = p.bg.dim },
        TabLineSel                  = { fg = p.fg.base, bg = p.bg.base },
        Title                       = { fg = p.blue.base, bold = true },
        VertSplit                   = { fg = p.ui.border },
        Visual                      = { bg = p.ui.visual },
        WarningMsg                  = { fg = p.diagnostics.warn },
        Whitespace                  = { fg = p.fg.dim },
        WinSeparator                = { fg = p.ui.border },
        Added                       = { fg = p.git.add, bg = p.diff.add, bold = true },
        Changed                     = { fg = p.git.change, bg = p.diff.change, bold = true },
        Removed                     = { fg = p.git.delete, bg = p.diff.delete, bold = true },

        -- Syntax highlighting
        Boolean                     = { fg = p.cyan.bright },
        Character                   = { fg = p.red.base },
        Comment                     = vim.tbl_extend('force', { fg = p.ui.comment }, opts.styles.comments),
        Conditional                 = { fg = p.red.base },
        Constant                    = { fg = p.cyan.bright },
        Debug                       = { fg = p.red.base },
        Define                      = { fg = p.red.base },
        Delimiter                   = { fg = p.fg.base },
        Error                       = { fg = p.diagnostics.error },
        Exception                   = { fg = p.red.base },
        Float                       = { fg = p.cyan.bright },
        Function                    = { fg = p.purple.bright },
        Identifier                  = { fg = p.fg.base },
        Ignore                      = { fg = p.fg.dim },
        Include                     = { fg = p.red.base },
        Keyword                     = { fg = p.red.base },
        Label                       = { fg = p.red.base },
        Macro                       = { fg = p.red.base },
        Number                      = { fg = p.cyan.bright },
        Operator                    = { fg = p.ui.operator },
        PreCondit                   = { fg = p.red.base },
        PreProc                     = { fg = p.red.base },
        Repeat                      = { fg = p.red.base },
        Special                     = { fg = p.red.base },
        SpecialChar                 = { fg = p.red.base },
        SpecialComment              = { link = 'Comment' },
        Statement                   = { fg = p.red.base },
        StorageClass                = { fg = p.red.base },
        String                      = vim.tbl_extend('force', { fg = p.green.bright }, opts.styles.strings),
        Structure                   = { fg = p.purple.bright },
        Tag                         = { fg = p.green.bright },
        Todo                        = { fg = p.purple.base, bold = true },
        Type                        = { fg = p.blue.bright },
        Typedef                     = { link = 'Type' },
        Underlined                  = { fg = p.blue.base, underline = true },

        -- Treesitter highlights
        ['@text.literal']           = { fg = p.cyan.bright },
        ['@text.reference']         = { fg = p.blue.base },
        ['@text.title']             = { fg = p.blue.base, bold = true },
        ['@text.uri']               = { fg = p.blue.base, underline = true },
        ['@text.underline']         = { underline = true },
        ['@text.todo']              = { fg = p.purple.base, bold = true },
        ['@comment']                = { link = 'Comment' },
        ['@punctuation']            = { fg = p.ui.operator },
        ['@constant']               = { link = 'Constant' },
        ['@constant.builtin']       = { link = '@constant' },
        ['@constant.macro']         = { link = '@constant' },
        ['@define']                 = { fg = p.red.base },
        ['@macro']                  = { fg = p.red.base },
        ['@string']                 = { link = 'String' },
        ['@string.escape']          = { fg = p.ui.escape },
        ['@string.special']         = { link = 'Special' },
        ['@character']              = { link = 'Character' },
        ['@character.special']      = { link = 'Character' },
        ['@number']                 = { link = 'Number' },
        ['@boolean']                = { link = 'Boolean' },
        ['@float']                  = { link = 'Float' },
        ['@function']               = { link = 'Function' },
        ['@function.builtin']       = { link = '@function' },
        ['@function.macro']         = { link = '@function' },
        ['@parameter']              = { fg = p.fg.base },
        ['@method']                 = { link = 'Function' },
        ['@field']                  = { fg = p.fg.base },
        ['@property']               = { fg = p.fg.base },
        ['@constructor']            = { link = 'Function' },
        ['@conditional']            = { fg = p.red.base },
        ['@repeat']                 = { fg = p.red.base },
        ['@label']                  = { fg = p.red.base },
        ['@operator']               = { link = 'Operator' },
        ['@keyword']                = { link = 'Keyword' },
        ['@module.go']              = { fg = p.fg.base },
        ['@exception']              = { fg = p.red.base },
        ['@variable']               = { fg = p.fg.base },
        ['@variable.builtin']       = { fg = p.red.base },
        ['@variable.member']        = { fg = p.fg.base },
        ['@type']                   = { link = 'Type' },
        ['@type.definition']        = { link = 'Typedef' },
        ['@type.builtin']           = { link = 'Type' },
        ['@storageclass']           = { fg = p.red.base },
        ['@namespace']              = { fg = p.fg.base },
        ['@include']                = { fg = p.red.base },
        ['@preproc']                = { fg = p.red.base },
        ['@debug']                  = { fg = p.red.base },
        ['@tag']                    = { fg = p.blue.bright },
        ['@tag.attribute']          = { fg = p.fg.base },
        ['@tag.delimiter']          = { fg = p.fg.base },
        ['@tag.builtin']            = { link = 'Tag' },

        -- LSP highlights
        DiagnosticError             = { fg = p.diagnostics.error },
        DiagnosticWarn              = { fg = p.diagnostics.warn },
        DiagnosticInfo              = { fg = p.diagnostics.info },
        DiagnosticHint              = { fg = p.diagnostics.hint },
        DiagnosticUnnecessary       = { fg = p.ui.comment },
        DiagnosticUnderlineError    = { sp = p.diagnostics.error, undercurl = true },
        DiagnosticUnderlineWarn     = { sp = p.diagnostics.warn, undercurl = true },
        DiagnosticUnderlineInfo     = { sp = p.diagnostics.info, undercurl = true },
        DiagnosticUnderlineHint     = { sp = p.diagnostics.hint, undercurl = true },
        LspReferenceText            = { bg = p.ui.selection },
        LspReferenceRead            = { bg = p.ui.selection },
        LspReferenceWrite           = { bg = p.ui.selection },
        LspSignatureActiveParameter = { fg = p.orange.base, bold = true },

        -- Git signs
        GitSignsAdd                 = { fg = p.git.add },
        GitSignsChange              = { fg = p.git.change },
        GitSignsDelete              = { fg = p.git.delete },

        -- Quickfix
        QuickFixLine                = { bg = p.ui.selection, bold = true },
        qfLineNr                    = { link = 'LineNr' },
        qfFileName                  = { link = 'Directory' },

        -- Diff
        DiffviewAdd                 = { bg = p.diff.add, bold = true },
        DiffviewChange              = { bg = p.diff.change, bold = true },
        DiffviewDelete              = { bg = p.diff.delete, bold = true },
        DiffviewText                = { bg = p.diff.text, bold = true },
        DiffAdd                     = { fg = p.git.add, bg = p.diff.add, bold = true },
        DiffChange                  = { bg = p.diff.change },
        DiffDelete                  = { fg = p.git.delete, bg = p.diff.delete },
        DiffText                    = { bg = p.diff.text },

        -- Telescope
        TelescopeBorder             = { fg = p.ui.border },
        TelescopePromptBorder       = { fg = p.ui.border },
        TelescopeResultsBorder      = { fg = p.ui.border },
        TelescopePreviewBorder      = { fg = p.ui.border },
        TelescopeSelection          = { bg = p.ui.selection },
        TelescopeMultiSelection     = { bg = p.ui.selection },

        -- NvimTree
        NvimTreeNormal              = { fg = p.fg.base, bg = p.bg.dim },
        NvimTreeFolderName          = { fg = p.blue.base },
        NvimTreeFolderIcon          = { fg = p.blue.base },
        NvimTreeOpenedFolderName    = { fg = p.blue.base },
        NvimTreeRootFolder          = { fg = p.purple.base, bold = true },
        NvimTreeGitDirty            = { fg = p.git.change },
        NvimTreeGitNew              = { fg = p.git.add },
        NvimTreeGitDeleted          = { fg = p.git.delete },

        -- Which-key
        WhichKey                    = { fg = p.purple.base },
        WhichKeyGroup               = { fg = p.blue.base },
        WhichKeyDesc                = { fg = p.fg.base },
        WhichKeySeparator           = { fg = p.ui.comment },
        WhichKeyFloat               = { bg = p.bg.bright },

        -- Indent-blankline
        IndentBlanklineChar         = { fg = p.ui.border },
        IndentBlanklineContextChar  = { fg = p.fg.dim },

        -- Dashboard
        DashboardHeader             = { fg = p.purple.base },
        DashboardCenter             = { fg = p.blue.base },
        DashboardShortCut           = { fg = p.cyan.bright },
        DashboardFooter             = { fg = p.ui.comment },

        -- Notify
        NotifyERRORBorder           = { fg = p.diagnostics.error },
        NotifyWARNBorder            = { fg = p.diagnostics.warn },
        NotifyINFOBorder            = { fg = p.diagnostics.info },
        NotifyDEBUGBorder           = { fg = p.diagnostics.hint },
        NotifyTRACEBorder           = { fg = p.purple.base },
        NotifyERRORIcon             = { fg = p.diagnostics.error },
        NotifyWARNIcon              = { fg = p.diagnostics.warn },
        NotifyINFOIcon              = { fg = p.diagnostics.info },
        NotifyDEBUGIcon             = { fg = p.diagnostics.hint },
        NotifyTRACEIcon             = { fg = p.purple.base },
        NotifyERRORTitle            = { fg = p.diagnostics.error },
        NotifyWARNTitle             = { fg = p.diagnostics.warn },
        NotifyINFOTitle             = { fg = p.diagnostics.info },
        NotifyDEBUGTitle            = { fg = p.diagnostics.hint },
        NotifyTRACETitle            = { fg = p.purple.base },

        -- Neo-tree
        NeoTreeNormal               = { fg = p.fg.base, bg = p.bg.dim },
        NeoTreeNormalNC             = { fg = p.fg.base, bg = p.bg.dim },
        NeoTreeDirectoryName        = { fg = p.blue.base },
        NeoTreeDirectoryIcon        = { fg = p.blue.base },
        NeoTreeRootName             = { fg = p.purple.base, bold = true },
        NeoTreeGitAdded             = { fg = p.git.add },
        NeoTreeGitModified          = { fg = p.git.change },
        NeoTreeGitDeleted           = { fg = p.git.delete },

        -- Cmp (completion menu)
        CmpItemAbbrMatch            = { fg = p.blue.base },
        CmpItemAbbrMatchFuzzy       = { fg = p.blue.base },
        CmpItemKindVariable         = { fg = p.fg.base },
        CmpItemKindInterface        = { fg = p.orange.base },
        CmpItemKindText             = { fg = p.fg.base },
        CmpItemKindFunction         = { fg = p.purple.base },
        CmpItemKindMethod           = { fg = p.purple.base },
        CmpItemKindKeyword          = { fg = p.red.base },
        CmpItemKindProperty         = { fg = p.fg.base },
        CmpItemKindUnit             = { fg = p.blue.base },

        -- Bufferline
        BufferLineFill              = { bg = p.bg.dim },
        BufferLineBackground        = { fg = p.fg.dim, bg = p.bg.dim },
        BufferLineBuffer            = { fg = p.fg.dim, bg = p.bg.dim },
        BufferLineBufferSelected    = { fg = p.fg.base, bg = p.bg.base, bold = true },
        BufferLineBufferVisible     = { fg = p.fg.base, bg = p.bg.bright },
        BufferLineTab               = { fg = p.fg.dim, bg = p.bg.dim },
        BufferLineTabSelected       = { fg = p.fg.base, bg = p.bg.base },
        BufferLineTabClose          = { fg = p.red.base, bg = p.bg.dim },

        -- Leap
        LeapMatch                   = { fg = p.bg.base, bg = p.purple.base, bold = true },
        LeapLabelPrimary            = { fg = p.bg.base, bg = p.pink.base, bold = true },
        LeapLabelSecondary          = { fg = p.bg.base, bg = p.cyan.bright, bold = true },
        LeapBackdrop                = { fg = p.ui.comment },

        -- Blink.cmp
        BlinkCmpMenu                = { fg = p.fg.base, bg = p.bg.bright },
        BlinkCmpMenuBorder          = { fg = p.ui.border, bg = p.bg.bright },

        BlinkCmpDoc                 = { fg = p.fg.base, bg = p.bg.bright },
        BlinkCmpDocBorder           = { link = 'FloatBorder' },
        BlinkCmpDocSeparator        = { link = 'FloatBorder' },

        BlinkCmpSource              = { link = 'Comment' },

        BlinkCmpLabel               = { fg = p.fg.base },
        BlinkCmpLabelDeprecated     = { fg = p.fg.dim, strikethrough = true },
        BlinkCmpLabelMatch          = { fg = p.purple.base },
        BlinkCmpLabelDetail         = { fg = p.ui.comment },
        BlinkCmpLabelDescription    = { link = 'BlinkCmpLabelDetail' },

        BlinkCmpKind                = { fg = p.fg.dim, },
        BlinkCmpKindKeyword         = { link = 'Keyword' },
        BlinkCmpKindVariable        = { link = '@variable' },
        BlinkCmpKindConstant        = { link = '@constant' },
        BlinkCmpKindReference       = { link = 'Keyword' },
        BlinkCmpKindValue           = { link = 'Keyword' },


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
