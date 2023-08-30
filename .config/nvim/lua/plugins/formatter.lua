local formatter = require("formatter")
local default_formatters = require("formatter.defaults")

local biome = default_formatters.biome
local stylua = default_formatters.stylua
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
			stylua,
		},
	},
})
