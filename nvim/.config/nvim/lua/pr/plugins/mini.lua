return {
	{
		"echasnovski/mini.completion",
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
		"echasnovski/mini.align",
		opts = {},
	},
	{
		"echasnovski/mini.comment",
		opts = {},
	},
  {
		"echasnovski/mini.bracketed",
		opts = {},
  },
  {
		"echasnovski/mini.splitjoin",
		opts = {},
  },
  {
		"echasnovski/mini.extra",
    opts = {},
  },
  -- {
  -- "echasnovski/mini.pick",
  -- opts = {
  --     mappings = {
  --       move_down  = '<C-j>',
  --       move_up    = '<C-k>',
  --     }
  --   },
  --   keys = {
  --     {
  --       "<Leader>fr",
  --       function()
  --         require("mini.pick").builtin.resume()
  --       end,
  --       desc = "Resume Finder",
  --     },
  --     {
  --       "<Leader>ff",
  --       function()
  --         local pick = require("mini.pick")
  --         local items = vim.schedule_wrap(function()
  --           MiniPick.set_picker_items_from_cli({ 'rg', '--files', '--no-follow', '--color=never', '--hidden', '-g=!.git/',  })
  --         end)
  --         MiniPick.start({ source = { items = items, name = 'Files' } })
  --       end,
  --       desc = "Find Files",
  --     },
  --     {
  --       "<Leader>fg",
  --       function()
  --         require("mini.pick").builtin.grep_live()
  --       end,
  --       desc = "Find Grep",
  --     },
  --     {
  --       "<Leader>fb",
  --       function()
  --         require("mini.pick").builtin.buffers()
  --       end,
  --       desc = "Find Buffers",
  --     },
  --     {
  --       "<Leader>fs",
  --       function()
  --         require("mini.extra").pickers.git_hunks()
  --       end,
  --       desc = "Find Git Hunks",
  --     },
  --     {
  --       "gr",
  --       function()
  --         require("mini.extra").pickers.lsp({ scope = "references" })
  --       end,
  --       desc = "Find LSP References",
  --     },
  --     {
  --       "gd",
  --       function()
  --         require("mini.extra").pickers.lsp({ scope = "definition" })
  --       end,
  --       desc = "Find LSP Definitions",
  --     },
  --     {
  --       "gi",
  --       function()
  --         require("mini.extra").pickers.lsp({ scope = "implementation" })
  --       end,
  --       desc = "Find LSP Implementations",
  --     },
  --   },
  -- },
  -- {
  -- "echasnovski/mini.files",
  -- opts = {
  --     mappings = {
  --       close       = '<ESC>',
  --       go_in       = '',
  --       go_in_plus  = '<CR>',
  --       go_out      = '-',
  --       go_out_plus = 'h',
  --       reset       = '<BS>',
  --       reveal_cwd  = '@',
  --       show_help   = 'g?',
  --       synchronize = '=',
  --       trim_left   = '<',
  --       trim_right  = '>',
  --     },
  --   },
  --   keys = {
  --     {
  --       "-",
  --       function()
  --         require("mini.files").open(vim.api.nvim_buf_get_name(0))
  --       end,
  --       desc = "Find Files",
  --     },
  --   },
  -- },
	{
		"echasnovski/mini.indentscope",
		opts = {
			draw = {
				delay = 0,
				animation = function()
					return 0
				end,
			},
			symbol = "│",
		},
	},
  {
    "echasnovski/mini.clue",
    opts = {
      triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = '[' },
        { mode = 'x', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'x', keys = ']' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
      },
      window = {
        delay = 100,
      }
    },
  },
}
