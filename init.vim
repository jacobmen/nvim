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

call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Debugger
Plug 'puremourning/vimspector'

" Git wrapper
Plug 'tpope/vim-fugitive'
" Man pages in vim (use Vman for vertical split)
Plug 'vim-utils/vim-man'
" Use <leader> u to toggle
Plug 'mbbill/undotree'
" Syntax highlight pack
Plug 'sheerun/vim-polyglot'
" Show file changes
Plug 'airblade/vim-gitgutter'
" Color parentheses pairs
Plug 'junegunn/rainbow_parentheses.vim'

" C++
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-scripts/DoxygenToolkit.vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Theme
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug '/home/mpaulson/personal/vim-be-good'

" Comments
Plug 'tpope/vim-commentary'

" Color first occurence of chars in line (for f/t/F/T)
Plug 'unblevable/quick-scope'

" HTML close tags
Plug 'alvan/vim-closetag'

call plug#end()

"-----------------------------  QUICK SCOPE  ----------------------------------------

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

let g:qs_max_chars=150

"----------------------------- Theme ----------------------------------------

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

"-----------------------------FUZZY FINDER----------------------------------------

" Config fuzzy finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

" Ignore node modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let $FZF_DEFAULT_OPTS = '--reverse'

if executable('rg')
  let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height':0.8 } }

nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" IMPORTANT: FuGITive has problems due to change of ; and ;
nnoremap ; :
nnoremap : ;
"inoremap ; :
"inoremap : ;

"-----------------------------  COC  ----------------------------------------

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" C++ specific
nnoremap <silent> <leader>gh :CocCommand clangd.switchSourceHeader<CR>

"-----------------------------  Vim-Go  ----------------------------------------

let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_textobj_enabled = 0
let g:go_gopls_enabled = 0
let g:go_mod_fmt_autosave = 0
let g:go_fmt_autosave = 0

let g:go_fold_enable = []

let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"-----------------------------  Vimspector  ----------------------------------------
" F3 = vimspector#Stop()
" F4 = vimspector#Restart()
" F5 = vimspector#Continue()
" F6 = vimspector#Pause()
" F8 = vimspector#AddFunctionBreakpoint( '<cexpr>' )
" <leader>F9 = vimspector#ToggleBreakpoint()
" F10 = vimspector#StepOver()
" F12 = vimspector#StepOut()
let g:vimspector_enable_mappings = 'HUMAN'

" F2 = vimspector#StepInto() (F11 by default maximizes screen)
nmap <F2> <Plug>VimspectorStepInto

"-----------------------------  FuGITive  ----------------------------------------
" IMPORTANT: The commands start with ; because FuGITive has problems due to
" the change of : and ;. The other mappings are fine.
nmap <leader>gj ;diffget //3<CR>
nmap <leader>gf ;diffget //2<CR>
nmap <leader>gs ;G<CR>

"----------------------------- TERMINAL ----------------------------------------
" Terminal
:tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" Toggle 'default' terminal
nnoremap <C-n> :call ChooseTerm("term-slider", 1)<CR>
inoremap <C-n> <C-\><C-n>:call ChooseTerm("term-slider", 1)<CR>
" Start terminal in current pane
"nnoremap <C-k> :call ChooseTerm("term-pane", 0)<CR>

function! ChooseTerm(termname, slider)
  let pane = bufwinnr(a:termname)
  let buf = bufexists(a:termname)
  if pane > 0
    " pane is visible
    if a:slider > 0
      :exe pane . "wincmd c"
    else
      :exe "e #"
    endif
  elseif buf > 0
    " buffer is not in pane
    if a:slider
      :exe "split"
      :exe "resize 10"
    endif
    :exe "buffer " . a:termname
  else
    " buffer is not loaded, create
    if a:slider
      :exe "split"
      :exe "resize 10"
    endif
    :terminal
    :exe "f " a:termname
  endif
endfunction

"----------------------------- Comments ----------------------------------------
noremap <leader>/ :Commentary<cr>

" Add doxygen comment
noremap <leader>d :Dox<cr>

"-----------------------------  HTML vim-closetag ----------------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 0
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

"----------------------------- Parentheses ----------------------------------------
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#blacklist = ['#a89984', '#928374', '#d5c4a1', 'ebdbb2', 'fbf1c7']

augroup parens
  autocmd!
  autocmd BufEnter * :RainbowParentheses
augroup END

"-------------------------------  QOL  -------------------------------------------
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

" Automatically insert a new line when { used at end of line and move cursor
" to it
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Fix indentation in file
map <F7> gg=G<C-o>

" Turn off auto-inserting comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Replace highlighted
vnoremap <leader>p "_dP
vnoremap X "_d

" Better escape key
inoremap <C-c> <esc>
