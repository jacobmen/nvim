if !exists('g:loaded_nvim_treesitter')
  echom "Can't load treesitter"
  finish
endif

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    }
  },
  ensure_installed = {
    "c",
    "cpp",
    "dockerfile",
    "html",
    "json",
    "lua",
    "python",
    "rust",
    "toml",
    "typescript",
    "haskell"
  },
}

EOF

