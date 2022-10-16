local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- print(package.path)
-- package.path = "../?.lua;" .. package.path
-- local file_path = ... -- pathOfThisFile is now 'lib.foo.bar'
-- print(file_path)

local require_path = (...):match("(.-)[^%.]+$") -- returns 'lib.foo.'

require(require_path .. 'configs')
require(require_path .. 'handlers').setup()
require(require_path .. 'null-ls')
