local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then
    print("can't load autopairs")
    return
end

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
