
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- print(package.path)
-- package.path = "../?.lua;" .. package.path
-- local file_path = ... -- pathOfThisFile is now 'lib.foo.bar'
local require_path = (...):match("(.-)[^%.]+$") -- returns 'lib.foo.'
--
-- print(file_path)
-- print(require_path)

-- require(folderOfThisFile .. 'baz')     -- require('lib.foo.baz')
-- require(folderOfThisFile .. 'bazinga') -- require('lib.foo.bazinga')

require(require_path .. '.configs')
require(require_path .. 'handlers').setup()
-- require "lsp.null-ls"

