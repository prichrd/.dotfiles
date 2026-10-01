vim.pack.add({
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/echasnovski/mini.completion" },
	{ src = "https://github.com/echasnovski/mini.cursorword" },
	{ src = "https://github.com/echasnovski/mini.icons" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

-- delete plugins removed from the list above, then update the rest
vim.api.nvim_create_user_command("PackUpdate", function()
	local inactive = vim.iter(vim.pack.get())
		:filter(function(x) return not x.active end)
		:map(function(x) return x.spec.name end)
		:totable()
	if #inactive > 0 then
		vim.pack.del(inactive)
	end
	vim.pack.update(nil, { force = true })
end, {})

-- tokyonight.nvim
require("tokyonight").setup({ style = "night" })
vim.cmd.colorscheme("tokyonight")

-- mini.*
require("mini.completion").setup({})
require("mini.cursorword").setup({})
require("mini.icons").setup({})

-- oil.nvim
require("oil").setup({
	view_options = {
		show_hidden = false,
		is_hidden_file = function(name)
			return name == ".."
		end,
	},
	keymaps = {
		["ff"] = function()
			require("fzf-lua").files({ cwd = require("oil").get_current_dir() })
		end,
		["fg"] = function()
			require("fzf-lua").live_grep({ cwd = require("oil").get_current_dir() })
		end,
	},
})

-- fzf-lua
require("fzf-lua").setup({
	winopts = {
		split = "botright new",
		preview = {
			border = "none",
		},
	},
	grep = {
		rg_opts = "--column --hidden --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob=!.git/ -e",
	},
	keymap = {
		fzf = {
			["ctrl-q"] = "select-all+accept",
		},
	},
})

vim.keymap.set("n", "-", function() require("oil").open() end)
vim.keymap.set("n", "<Leader>ff", function() require("fzf-lua").files({}) end)
vim.keymap.set("n", "<Leader>fg", function() require("fzf-lua").live_grep({}) end)
vim.keymap.set("n", "<Leader>fs", function() require("fzf-lua").git_status({}) end)
vim.keymap.set("n", "<Leader>fb", function() require("fzf-lua").buffers({}) end)
vim.keymap.set("n", "<Leader>fw", function() require("fzf-lua").grep_cword({}) end)
