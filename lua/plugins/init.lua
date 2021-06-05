local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
-- Boss inda house
  use 'wbthomason/packer.nvim'       -- Package manager
-- current theme
 use 'Th3Whit3Wolf/one-nvim' 
-- Russian!
  use 'lyokha/vim-xkbswitch'
-- Quotes and parenthesis are best friends
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require "surround".setup {
      }
    end
  }
-- Add indentation guides even on blank lines
  use { 'lukas-reineke/indent-blankline.nvim', branch="lua" }
-- Leader the best
  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {}
  end
}
-- Syntax Highlighting and Visual Plugins
  use 'norcalli/nvim-colorizer.lua'
  use 'tjdevries/colorbuddy.nvim'
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons', config = "require'bufferline'.setup{}"}
  use 'mhinz/vim-startify'
  -- use 'glepnir/dashboard-nvim'
  -- use 'rmagatti/auto-session' 
  -- use 'rmagatti/session-lens'
-- Tree sitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use 'p00f/nvim-ts-rainbow'
-- Status line, has nvim buffer requirements
use {'glepnir/galaxyline.nvim', branch = 'main'}
-- Theme for status line
  use "Iron-E/nvim-highlite"
-- LSP and Autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'windwp/nvim-autopairs'
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
-- Terminal Integration
  use 'akinsho/nvim-toggleterm.lua'
-- Navigation
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
  use 'kyazdani42/nvim-tree.lua'
  use 'phaazon/hop.nvim'
  use 'unblevable/quick-scope'
-- Other
  use {'terrortylor/nvim-comment', config = "require('nvim_comment').setup()"}
-- Version Control
  use 'kdheepak/lazygit.nvim'
  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = "require('neogit').setup {}"}
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
-- Debugger
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  -- use 'haringsrob/nvim_context_vt'
  use 'tell-k/vim-autopep8'

  -- use {'https://github.com/vimwiki/vimwiki', branch = 'dev' }
  use 'https://github.com/vimwiki/vimwiki'
  use 'https://github.com/godlygeek/tabular'
  use 'https://github.com/plasticboy/vim-markdown'

--
end)

