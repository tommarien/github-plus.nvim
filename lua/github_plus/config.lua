--- @class GithubPlus.Config
--- @field opts GithubPlus.Options
local M = {}

--- @alias GithubPlus.Style { bold?: boolean, italic?: boolean, underline?: boolean }
--- @class GithubPlus.Styles
--- @field comments? GithubPlus.Style
--- @field keywords? GithubPlus.Style
--- @field numbers? GithubPlus.Style
--- @field operators? GithubPlus.Style
--- @field strings? GithubPlus.Style
--- @field types? GithubPlus.Style
--- @field conditionals? GithubPlus.Style
--- @field functions? GithubPlus.Style

--- @class GithubPlus.Options
--- @field terminal_colors boolean
--- @field transparent boolean
--- @field styles GithubPlus.Styles
local defaults = {
    terminal_colors = true,
    transparent = false,
    styles = {
        comments = {
            italic = true,
        },
    }
}

M.deep_extend = function(...)
    local lhs = {}
    for _, rhs in ipairs({ ... }) do
        for k, v in pairs(rhs) do
            if type(lhs[k]) == "table" and type(v) == "table" then
                lhs[k] = M.deep_extend(lhs[k], v)
            else
                lhs[k] = v
            end
        end
    end

    return lhs
end

--- @class GithubPlus.Overrides
--- @field transparent? boolean Enable transparent background
--- @field terminal_colors? boolean Apply colors to terminal
--- @field styles? GithubPlus.Styles
--- @param opts? GithubPlus.Overrides
M.setup = function(opts)
    M.opts = M.deep_extend(M.opts, opts or {})
end


M.opts = defaults

return M
