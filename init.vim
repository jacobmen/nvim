set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
" Turn off expandtab when in make file
autocmd FileType make setlocal noexpandtab
set autoindent
filetype plugin indent on
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set splitright
set splitbelow
set lazyredraw
set mouse=a
set inccommand=nosplit
syntax on

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Easier split movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let loaded_matchparen = 1
nnoremap <Space> <NOP>
let mapleader = " "

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()

" Fix indentation in file
map <F7> gg=G<C-o>

" Turn off auto-inserting comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Replace highlighted
vnoremap <leader>p "_dP
vnoremap X "_d

" Better escape key
inoremap <C-c> <esc>

" Yank to end of line
nnoremap Y y$

" Keep searches at center of screen when jumping
nnoremap n nzzzv
nnoremap N Nzzzv

" Include relative jumps in jumplist for <C-o>
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" Plugins
runtime ./plug.vim

" Colorscheme config
runtime ./colors.vim

" Mappings
runtime ./maps.vim

" Plugin options
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
