return {
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			transparent_background = false, -- keep control inside the theme
			custom_palette = function(p)
				p.bg0 = "#000000" -- main window bg (Normal)
				p.black = "#000000" -- used in some places; make it true black too
				-- If you want *everything* black, also do:
				-- p.bg1 = "#000000"; p.bg2 = "#000000"; p.bg3 = "#000000"
				return p
			end,
			-- Optional: make common UI surfaces pure black as well
			custom_highlights = function(_, _)
				local black = "#000000"
				return {
					Normal = { bg = black },
					NormalNC = { bg = black },
					NormalFloat = { bg = black },
					FloatBorder = { bg = black },
					SignColumn = { bg = black },
					LineNr = { fg = "#CBE896", bg = "#000000" },
					CursorLineNr = { fg = "#FF7F11" },
					FoldColumn = { bg = black },
					StatusLine = { bg = black },
					StatusLineNC = { bg = black },
					TabLine = { bg = black },
					TabLineFill = { bg = black },
					TabLineSel = { bg = black },
					CursorLine = { bg = black },
					NvimTreeNormal = { fg = "#FFFFFF", bg = "#000000" }, -- main text
					NvimTreeNormalNC = { fg = "#C0C0C0", bg = "#000000" }, -- inactive
					NvimTreeFolderName = { fg = "#72DDF7", bold = false }, -- folder names
					NvimTreeRootFolder = { fg = "#F5E4D7", bold = true }, -- root folder
					NvimTreeOpenedFile = { fg = "#4A6C6F", bold = true }, -- opened file
					NvimTreeExecFile = { fg = "#E5C07B", bold = true }, -- executable file
					NvimTreeSymlink = { fg = "#D19A66", italic = true }, -- symlinks
				}
			end,
			terminal_colors = true,
		},
		config = function(_, opts)
			vim.o.termguicolors = true
			require("tokyodark").setup(opts)
			vim.cmd.colorscheme("tokyodark")
		end,
	},
}
