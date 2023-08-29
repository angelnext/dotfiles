local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
  capabilities = capabilities
})

lspconfig.rome.setup({
  capabilities = capabilities
})

lspconfig.astro.setup({
  capabilities = capabilities
})

lspconfig.gopls.setup({
  capabilities = capabilities
})

lspconfig.jsonls.setup({
  capabilities = capabilities
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
