require("trouble").setup {
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    padding = false,
    action_keys = {
        cancel = "<c-c>", -- cancel the preview and get back to last window / buffer / cursor
    },
    signs = {
        -- icons / text used for a diagnostic
        error = "E",
        warning = "W",
        hint = "H",
        information = "I"
    },
    use_diagnostic_signs = false
}

local opts = {silent = true, noremap = true}

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xt", "<cmd>Trouble telescope<cr>", opts)
