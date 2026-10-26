set number
set belloff=all
set mouse=a
set termguicolors
filetype plugin indent on
colorscheme catppuccin_macchiato 
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
