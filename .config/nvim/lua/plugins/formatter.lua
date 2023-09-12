local formatter = require("formatter")
local default_formatters = require("formatter.defaults")

local biome = default_formatters.biome

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
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
	},
})
