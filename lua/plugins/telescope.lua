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

		-- Sleek Dark Theme (charcoal + teal accent)
		local bg_dark = "#0f1117"
		local bg_panel = "#151820"
		local fg_normal = "#c5cdd9"
		local cyan = "#5ad4e6"
		local magenta = "#c678dd"

		-- Core windows
		vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = fg_normal, bg = bg_dark })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = cyan, bg = bg_dark })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = magenta, bg = bg_panel })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = cyan, bg = bg_dark })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = cyan, bg = bg_dark })

		-- Titles
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = magenta, bg = bg_panel, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = cyan, bg = bg_dark, bold = true })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = cyan, bg = bg_dark, bold = true })

		-- Prompt area
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = fg_normal, bg = bg_panel })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = magenta, bg = bg_panel })

		-- Matching results highlight
		vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = cyan, bold = true })

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files)
		vim.keymap.set("n", "<leader>sg", builtin.live_grep)
		vim.keymap.set("n", "<leader>sh", builtin.help_tags)
		vim.keymap.set("n", "<leader>sk", builtin.keymaps)
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
	end,
}
