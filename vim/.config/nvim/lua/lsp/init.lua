local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

print(vim.fn.getcwd())
require "lsp.configs"
require("lsp.handlers").setup()
-- require "lsp.null-ls"

