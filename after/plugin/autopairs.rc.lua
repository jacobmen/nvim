local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then
    print("can't load autopairs")
    return
end

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

autopairs.add_rules({
    Rule("$", "$", {"tex", "latex"})
        -- don't move right when repeat character
        :with_move(cond.none())
        -- disable adding a newline when you press <cr>
        :with_cr(cond.none())
    }
)

autopairs.add_rules({
    Rule("\[", "\]", {"tex", "latex"})
        -- don't move right when repeat character
        :with_move(cond.none())
        -- disable adding a newline when you press <cr>
        :with_cr(cond.none())
    }
)
