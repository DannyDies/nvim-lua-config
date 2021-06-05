vim.g.startify_custom_header = {
  [[                                            ]],
  [[        _   ____________        _           ]],
  [[       / | / / ____/ __ \_   __(_)___ ___   ]],
  [[      /  |/ / __/ / / / / | / / / __ `__ \  ]],
  [[     / /|  / /___/ /_/ /| |/ / / / / / / /  ]],
  [[    /_/ |_/_____/\____/ |___/_/_/ /_/ /_/   ]],
  [[                                            ]],
  [[                                            ]]
}


-- start Vim in a directory that contains a Session.vim, that session will be loaded automatically
vim.g.startify_session_autoload = 1
-- Let Startify take care of buffers
vim.g.startify_session_delete_buffers = 1
-- Similar to Vim-rooter
vim.g.startify_change_to_vcs_root = 1
-- Unicode
vim.g.startify_fortune_use_unicode = 1
-- Automatically update sessions
vim.g.startify_session_persistence = 1
-- Get rid of empy buffer on quit
vim.g.startify_enable_special = 0
-- The number of files to list.
vim.g.startify_files_number =  7
-- The number of spaces used for left padding.
-- vim.g.startify_padding_left = 15
-- Header
-- vim.g.startify_custom_header = "startify#center(g:custom_header)"

-- Disable wierd thing
vim.g.indentLine_fileTypeExclude = {'startify'}

-- Session folder
vim.g.startify_session_dir = '~/.config/nvim/session'
-- vim.g.startify_session_dir = vim.fn.stdpath("data") .. "/startify_session"


vim.g.startify_lists = {{
        type = 'commands',
        header = {'   Commands'}
    }, {
        type = 'sessions',
        header = {'   Sessions'}
    }, {
        type = 'files',
        header = {'   Recent'}
    }, {
        type = 'bookmarks',
        header = {'   Bookmarks'}
    }}
  -- , {
  --       type = 'dir',
  --       header = {'   Curent Directory '..vim.fn.getcwd()..':'}
  --   }}


vim.api.nvim_exec(
    "let startify_bookmarks = [{ 'a': '~/.config/alacritty/alacritty.yml' }, { 'i': '~/.config/nvim/init.lua' }, { 'z': '~/.zshrc' }, { 'd': '~/.dotfileslist' },{ 'o': '~/Second-Brain/.obsidian.vimrc' },]", true)

-- , { 's': '~/Second-Brain/-000 Scratchpad.md' }

vim.g.startify_commands = { {
  pu = { "Update Plugins", ":PackerUpdate" }
}, {
  ps = { "Sync Plugins", ":PackerSync" }
},{
  pi = { "Install Plugins", ":PackerInstall" }
}, {
  pc = { "Clean up Plugins", ":PackerClean" }
}, }

