Account = { balance = 0 }

function Account:new(o)
	o = o or {} -- create object if user does not provide one
	setmetatable(o, self)
	self.__index = self
	self.a = 1
	self.b = 2
	return o
end

function Account:withdraw(v) self.balance = self.balance - v end

function Account:deposit(v)
	self.balance = self.balance + v
	-- return self.balance
end

function Account:get_balance() return self.balance end

local a = Account:new { balance = 20 }
a:deposit(200.00)
a:withdraw(100.00)

local b = Account:new()
b:deposit(50.0)

a.a = 9

-- P(a.a)
-- P(a.b)

-- P(b.a)
-- P(b.b)
-- P(a:get_balance())
-- P(b:get_balance())

Shape = { a = 123, num = 100 }
function Shape:new(o, new_num, new)
	o = o or {}
	setmetatable(o, self)
	self.__index = self

	self.num = self.num or 0
	self.num = self.num + new_num
	self.bcd = new
	-- P(o)
	return o
end

function Shape:add(num) self.num = self.num + num end

-- Creating an object
-- local sh1 = Shape:new({ b = 234 }, 10, 94)
-- sh1:add(10)
-- P(sh1.num)

-- local sh2 = Shape:new(nil, 10, 12)
-- sh2:add(10)
-- P(sh1.num)

-- P(sh2)
