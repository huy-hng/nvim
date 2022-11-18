P = function(v)
	vim.pretty_print(v)
	-- print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	require('plenary.reload').reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

LOADED = function(name)
	vim.pretty_print(package.loaded[name])
end

RESET = function(name)
	package.loaded[name] = nil
end

WriteFile = function(path, text)
	local file = io.open(path, 'w')
	io.output(file)
	io.write(text)
	io.close(file)
end
