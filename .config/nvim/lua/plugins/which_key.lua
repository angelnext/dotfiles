return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key").register({
			f = {
				name = "file",
				f = { "<cmd>Telescope find_files<cr>", "Find files" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
				z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
				h = { "<cmd>noh<cr>", "Clear search highlight" },
			},
			c = {
				name = "code",
				x = { "<cmd>TroubleToggle<cr>", "Toggle trouble nenu" },
				a = { "<cmd>CodeActionMenu<cr>", "Open code actions menu" },
			},
			b = {
				name = "buffer",
				b = { "<cmd>BufferOrderByBufferNumber<cr>", "Order buffers by number" },
				d = { "<cmd>BufferOrderByDirectory<cr>", "Order buffers by directory" },
				l = { "<cmd>BufferOrderByLanguage<cr>", "Order buffers by language" },
				w = { "<cmd>BufferOrderByWindowNumber<cr>", "Order buffers by window number" },
				n = { "<cmd>enew<cr>", "New buffer" },
				p = { "<cmd>BufferPin<cr>", "Pin buffer" },
			},
			e = {
				name = "explorer",
				t = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
				f = { "<cmd>NvimTreeFocus<cr>", "Toggle focus" },
			},
		}, { prefix = "<leader>" })
	end,
}
