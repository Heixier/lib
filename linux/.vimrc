set number
set belloff=all
set mouse=a
set termguicolors
filetype plugin indent on
colorscheme catppuccin_macchiato 
" for vim 8+:
" git clone https://github.com/catppuccin/vim.git ~/.vim/pack/vendor/start/catppuccin
set clipboard=unnamed

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden

set tabstop=4
set shiftwidth=4

call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'tmsvg/pear-tree'

call plug#end()

if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->['bash-language-server', 'start']},
        \ 'allowlist': ['sh', 'bash'],
        \ })
endif

" augroup tree
" 	autocmd!
" 	autocmd VimEnter * NERDTree | wincmd p
" 	" Exit Vim if NERDTree is the only window remaining in the only tab.
" 	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" augroup END

