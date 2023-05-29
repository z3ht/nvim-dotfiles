-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'gaborvecsei/memento.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use("theprimeagen/harpoon")

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use("wellle/context.vim")
    use("romgrk/barbar.nvim")

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    use("nvim-treesitter/playground")

    use("tpope/vim-fugitive")
    use("mbbill/undotree")
    use "sindrets/diffview.nvim"
    use("junegunn/gv.vim")
    use('lewis6991/gitsigns.nvim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use("mfussenegger/nvim-dap")
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use("theHamsta/nvim-dap-virtual-text")

    use {
        'mrjones2014/legendary.nvim',
        requires = { { 'kkharji/sqlite.lua' } }
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2'
    }
    use {
        'ggandor/leap.nvim',
        requires = { 'tpope/vim-repeat' }
    }

    use('numToStr/Comment.nvim')

    use {
        'EthanJWright/vs-tasks.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    }

end)
