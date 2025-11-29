local M = {}

local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
    return string.format("#%02x%02x%02x", r, g, b)
end

-- Blend two colors given in hex format with a specified alpha
-- @param color1: string, hex color code (e.g. "#ff0000")
-- @param color2: string, hex color code (e.g. "#0000ff")
-- @param alpha: number, blending factor between 0.0 and 1.0
M.blend = function(color1, color2, alpha)
    local r1, g1, b1 = hex_to_rgb(color1)
    local r2, g2, b2 = hex_to_rgb(color2)
    local r = math.floor(r1 * (1 - alpha) + r2 * alpha + 0.5)
    local g = math.floor(g1 * (1 - alpha) + g2 * alpha + 0.5)
    local b = math.floor(b1 * (1 - alpha) + b2 * alpha + 0.5)
    return rgb_to_hex(r, g, b)
end

return M
