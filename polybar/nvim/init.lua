--=============================================================================
-- lua require
--=============================================================================
require('magicvim')

--=============================================================================
-- vim settings
--=============================================================================
local status_ok, dracula = pcall(require, "dracula")
if not status_ok then
	return
end

local c = vim.cmd

c([[
colorscheme dracula
set shell=/usr/bin/zsh
set undofile
set undodir=$HOME/.cache/nvim/undo
set wrap
set linebreak
set nobackup
set nohlsearch
set incsearch
set history=1000
set signcolumn=yes
set encoding=utf-8
set updatetime=100
set shortmess+=c
set scrolloff=8
set timeoutlen=500
set number relativenumber
set termguicolors
set encoding=utf-8
set conceallevel=2
set cursorline
set showtabline=2
set noshowmode
]])

--=============================================================================
