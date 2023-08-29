local formatter = require("formatter")
local default_formatters = require("formatter.defaults")
-- local prettierd = default_formatters.prettierd
local rome = default_formatters.rome
local stylua = default_formatters.stylua
formatter.setup({
	filetype = {
		javascript = {
			rome,
		},
		javascriptreact = {
		  rome,
		},
		typescript = {
			rome,
		},
		typescriptreact = {
			rome,
		},
		lua = {
			stylua,
		},
	},
})
