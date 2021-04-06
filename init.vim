set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set undodir=~/.config/nvim/undo
set undofile
set incsearch
set termguicolors
set scrolloff=8
set foldmethod=marker
set foldmarker={{{,}}}
set signcolumn=yes
set cursorline

call plug#begin('~/.config/nvim/plugged')
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'ex-surreal/vim-std-io'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'joshdick/onedark.vim'
call plug#end()

colorscheme onedark
highlight Normal guibg=none

let mapleader = " "

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_global_extra_conf.py'


let g:netrw_localrmdir='rm -r'
let g:ctrlp_use_caching = 0

inoremap { {<Cr>}<Esc>k$a

nnoremap <S-L> <C-W>l
nnoremap <S-H> <C-W>h
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :wincmd j<CR> 
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
let g:ycm_auto_trigger=1
let g:ycm_semantic_triggers = {
\'c' : ['->', '    ', '.', ' ', '(', '[', '&'],
\'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
\}
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>nnnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" YCM
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
