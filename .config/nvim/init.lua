-- global mapleader
vim.g.mapleader = ' '
-- local mapleader
vim.g.maplocalleader = ' '
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python


-- line numbers
vim.wo.number=true

vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.background = dark
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.backspace='2'
vim.opt.laststatus = 2
vim.opt.showcmd = true

vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

