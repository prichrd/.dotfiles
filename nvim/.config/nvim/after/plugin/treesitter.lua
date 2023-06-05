local ok, _ = pcall(require, "nvim-treesitter")
if not ok then
	return
end

require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "gomod", "rust", "lua", "typescript" },
	highlight = {
		enable = true,
	},
	disable = function(_, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local exists, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if exists and stats and stats.size > max_filesize then
			return true
		end
	end,
})
