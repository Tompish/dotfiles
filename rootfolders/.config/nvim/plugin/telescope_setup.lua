local tel = require("telescope")

tel.setup({
	defaults = {
		mappings = { i = {
			['<C-j>'] = require('telescope.actions').move_selection_next,
			['<C-k>'] = require('telescope.actions').move_selection_previous
			}
		}
	}

})


local builtin = require('telescope.builtin')


local diagnosticsOpts = function()
	builtin.diagnostics({ severity_limit = 2 })
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', function() builtin.git_branches({ show_remote_tracking_branches = true }) end, {})
vim.keymap.set('n', '<leader>fB', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fe', diagnosticsOpts, {})
