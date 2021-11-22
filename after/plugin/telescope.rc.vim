if !exists('g:loaded_telescope')
  echom "Can't load telescope"
  finish
endif

nnoremap  <silent> <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>

lua << EOF
local telescope = require('telescope')

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-s>"] = "select_horizontal"
            },
        },
    }
}
EOF

