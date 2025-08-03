-- return {
-- 	"scottmckendry/cyberdream.nvim",
-- 	lazy = false,
-- 	opts = {
-- 		transparent = true,
-- 		hide_fillchars = true,
-- 		terminal_colors = false,
-- 		italic_comments = true,
-- 		extensions = {},
-- 		theme = {
-- 			colors = {
-- 				fg = "#F6F0ED",
-- 				orange = "#BE6E46",
-- 				blue = "#86BBD8",
-- 				pink = "#D36060",
-- 				bg = "#000000",
-- 				green = "#6FD08C",
-- 				magenta = "#D33E43",
-- 				purple = "#EFE9AE",
-- 			},
-- 		},
-- 	},
-- 	priority = 1000,
-- 	init = function()
-- 		vim.cmd.colorscheme("cyberdream")
-- 	end,
-- }
return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("github-theme").setup({
			-- ...
		})

		vim.cmd("colorscheme github_dark_tritanopia")
	end,
}
