vim.opt.showmatch = false
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.nu = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backup = false
vim.opt.undodir = '~/.vim/undodir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.lazyredraw = true
vim.opt.mouse = 'a'
vim.opt.inccommand = 'nosplit'
vim.opt.laststatus = 3

-- Give more space for displaying messages.
vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append({ c = true })

vim.opt.colorcolumn = '100'
vim.cmd.highlight({ 'ColorColumn', 'ctermbg=0', 'guibg=lightgrey' })

-- Easier split movement
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

vim.g.loaded_matchparen = 1
vim.keymap.set('n', '<Space', '<NOP>')
vim.g.mapleader = ' '

-- Replace highlighted
vim.keymap.set('v', '<leader>p', '"_dP')
vim.keymap.set('v', 'X', '"_d')

-- Better escape key
vim.keymap.set('i', '<C-c>', '<esc>')

-- Keep searches at center of screen when jumping
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Include relative jumps in jumplist for <C-o>
-- TODO: convert to lua commands
vim.cmd([[
    nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
    nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
]])

require('plugins')

-- Mappings
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>v', ':VenterToggle<CR>', { silent = true })

vim.cmd([[
    runtime ./colors.vim
    runtime ./autocommands.vim
    " Plugin options
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
]])

vim.g.do_filetype_lua = 1
