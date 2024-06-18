local opt = vim.opt

-- <leader> key
vim.g.mapleader = " " -- <leader> == space
vim.g.maplocalleader = " "

opt.undofile = true

opt.termguicolors = true --  24-bit RGB colors

-- Using system clipboard
opt.clipboard = "unnamedplus" -- copy text to system buffer

opt.updatetime = 500

opt.shortmess = "laoOtTICF"

-- UI
opt.scrolloff = 100   -- cursor always in center vertically
opt.cursorline = true -- highlight cuurent line
opt.number = true     -- show cuurent line number
opt.relativenumber = true
opt.wrap = true
opt.linebreak = true -- smart wrap
opt.pumheight = 7    -- popup menu hieght
opt.showmode = false -- mod shows in status line plugin
-- Always show the signcolumn, otherwise it would shift the text each time diagnostics appeared/became resolved
opt.signcolumn = "yes"

-- Search
opt.incsearch = true  -- instant search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true
opt.hlsearch = true   -- highlight search

-- Indent/tab
opt.expandtab = true   -- use spaces instead of tabs
opt.shiftwidth = 4     -- shift 4 spaces when tab
opt.tabstop = 4        -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

opt.mouse = "a"        -- mouse support
opt.backspace = "indent,eol,start"

opt.splitbelow = true
opt.splitright = true

-- Disable auto commenting new lines
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})
