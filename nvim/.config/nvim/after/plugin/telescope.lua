local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		border = false,
		file_ignore_patterns = { ".git/" },
		layout_strategy = "bottom_pane",
		layout_config = {
			prompt_position = "bottom",
		},
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			hidden = true,
		},
	},
})
telescope.load_extension("manatee")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>ff", require("telescope").extensions.manatee.find_files, opts)
vim.keymap.set("n", "<Leader>fg", require("telescope").extensions.manatee.live_grep, opts)
vim.keymap.set("n", "<Leader>fb", require("telescope.builtin").buffers, opts)
vim.keymap.set("n", "<Leader>fh", require("telescope.builtin").help_tags, opts)
vim.keymap.set("n", "<Leader>fq", require("telescope.builtin").quickfix, opts)
vim.keymap.set("n", "<Leader>fk", require("telescope.builtin").keymaps, opts)
vim.keymap.set("n", "<Leader>gs", require("telescope.builtin").git_status, opts)
