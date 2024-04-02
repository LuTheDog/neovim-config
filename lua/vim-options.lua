vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>qq", "<CMD>wqa<CR>", { desc = "Close neovim and save" })
