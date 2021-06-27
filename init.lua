-- General
require('general')
require('plugins')
require('keymapping')
require('which-key-config')

-- Visual
require('colorscheme.one-vim')
require('lualine-config')
require('colorizer-config')

-- Terminal
require('toggleterm-config')

-- Autocomplete
require('lsp-config')
require('compe-config')
require('autopairs-config')
require('treesitter-config')
require('autopep8-config')

-- Ez life
require('kommentary-config')
require('surround-config')
require('easy-config')

-- Nav
require('telescope-config')
require('telescope-config.finders')
require('nvimtree-config')
require('startify-config')

-- Git
require('lazygit-config')
require('gitsigns-config')

-- Debugger
require('debugpy')
require('dap-config')
require('debug-text-config')
require('dapui-config')

-- Vim wiki
require('vim-markdown-config')
require('vim-wiki-config')
