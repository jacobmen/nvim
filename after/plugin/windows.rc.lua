require('windows').setup({
    autowidth = {
        enable = false,
    },
    animation = {
        enable = false,
    }
})

vim.keymap.set('n', '<C-w>o', '<Cmd>WindowsMaximize<CR>')
