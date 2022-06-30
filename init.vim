set relativenumber
set nohlsearch
set title
set autochdir
set hidden
set mouse=n
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
set completeopt-=preview
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

call plug#begin('~/.config/nvim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
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
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'preservim/nerdcommenter'
Plug 'agude/vim-eldar'
Plug 'itchyny/landscape.vim'
Plug 'morhetz/gruvbox'
call plug#end()

let g:NERDSpaceDelims = 1

map <C-_> <plug>NERDCommenterToggle<CR>
imap <C-_> <Esc><plug>NERDCommenterToggle<CR>i



let g:gruvbox_contrast_light="soft"
set background=light
colorscheme gruvbox

let mapleader = " "

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_global_extra_conf.py'
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]

let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1 
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


let g:netrw_localrmdir='rm -r'
let g:ctrlp_use_caching = 0

let g:std_io_user_command = {'cpp': "'g++ -DLOCAL -Wall -Wextra -O2 -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG --std=c++17 -o ' . expand('%:p:r') . '.o ' . expand('%:p') . ' && ' . expand('%:p:r') . '.o'"}

inoremap {<CR> {<CR>}<C-o>O



nnoremap Y y$
" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'v

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u

function! Nextfile()
	OI
	bn
endfunction

function! Prevfile()
	OI
	bp
endfunction

nnoremap <S-L> <C-W>l
nnoremap <S-H> <C-W>h
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :wincmd j<CR> 
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :call Nextfile()<CR> 
nnoremap <leader>h :call Prevfile()<CR> 
nnoremap <leader>test :!cf test<CR>
nnoremap <leader>submit :!cf submit<CR> 
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>nc :NERDTreeClose<CR>

nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>D gg"adG
nnoremap <leader>Y gg"+yG
nnoremap <leader>QQ :qa!<CR>
nnoremap <leader>WW :wqa<CR>
let g:ycm_auto_trigger=1
let g:ycm_semantic_triggers = {
\'c' : ['->', '    ', '.', ' ', '(', '[', '&'],
\'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
\}
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>nnnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" YCM
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
