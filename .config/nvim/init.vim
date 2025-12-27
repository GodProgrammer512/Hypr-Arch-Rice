" Real tabs, visual 8.
set noexpandtab
set tabstop=8
set shiftwidth=8
set softtabstop=0

" Enable syntax highlighting.
syntax on

" Enable filetype detection, plugins and automatic identation.
filetype plugin indent on

" Try to enable truecolor.
set termguicolors
autocmd ColorScheme * hi Normal ctermbg=none guibg=none
autocmd ColorScheme * hi NonText ctermbg=none guibg=none
autocmd ColorScheme * hi NormalNC ctermbg=none guibg=none

" Ctrl + Q = ':q!'.
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>
vnoremap <C-q> <Esc>:q!<CR>

" Ctrl + W = ':w!'.
nnoremap <C-w> :w!<CR>
inoremap <C-w> <Esc>:w!<CR>
vnoremap <C-w> <Esc>:w!<CR>

" Ctrl + A = 'ggVG'.
nnoremap <C-a> ggVG
vnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" Ctrl + T = ':tabnext'.
nnoremap <C-t> :tabnext<CR>
inoremap <C-t> <Esc>:tabnext<CR>
vnoremap <C-t> <Esc>:tabnext<CR>

" Ctrl + N = ':tabnew '.
nnoremap <C-n> :call feedkeys(":tabnew ", 'n')<CR>
inoremap <C-n> <Esc>:call feedkeys(":tabnew ", 'n')<CR>
vnoremap <C-n> <Esc>:call feedkeys(":tabnew ", 'n')<CR>
