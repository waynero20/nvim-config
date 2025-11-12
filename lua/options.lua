vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.signcolumn = "number"

-- Keep number column narrow
vim.opt.numberwidth = 2

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#c678dd", bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "#0f1117" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#c678dd", bg = "#0f1117" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#0f1117" })
