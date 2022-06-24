let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'

" use nvim-cmp for completion
let g:vimtex_complete_enabled = 0
" use TreeSitter for syntax
let g:vimtex_syntax_enabled = 0
" unnecessary when using snippets
let g:vimtex_imaps_enabled = 0
