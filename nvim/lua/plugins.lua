vim.cmd([[
  packadd packer.nvim
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function()
    use("wbthomason/packer.nvim") -- let packer manage itself
    use("kyazdani42/nvim-web-devicons")
    use("tpope/vim-commentary")
    use {
        'windwp/nvim-autopairs',
        -- config = [[ require('config/autopairs') ]]
    }
    use({
        "nvim-treesitter/nvim-treesitter",
        config = [[require('config.treesitter')]],
        requires = {
            "windwp/nvim-autopairs",
            "windwp/nvim-ts-autotag",
        },
        wants = {
            "nvim-autopairs",
            "nvim-ts-autotag",
        },
        run = ":TSUpdate",
    })
    use({
        {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
                "telescope-frecency.nvim",
                "telescope-fzf-native.nvim",
            },
            wants = {
                "popup.nvim",
                "plenary.nvim",
                "telescope-frecency.nvim",
                "telescope-fzf-native.nvim",
            },
            setup = [[require('config.telescope_setup')]],
            config = [[require('config.telescope')]],
            cmd = "Telescope",
            module = "telescope",
        },
        {
            "nvim-telescope/telescope-frecency.nvim",
            after = "telescope.nvim",
            requires = "tami5/sql.nvim",
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
        },
    })
    use({
        "neovim/nvim-lspconfig",
        config = [[require('config.lspconfig')]],
        requires = {
            "onsails/lspkind-nvim",
        },
    })
    use "rafamadriz/friendly-snippets"
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            "hrsh7th/cmp-nvim-lsp",
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
        },
        config = [[require('config.cmp')]],
        event = "InsertEnter *",
    })
    use { -- Snippet Engine for Neovim written in Lua.
        'L3MON4D3/LuaSnip',
        requires = {
            "rafamadriz/friendly-snippets", -- Snippets collection for a set of different programming languages for faster development.
        },
        config = [[ require('config/luasnip') ]],
    }
    -- use({ "ygm2/rooter.nvim", config = [[require('config.rooter')]] })
    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require('config.bufferline')]],
    })
    use("tpope/vim-eunuch")
    use({
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        event = "BufReadPre",
        config = [[require('config.gitsigns')]],
    })
    -- use({ "ray-x/go.nvim", config = [[require('config.go')]] })
    use("nvim-telescope/telescope-file-browser.nvim")
    use({ "hoob3rt/lualine.nvim", config = [[require('config.lualine')]] })
    use { "akinsho/toggleterm.nvim", tag = '*', config = [[require('config.toggleterm')]] }
    use({
        "kyazdani42/nvim-tree.lua",
        config = [[require('config.nvimtree')]],
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })
    -- use({ "jose-elias-alvarez/null-ls.nvim", config = [[require('config.nullls')]] })
    use({
        'ThePrimeagen/harpoon',
        config = [[require('config.harpoon')]]
    })
    use {
        'rmagatti/auto-session',
        config = [[require('config.autosession')]]
    }
    use {
        'catppuccin/nvim',
        as = "catppuccin",
        config = [[require('config.catppuccin')]]
    }
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {}
        end
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
    }
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'tpope/vim-fugitive' }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
            require('config.textobjects')
        end
    }
    use {
        'williamboman/nvim-lsp-installer',
        config = [[ require('config/lspinstaller') ]]
    }
    use {
        'onsails/lspkind-nvim',
        config = [[ require('config/lspkind') ]]
    }
    use { -- Utility functions for getting diagnostic status and progress messages from LSP servers, for use in the Neovim statusline
        'nvim-lua/lsp-status.nvim',
        config = [[ require('config/lspstatus') ]]
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }
    use {
        "vim-test/vim-test",
        config = [[ require('config/vim-test') ]]
    }
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-vim-test",
            "adrigzr/neotest-mocha",
        },
        config = [[ require('config/neotest') ]],
    }
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                detection_methods = { "lsp", "pattern" },
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" },
            }
        end
    }
end)
