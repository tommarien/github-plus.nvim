local M = {}

--- @param p GithubPlus.Palette
M.set_terminal_colors = function(p)
    vim.g.terminal_color_0 = p.black.base
    vim.g.terminal_color_1 = p.red.base
    vim.g.terminal_color_2 = p.green.base
    vim.g.terminal_color_3 = p.yellow.base
    vim.g.terminal_color_4 = p.blue.base
    vim.g.terminal_color_5 = p.purple.base
    vim.g.terminal_color_6 = p.cyan.base
    vim.g.terminal_color_7 = p.white.base

    vim.g.terminal_color_8 = p.black.emphasis
    vim.g.terminal_color_9 = p.red.emphasis
    vim.g.terminal_color_10 = p.green.emphasis
    vim.g.terminal_color_11 = p.yellow.emphasis
    vim.g.terminal_color_12 = p.blue.emphasis
    vim.g.terminal_color_13 = p.purple.emphasis
    vim.g.terminal_color_14 = p.cyan.emphasis
    vim.g.terminal_color_15 = p.white.emphasis
end

return M
