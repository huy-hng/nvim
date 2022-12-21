local snippet = require('luasnip.nodes.snippet').S
local snippet_from_nodes = require('luasnip.nodes.snippet').SN
local t = require('luasnip.nodes.textNode').T
local i = require('luasnip.nodes.insertNode').I
local f = require('luasnip.nodes.functionNode').F
local c = require('luasnip.nodes.choiceNode').C
local d = require('luasnip.nodes.dynamicNode').D
local r = require('luasnip.nodes.restoreNode').R
local events = require('luasnip.util.events')
local extras = require('luasnip.extras')
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt


local M = {}
M.same = function(index)
	return f(function(args) return args[1] end, { index })
end

M.newline = function(text) return t { '', text } end

M.shortcut = function(val)
	if type(val) == 'string' then return { t { val }, i(0) } end

	if type(val) == 'table' then
		for k, v in ipairs(val) do
			if type(v) == 'string' then val[k] = t { v } end
		end
	end

	return val
end

M.make = function(tbl)
	local result = {}
	for k, v in pairs(tbl) do
		table.insert(result, (snippet({ trig = k, desc = v.desc }, M.shortcut(v))))
	end

	return result
end

return M
