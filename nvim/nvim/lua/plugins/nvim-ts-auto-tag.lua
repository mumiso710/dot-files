return {
	"windwp/nvim-ts-autotag",
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
	},
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
}
