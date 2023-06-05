require("mini.completion").setup({})
require("mini.cursorword").setup({})
require("mini.trailspace").setup({})
require("mini.align").setup({})
require("mini.indentscope").setup({
	draw = {
		delay = 0,
		animation = function()
			return 0
		end,
	},
	symbol = "│",
})
