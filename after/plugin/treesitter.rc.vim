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
    "typescript"
  },
}

EOF

