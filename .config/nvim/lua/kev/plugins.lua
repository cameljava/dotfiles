local status, packer = pcall(require, "packer")
if not status then
  print "Packer is not installed"
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "lewis6991/impatient.nvim"

  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim" -- Common utilities
  use "kyazdani42/nvim-web-devicons" -- File icons

  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"

  -- lsp
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig" -- LSP

  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "folke/neodev.nvim"
  use "RRethy/vim-illuminate"

  --format
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use "MunifTanjim/prettier.nvim" -- Prettier plugin for Neovim's built-in LSP client

  -- complete
  use "hrsh7th/nvim-cmp" -- Completion
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-path" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-cmdline" -- nvim-cmp source for buffer words
  use "saadparwaiz1/cmp_luasnip" -- lua snippet completions
  use {
    "petertriho/cmp-git",
    config = function()
      require("cmp_git").setup()
    end,
  }

  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --tree-sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update { with_sync = true }
      ts_update()
    end,
  }
  use "nvim-treesitter/playground"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "nvim-treesitter/nvim-treesitter-context"
  use {
    "andymass/vim-matchup",
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  }

  --fzf
  use "junegunn/fzf"
  use "junegunn/fzf.vim"

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-file-browser.nvim"
  use "LinArcX/telescope-env.nvim"
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
  use {
    "dhruvmanila/telescope-bookmarks.nvim",
    tag = "*",
    -- Uncomment if the selected browser is Firefox, Waterfox or buku
    requires = {
      "kkharji/sqlite.lua",
    },
  }
  use "nvim-telescope/telescope-dap.nvim"

  -- utils
  use { "fgheng/winbar.nvim" }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "norcalli/nvim-colorizer.lua"
  use "nvim-lualine/lualine.nvim" -- Statusline
  use "wincent/ferret"
  -- use "akinsho/nvim-bufferline.lua"
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  }
  use {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  }

  use {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup()
    end,
  }
  use {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {}
    end,
  }
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {}
    end,
  }

  use "francoiscabrol/ranger.vim"
  use "rbgrouleff/bclose.vim"

  -- test
  use "akinsho/toggleterm.nvim"
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

  -- debug
  use "mfussenegger/nvim-dap"
  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use "theHamsta/nvim-dap-virtual-text"
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  }

  -- ft
  use "b0o/schemastore.nvim"
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  }
  use {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
  }
  use "diepm/vim-rest-console"

  -- comment
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
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  use "junegunn/gv.vim"

  use {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  }

  -- language
  use "rust-lang/rust.vim"
  use "mustache/vim-mustache-handlebars"

  -- colorschema
  -- use {
  --   "svrana/neosolarized.nvim",
  --   requires = { "tjdevries/colorbuddy.nvim" },
  -- }
  use "folke/tokyonight.nvim"
  use "EdenEast/nightfox.nvim"
  use "sainnhe/everforest"
  use { "catppuccin/nvim", as = "catppuccin" }
end)
