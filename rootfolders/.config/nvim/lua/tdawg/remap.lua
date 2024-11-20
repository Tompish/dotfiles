vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ':m >+1<CR>gv=gv')
vim.keymap.set("v", "K", ':m <-2<CR>gv=gv')
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>nt", ":NERDTree<CR>")
vim.keymap.set("n", "<leader>nx", ":NERDTreeClose<CR>")
vim.keymap.set("i", "{", "{}<Esc>ha")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.lsp.buf.code_action, { desc = 'Open diagnostic Quickfix' })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = 'Open diagnostic Error' })
vim.keymap.set("n", "<leader>gt", vim.diagnostic.goto_next, { desc = 'Go to error' })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = 'Rename workspace variable' })

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.showtabline = 2
