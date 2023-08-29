local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins.lazy")

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config").."/lua/plugins", [[v:val =~ "\.lua$"]])) do
  if file:gsub("%.lua$", "") == "init" then goto continue end
  require("plugins."..file:gsub("%.lua$", ""))
  ::continue::
end
