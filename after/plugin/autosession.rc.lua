local status, autosession = pcall(require, "auto-session")
if (not status) then
    print("can't load autosession")
    return
end

require('auto-session').setup { }
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

