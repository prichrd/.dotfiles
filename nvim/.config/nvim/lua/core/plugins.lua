local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup({
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = { style = "night" },
		init = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"echasnovski/mini.completion",
		opts = {},
	},
	{
		"echasnovski/mini.cursorword",
		opts = {},
	},
	{
		"echasnovski/mini.icons",
		opts = {},
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = false,
				is_hidden_file = function(name)
					return name == ".."
				end,
			},
			keymaps = {
				["ff"] = function()
					local oil = require("oil")
					require("fzf-lua").files({ cwd = oil.get_current_dir() })
				end,
				["fg"] = function()
					local oil = require("oil")
					require("fzf-lua").live_grep({ cwd = oil.get_current_dir() })
				end,
			},
		},
		keys = {
			{
				"-",
				function()
					require("oil").open()
				end,
			},
		},
	},
	{
		"ibhagwan/fzf-lua",
		lazy = false,
		opts = {
			winopts = {
				split = "botright new",
				preview = {
					border = "none",
				},
			},
			grep = {
				rg_opts = "--column --hidden --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob=!.git/ -e",
			},
		},
		keys = {
			{
				"<Leader>zz",
				"<cmd>FzfLua<CR>",
			},
			{
				"<Leader>ff",
				function()
					require("fzf-lua").files({})
				end,
			},
			{
				"<Leader>fg",
				function()
					require("fzf-lua").live_grep({})
				end,
			},
			{
				"<Leader>fs",
				function()
					require("fzf-lua").git_status({})
				end,
			},
			{
				"<Leader>fb",
				function()
					require("fzf-lua").buffers({})
				end,
			},
			{
				"<Leader>fw",
				function()
					require("fzf-lua").grep_cword({})
				end,
			},
			{
				"gr",
				function()
					require("fzf-lua").lsp_references({})
				end,
			},
			{
				"gd",
				function()
					require("fzf-lua").lsp_definitions({})
				end,
			},
			{
				"gD",
				function()
					require("fzf-lua").lsp_declarations({})
				end,
			},
			{
				"gi",
				function()
					require("fzf-lua").lsp_implementations({})
				end,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "go", "gomod", "lua", "bash", "json" },
				highlight = {
					enable = true,
				},
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				disable = function(_, buf)
					local max_filesize = 250 * 1024 -- 250 KB
					local exists, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if exists and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			signcolumn = false,
			numhl = true,
		},
		keys = {
			{
				"<leader>gg",
				"<cmd>Gitsign setqflist",
			},
		},
	},
	{
		"folke/trouble.nvim",
		opts = {
			warn_no_results = false,
			open_no_results = true,
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
		},
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					go = {
						require("formatter.filetypes.go").goimports,
						require("formatter.filetypes.go").gofmt,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					typescript = {
						require("formatter.filetypes.typescript").biome,
					},
				},
			})
			vim.api.nvim_create_augroup("__formatter__", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = "__formatter__",
				command = ":FormatWrite",
			})
		end,
	},
})
