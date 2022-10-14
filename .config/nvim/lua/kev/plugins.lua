local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup {
  function(use) -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

    use "gpanders/editorconfig.nvim"
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup {
          -- ignores empty lines
          ignore = "^$",
          pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
      end,
    }
    use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
    use { "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/toggleterm.nvim"
    -- use "ahmedkhalf/project.nvim"
    use {
      "lewis6991/impatient.nvim",
      config = function()
        require "impatient"
      end,
    }
    use "lukas-reineke/indent-blankline.nvim"

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/nvim-treesitter-refactor"
    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
    }
    use {
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup()
      end,
    }
    use "nvim-treesitter/playground"
    use {
      "andymass/vim-matchup",
    }
    use {
      "dhruvmanila/telescope-bookmarks.nvim",
      tag = "*",
      -- Uncomment if the selected browser is Firefox, Waterfox or buku
      requires = {
        "kkharji/sqlite.lua",
      },
    }

    -- text object
    use "wellle/targets.vim"
    -- use "junegunn/vim-easy-align"
    use {
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup {
          -- Configuration here, or leave empty to use defaults
        }
      end,
    }

    -- LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig" -- enable LSP
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    use "folke/lua-dev.nvim"
    use "RRethy/vim-illuminate"
    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- test
    use "vim-test/vim-test"
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-vim-test",
        "nvim-neotest/neotest-plenary",
        "haydenmeade/neotest-jest",
      },
    }

    use "klesh/nvim-runscript"
    use "diepm/vim-rest-console"

    -- dap
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use "theHamsta/nvim-dap-virtual-text"
    use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
    use {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npm run compile",
    }

    -- Telescope
    use "sharkdp/fd"

    -- use { "nvim-telescope/telescope.nvim", tag = "0.1.0" }
    use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "nvim-telescope/telescope-node-modules.nvim"
    use "LinArcX/telescope-env.nvim"
    use "LinArcX/telescope-command-palette.nvim"
    use {
      "AckslD/nvim-neoclip.lua",
      requires = {
        { "kkharji/sqlite.lua", module = "sqlite" },
        -- you'll need at least one of these
        { "nvim-telescope/telescope.nvim" },
        -- {'ibhagwan/fzf-lua'},
      },
      config = function()
        require("neoclip").setup()
      end,
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use "nvim-telescope/telescope-dap.nvim"

    --fzf
    use "junegunn/fzf"
    use "junegunn/fzf.vim"

    -- cmp plugins
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmd completions
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "saadparwaiz1/cmp_luasnip" -- lua snippet completions

    use "hrsh7th/cmp-nvim-lua" -- complete neovim lua runtime API, eg vim.lsp.*
    use "hrsh7th/cmp-nvim-lsp-signature-help"

    -- Git
    use "lewis6991/gitsigns.nvim"
    use "tpope/vim-fugitive"
    use "junegunn/gv.vim"
    use "kdheepak/lazygit.nvim"

    -- json schemastore
    use "b0o/schemastore.nvim"

    -- markdown
    use { "ellisonleao/glow.nvim" }
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    }
    -- use "vim-pandoc/vim-pandoc"
    -- use "vim-pandoc/vim-pandoc-syntax"

    -- utils
    use {
      "anuvyklack/windows.nvim",
      requires = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim",
      },
    }
    use "tyru/open-browser.vim"
    use "norcalli/nvim-colorizer.lua"
    use "KabbAmine/vCoolor.vim"
    use "dyng/ctrlsf.vim"
    use "vimwiki/vimwiki"
    use "christoomey/vim-tmux-navigator"
    use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"

    -- Colorschemes
    use "EdenEast/nightfox.nvim"
    use "folke/tokyonight.nvim"
    use "mhartington/oceanic-next"
    use "arcticicestudio/nord-vim"
    use "altercation/vim-colors-solarized"
    use "morhetz/gruvbox"
    use "sainnhe/everforest"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    max_jobs = 32,
  },
}
