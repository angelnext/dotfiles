return {
	"folke/zen-mode.nvim",
	dependencies = {
		"folke/twilight.nvim",
	},
	config = function()
		require("zen-mode").setup()
	end,
}
