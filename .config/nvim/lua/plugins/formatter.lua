return {
	"mhartington/formatter.nvim",
	config = function()
		local formatter = require("formatter")
		local default_formatters = require("formatter.defaults")

		local biome = default_formatters.biome
		local denofmt = default_formatters.denofmt

		formatter.setup({
			filetype = {
				javascript = {
					biome,
				},
				javascriptreact = {
					biome,
				},
				typescript = {
					biome,
				},
				typescriptreact = {
					biome,
				},
				json = {
					biome,
				},
				jsonc = {
					biome,
				},
				css = {
					default_formatters.prettierd,
				},
				html = {
					require("formatter.filetypes.html").tidy,
				},
				svg = {
					require("formatter.filetypes.xml").tidy,
				},
				c = {
					require("formatter.filetypes.c").clangformat,
				},
				go = {
					require("formatter.filetypes.go").gofmt,
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
			},
		})

		vim.api.nvim_create_augroup("AutoFormatting", {})
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = "AutoFormatting",
			callback = function()
				vim.api.nvim_command("FormatWrite")
			end,
		})
	end,
}
