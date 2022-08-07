-----------------------------------------------------------
-- Plugin manager configuration file
-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim
-----------------------------------------------------------

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

   -- Git manager
  use { 'tpope/vim-fugitive' }

  -- Github for fugitive
  use {
    'tpope/vim-rhubarb',
    requires = { 'tpope/vim-fugitive' }
  }

  -- Git status on the lines
  use {
    'mhinz/vim-signify',
    config = function()
      -- Add navigation on diff
      local map = require("utils").map
      map('n', '<Leader>gj', '<plug>(signify-next-hunk)')
      map('n', '<Leader>gk', '<plug>(signify-prev-hunk)')
    end
  }

  -- Session management
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = { '~/', '~/Projects' }
      }
    end
  }

  -- Color sheme
  use {
    'dracula/vim',
    as = 'dracula'
  }

  -- LSP and autocompletion
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp').setup()
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    require = { 'L3MON4D3/LuaSnip' },
    config = function()
      require('plugins.cmp').setup()
    end
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'folke/lsp-colors.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'
  use 'weilbith/nvim-code-action-menu'

  -- Lualine
  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require('plugins.lualine').setup()
    end
  }

  -- Formatting
  use 'jose-elias-alvarez/null-ls.nvim'
  use {
    'MunifTanjim/prettier.nvim',
    require = { 'jose-elias-alvarez/null-ls.nvim' },
    config = function()
      require('plugins.prettier').setup()
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.telescope').setup()
    end
  }

  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({})
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter').setup()
    end
  }
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
