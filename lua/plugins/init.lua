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
  use 'wbthomason/packer.nvim'       -- Package manager
  use 'Th3Whit3Wolf/one-nvim' -- current theme
  -- minimap
  use 'wfxr/minimap.vim'
-- Russian!
  use 'lyokha/vim-xkbswitch'
-- Quotes and parenthesis are best friends
  use 'tpope/vim-surround'
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

-- Status line, has nvim buffer requirements
  use {'glepnir/galaxyline.nvim', branch = 'main'}
  -- Theme for status line
  use "Iron-E/nvim-highlite"

-- Colorschemes
  use {'marko-cerovac/material.nvim', requires = 'tjdevries/colorbuddy.nvim'}
  use 'joshdick/onedark.vim'
  use 'gruvbox-community/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'sainnhe/edge'
  use "rafamadriz/neon"

-- LSP and Autocomplete
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'
  use 'windwp/nvim-autopairs'
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

-- Terminal Integration
  use 'akinsho/nvim-toggleterm.lua'

-- Navigation
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
  use 'kyazdani42/nvim-tree.lua'
  use 'phaazon/hop.nvim'


-- Other
  use {'terrortylor/nvim-comment', config = "require('nvim_comment').setup()"}
  use 'monaqa/dial.nvim' -- can intrement floatings
  use 'lukas-reineke/format.nvim' -- format file


  --------------------------------------------------- In progress
  --
-- Tree-Sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'p00f/nvim-ts-rainbow'
  --
  --
-- Debugger
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

-- Snippets
  -- use 'hrsh7th/vim-vsnip'
  -- use 'hrsh7th/vim-vsnip-integ'


-- Version Control
  use 'kdheepak/lazygit.nvim'
  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = "require('neogit').setup {}"}
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
  -- use 'tpope/vim-fugitive'           -- Git commands in nvim
  -- use 'tpope/vim-rhubarb'            -- Fugitive-companion to interact with github

--
end)

