if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  dianostic_header_icon = "",
  -- code action title icon
  code_action_icon = "〉",
  code_action_prompt = {
    enable = false,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "",
  finder_reference_icon = "",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "<CR>",
    vsplit = "<C-v>",
    split = "<C-S>",
    quit = "<C-c>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
}

EOF
