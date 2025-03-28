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
		"echasnovski/mini.clue",
		opts = {},
	},
	{
		"echasnovski/mini.cursorword",
		opts = {},
	},
	{
		"echasnovski/mini.trailspace",
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
				is_hidden_file = function(name, bufnr)
					return name == ".."
				end,
			},
			keymaps = {
				["<TAB>"] = function()
					local oil = require("oil")
					require("vwd").set_vwd(oil.get_current_dir(), true)
					print("[oil] current vwd:", require("vwd").get_vwd())
				end,
				["ff"] = function()
					local oil = require("oil")
					require("telescope.builtin").find_files({ cwd = oil.get_current_dir() })
				end,
				["fg"] = function()
					local oil = require("oil")
					require("telescope.builtin").live_grep({ cwd = oil.get_current_dir() })
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
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		enabled = true,
		opts = { mode = "cursor" },
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
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},
	{
		"prichrd/netrw.nvim",
		ft = "netrw",
		opts = {},
	},
	{
		"prichrd/refgo.nvim",
	},
	{
		"prichrd/vwd.nvim",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"prichrd/vwd.nvim",
		},
		init = function()
			require("telescope").load_extension("vwd")
		end,
		opts = {
			defaults = {
				file_ignore_patterns = { ".git/", "vendor/" },
				mappings = {
					i = {
						["<C-j>"] = function(bufnr)
							return require("telescope.actions").move_selection_next(bufnr)
						end,
						["<C-k>"] = function(bufnr)
							return require("telescope.actions").move_selection_previous(bufnr)
						end,
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
		},
		keys = {
			{
				"<Leader>fr",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume previous picker",
			},
			{
				"<Leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<Leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help tags",
			},
			{
				"<Leader>ff",
				function()
					require("telescope").extensions.vwd.find_files({})
				end,
				desc = "Files",
			},
			{
				"<Leader>fg",
				function()
					require("telescope").extensions.vwd.live_grep({})
				end,
				desc = "Grep",
			},
			{
				"<Leader>fq",
				function()
					require("telescope.builtin").quickfix()
				end,
				desc = "Quickfixes",
			},
			{
				"<Leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<Leader>fs",
				function()
					require("telescope.builtin").git_status()
				end,
				desc = "Git Status",
			},
			{
				"gd",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "LSP Definitions",
			},
			{
				"gr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "LSP References",
			},
			{
				"gi",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "LSP Implementations",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signcolumn = false,
			numhl = true,
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "]g", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[g", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })
			end,
		},
	},
})
