return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			enable = true,
			tools = {
				auto = true,
				virtual_text = true,
			},
		})
	end,
}
