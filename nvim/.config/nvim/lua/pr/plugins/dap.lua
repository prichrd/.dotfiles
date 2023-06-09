return {
	{
		"leoluz/nvim-dap-go",
		name = "dap-go",
		ft = "go",
		opts = {},
	},
	{
		"mfussenegger/nvim-dap",
		name = "dap",
		ft = "go",
		keys = {
			{
				"<Leader>db",
				function()
					return require("dap").toggle_breakpoint
				end,
			},
			{
				"<Leader>dc",
				function()
					return require("dap").continue
				end,
			},
			{
				"<Leader>di",
				function()
					return require("dap").step_into
				end,
			},
			{
				"<Leader>do",
				function()
					return require("dap").step_out
				end,
			},
			{
				"<Leader>dn",
				function()
					return require("dap").step_over
				end,
			},
			{
				"<Leader>dq",
				function()
					return require("dap").terminate
				end,
			},
			{
				"<Leader>dr",
				function()
					return require("dap").run_to_cursor
				end,
			},
			{
				"<Leader>dd",
				function()
					return require("dapui").toggle
				end,
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		name = "dapui",
		ft = "go",
		opts = {},
	},
}
