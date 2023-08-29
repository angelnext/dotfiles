require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = {
	"rust_analyzer",
	"tsserver",
	"pyright",
	"lua_ls",
	"gopls",
	"rome",
	"astro",
	"jsonls",
	"docker_compose_language_service",
}

for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({})
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.cmd([[ autocmd BufWritePost * FormatWrite ]])
