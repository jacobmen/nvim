local status, lualine = pcall(require, "lualine")
if (not status) then
    print("can't load lualine")
    return
end

require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp'}}},
    lualine_c = {{
      'filename',
      -- displays file status (readonly status, modified status)
      file_status = true,
      -- 0 = just filename, 1 = relative path, 2 = absolute path
      path = 1
    }},
    lualine_x = {
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

