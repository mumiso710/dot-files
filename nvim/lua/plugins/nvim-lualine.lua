return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- options = {
	-- 	theme = "nord",
	-- },
	config = function()
		require("lualine").setup({
			theme = "nord",
		})
	end,
}
