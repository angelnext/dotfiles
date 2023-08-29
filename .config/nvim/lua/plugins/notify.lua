local notify = require("notify")

notify.setup({
  background_colour = "#000023"
})

vim.notify = notify
