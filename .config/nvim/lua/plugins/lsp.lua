return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
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
			"astro",
			"jsonls",
			"docker_compose_language_service",
			"emmet_language_server",
			"bashls",
			"gopls",
			"taplo",
			"hls",
			"biome",
			"clangd",
			"denols",
			"volar",
			"prismals",
			"cssls",
			"java_language_server",
		}

		for _, lsp in pairs(servers) do
			lspconfig[lsp].setup({})
		end

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					hint = { enable = true },
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.denols.setup({
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		})

		lspconfig.tsserver.setup({
			root_dir = lspconfig.util.root_pattern("package.json"),
			single_file_support = false,
		})
	end,
}
