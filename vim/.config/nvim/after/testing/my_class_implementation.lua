function Class()
	local class = {}
	local env = _G

	local wraps
	function wraps(self, func)
		return function(...)
			local t = env.self
			local s = env.super

			env.self = self

			local ret = pcall(func, ...)

			env.self = t
			env.super = s

			return ret
		end
	end

	function class.__init() end

	return setmetatable({}, {
		__ipairs = function() return ipairs(class) end,
		__pairs = function() return pairs(class) end,
		__index = function(t, name) return class[name] end,
		__index_new = function(t, name, value) class[name] = value end,
		__call = function(...)
			local this = {}
			for k, v in pairs(class) do
				this[k] = type(v) == 'function' and wraps(this, v) or v
			end
			this.__class = class
			this.__init(...)

			return setmetatable(this, this)
		end,
	})
end

