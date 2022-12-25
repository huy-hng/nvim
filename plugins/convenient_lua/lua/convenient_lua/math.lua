---[Convenient Lua]
---@param x number number to clamp
---@param lower number lower bound
---@param upper number upper bound
---@return number
function math.clamp(x, lower, upper) --
	return math.min(upper, math.max(x, lower))
end

--- round to nearest integer
---@param x number
function math.round(x) --
	return math.floor(x + 0.5)
end

