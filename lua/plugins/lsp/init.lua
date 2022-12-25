if not nrequire('lspconfig') then return end

-- print(package.path)
-- package.path = "../?.lua;" .. package.path
-- local file_path = ... -- pathOfThisFile is now 'lib.foo.bar'
-- print(file_path)

-- local require_path = (...):match('(.-)[^%.]+$') -- returns 'lib.foo.'
-- require(require_path .. 'mason')

require('plugins.lsp.mason')
require('plugins.lsp.handlers')
require('plugins.lsp.diagnostic')
require('plugins.lsp.server_setup')
require('plugins.lsp.null-ls')
