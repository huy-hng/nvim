----------------------------------------------Example 1---------------------------------------------
do
	local function class(base, init)
		local c = {} -- a new class instance
		if not init and type(base) == 'function' then
			init = base
			base = nil
		elseif type(base) == 'table' then
			-- our new class is a shallow copy of the base class!
			for i, v in pairs(base) do
				c[i] = v
			end
			c._base = base
		end
		-- the class will be the metatable for all its objects,
		-- and they will look up their methods in it.
		c.__index = c

		-- expose a constructor which can be called by <classname>(<args>)
		local mt = {}
		mt.__call = function(class_tbl, ...)
			local obj = {}
			setmetatable(obj, c)
			if init then
				init(obj, ...)
			else
				-- make sure that any stuff from the base class is initialized!
				if base and base.init then base.init(obj, ...) end
			end
			return obj
		end
		c.init = init
		c.is_a = function(self, klass)
			local m = getmetatable(self)
			while m do
				if m == klass then return true end
				m = m._base
			end
			return false
		end
		setmetatable(c, mt)
		return c
	end

	--------------------------------------------Implementation------------------------------------------
	Animal = class(function(a, name) a.name = name end)

	function Animal:__tostring() return self.name .. ': ' .. self:speak() end

	Dog = class(Animal)

	function Dog:speak() return 'bark' end

	Cat = class(Animal, function(c, name, breed)
		Animal.init(c, name) -- must init base!
		c.breed = breed
	end)

	function Cat:speak() return 'meow' end

	Lion = class(Cat)

	function Lion:speak() return 'roar' end

	local fido = Dog('Fido')
	local felix = Cat('Felix', 'Tabby')
	local leo = Lion('Leo', 'African')

	leo:is_a(Animal) -- true
	leo:is_a(Dog) -- false
	leo:is_a(Cat) -- true
end

----------------------------------------------Example 2---------------------------------------------
do
function class(def)
	local class = {}
	local parents = {}

	local upv
	local env = _G

	local wraps
	local function super(parent_class)
		if not parent_class then
			parent_class = parents[1]
		end

		local this = this
		local that = {}
		for k,v in pairs(parent_class) do
			that[k] = type(v) == 'function' and wraps(this, v) or v
		end

		return setmetatable(that, that)
	end

	function wraps(this, func)
		return function(...)
				local t = env.this
				local s = env.super

				env.this  = this
				env.super = super

				local ret  = pcall(func, ...)

				env.this  = t
				env.super = s

				return ret
			end
	end

	function class.__init()end

	for i=1,math.huge do
		inherit, v = debug.getlocal(def, i)
		if not inherit then break end

		local parent_class = _G[inherit]
		for i=1,math.huge do
			local  name, pclass = debug.getlocal(2,i,1)
			if not name then break
			elseif name == inherit then
				parent_class  = pclass
				break
			end
		end

		if parent_class  and type(parent_class) == 'table' then
			table.insert(parents, parent_class)
			for k,v in pairs(parent_class) do
				class[k] = v
			end
		else
			error(string.format('Class "%s" not valid.', name))
		end
	end

	for i=1,math.huge do
		local  name, value = debug.getupvalue(def, i)
		if not name then break
		elseif name == '_ENV' then
			env = value
			upv = i
			break
		end
	end

	local _env = setmetatable({}, {
		__index= function(t, name)
			local  value  = class[name]
			return value ~= nil and value or env[name]
		end,
		__newindex = function(t, name, value)
				class[name] = value
			end
	})

	local function senv(env)
		if upv then debug.setupvalue(def, upv, env)
		else _G = env end
	end

	senv(_env)
	pcall(def, unpack(parents))
	senv(env)

	return setmetatable({}, {
		__ipairs    = function()        return ipairs(class)              end,
		__pairs     = function()        return  pairs(class)              end,
		__index     = function(t, name) return        class[name]         end,
		__index_new = function(t, name, value)        class[name] = value end,
		__call      = function(...)
			local this = {}
			for k,v in pairs(class) do
				this[k] = type(v) == 'function' and wraps(this, v) or v
			end
			this.__class = class
			this.__init(...)

			return setmetatable(this, this)
		end
	})
end



	--------------------------------------------Implementation------------------------------------------

	local global = true
	local this_is_a_property_of_Inherit = true
	Parent = class(function()

		function __init()
			print('Parent().__init()')
			this.init = true
		end

		function __call() print("Yay! You're calling for me :) init:", this.init, '\n') end
	end)

	Child = class(function()
		print('Inherited property:', this_is_a_property_of_Inherit)
		print('Global variable:   ', global, '\n')

		function __init()
			print('Child().__init()')
			print('this.init:', this.init)
		end

		function test(...) print(..., this.__init, '\n') end
	end)

	local example = Child()
	example.test('__init:')
	example()

	example.property = 'I\'m a property of instance "example"'
	print('example.property', example.property)
	print('Child.property', Child.property)

	--    Inherited property:	true
	--    Global variable:   	true

	--    Child().__init()
	--    Parent().__init()
	--    this.init:	true
	--    __init:	function: 0x15dd5f0

	--    Yay! You're calling for me :) init:	true

	--    example.property	I'm a property of instance "example"
	--    Child.property	nil
end
