local config = require('github_plus.config')
local palette = require('github_plus.palette')
local M = {}

local function resolve_transparent(transparent, bg)
    if type(transparent) == 'table' then
        return transparent[bg] == true
    end
    return transparent == true
end

M.setup = config.setup

M.load = function()
    local bg = vim.o.background

    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    local p = palette.get(bg)
    local opts = vim.tbl_extend('force', config.opts, {
        transparent = resolve_transparent(config.opts.transparent, bg)
    })
    local groups = require('github_plus.groups').setup(p, opts)
    for group, setting in pairs(groups) do
        vim.api.nvim_set_hl(0, group, setting)
    end

    if config.opts.terminal_colors then
        require('github_plus.terminal').set_terminal_colors(p)
    end

    vim.o.termguicolors = true
    vim.g.colors_name = 'github_plus'

    -- reconcile: restore in case hi clear or terminal detection changed it
    vim.o.background = bg
end

return M
