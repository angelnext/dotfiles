local capabilities = require'cmp_nvim_lsp'.default_capabilities()

local lspconfig = require'lspconfig'

lspconfig.tsserver.setup {
  capabilities = capabilities
}

lspconfig.astro.setup {
  capabilities = capabilities
}
