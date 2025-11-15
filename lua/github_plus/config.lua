--- @class GithubPlus.Config
--- @field opts GithubPlus.Options
local M = {}

---@class GithubPlus.Style
---@field italic? boolean
---@field bold? boolean

--- @class GithubPlus.Options
--- @field terminal_colors boolean
--- @field transparent boolean
--- @field styles { comments: GithubPlus.Style, strings: GithubPlus.Style }
local defaults = {
    terminal_colors = true,
    transparent = false,
    styles = {
        comments = {
            italic = true,
        },
        strings = {}
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
--- @field styles? { comments?: GithubPlus.Style, strings?:GithubPlus.Style }
--- @param opts? GithubPlus.Overrides
M.setup = function(opts)
    M.opts = M.deep_extend(M.opts, opts or {})
end


M.opts = defaults

return M
