return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.9,
					height = 0.8,
					prompt_position = "top",
					preview_width = 0.6,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						width = 0.5,
					}),
				},
			},
		})
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		-- Telescope UI
		vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#d4d4d4", bg = "#1a1b26" }) 
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#7aa2f7", bg = "#1a1b26" }) 
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#ff9e64", bg = "#1f2335" }) 
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#7dcfff", bg = "#1a1b26" }) 
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#9ece6a", bg = "#1a1b26" }) 

		-- Titles
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#ff9e64", bg = "#1f2335", bold = true }) 
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#7dcfff", bg = "#1a1b26", bold = true }) 
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#9ece6a", bg = "#1a1b26", bold = true }) 

		-- Prompt area
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = "#c0caf5", bg = "#1f2335" })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#f7768e", bg = "#1f2335" }) 

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files)
		vim.keymap.set("n", "<leader>sg", builtin.live_grep)
		vim.keymap.set("n", "<leader>sh", builtin.help_tags)
		vim.keymap.set("n", "<leader>sk", builtin.keymaps)
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
	end,
}
