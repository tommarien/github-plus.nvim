local config = require('github_plus.config')
local palette = require('github_plus.palette')
local M = {}

M.setup = config.setup

M.load = function()
    vim.o.termguicolors = true
    vim.g.colors_name = 'github_plus'

    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    local groups = require('github_plus.groups').setup(palette, config.opts)
    for group, setting in pairs(groups) do
        vim.api.nvim_set_hl(0, group, setting)
    end

    if config.opts.terminal_colors then
        require('github_plus.terminal').set_terminal_colors(palette)
    end
end

return M
