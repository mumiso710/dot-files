return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("lspsaga").setup({})

		local opts = { silent = true }

		local keymap = vim.keymap
		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

		opts.desc = "See available code actions"
		keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	end,
}
