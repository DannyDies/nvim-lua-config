
vim.g.dashboard_custom_header = {
  [[                                            ]],
  [[        _   ____________        _           ]],
  [[       / | / / ____/ __ \_   __(_)___ ___   ]],
  [[      /  |/ / __/ / / / / | / / / __ `__ \  ]],
  [[     / /|  / /___/ /_/ /| |/ / / / / / / /  ]],
  [[    /_/ |_/_____/\____/ |___/_/_/ /_/ /_/   ]],
  [[                                            ]],
  [[                                            ]]
}


vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_session_directory = '/home/dannydies/.config/nvim/session'
vim.g.indentLine_fileTypeExclude = 'dashboard'
-- vim.cmd'autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
    c = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
    d = {description = {'  Session Search     '}, command = "lua require('session-lens').search_session()"},
    f = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    g = {description = {'  init.lua           '}, command = 'edit ~/.config/nvim/init.lua'},
    h = {description = {'  alacritty.yml      '}, command = 'edit ~/.config/alacritty/alacritty.yml'},
    i = {description = {'  zshrc              '}, command = 'edit ~/.zshrc'},
    k = {description = {'  dotfileslist       '}, command = 'edit ~/.dotfileslist'},
    l = {description = {'  obsidian.vimrc     '}, command = 'edit ~/Second-Brain/.obsidian.vimrc'},
}

    -- g = {description = {'  Load Last Session  '}, command = 'SessionLoad'},

vim.g.dashboard_custom_footer = {'--- Do nothing, do it well ---'}
