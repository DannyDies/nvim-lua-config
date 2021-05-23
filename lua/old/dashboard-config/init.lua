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

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
    b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
    e = {description = {'  Config             '}, command = 'edit ~/.config/nvim/init.lua'},
    f = {description = {'  Git                '}, command = 'LazyGit'}
}
vim.g.dashboard_custom_footer = {''}


