require("lazy").setup({
	require("pr.plugins.colorscheme"),
	require("pr.plugins.dap"),
	require("pr.plugins.git"),
	require("pr.plugins.lsp"),
	require("pr.plugins.luasnip"),
	require("pr.plugins.mason"),
	require("pr.plugins.mini"),
	require("pr.plugins.prichrd"),
	require("pr.plugins.telescope"),
	require("pr.plugins.treesitter"),

	{ "fatih/vim-go", ft = "go" },
	"nvim-lua/plenary.nvim",
	"sotte/presenting.vim",
	"tpope/vim-commentary",
	"tpope/vim-dadbod",
	"tpope/vim-surround",
	"tpope/vim-vinegar",
	"github/copilot.vim",
}, {
	checker = {
		enabled = true,
	},
	dev = {
		path = "~/Workspace/github.com/prichrd/",
	},
})
