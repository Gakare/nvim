-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use({ "wbthomason/packer.nvim" })

    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "sharkdp/fd" },
            { "BurntSushi/ripgrep" },
        },
    })

    -- Color scheme
    use({ "dasupradyumna/midnight.nvim" })

    use({ "nvim-treesitter/nvim-treesitter" }, { "TSUpdate" })

    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {

            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- LSP Support
            { "neovim/nvim-lspconfig" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
            -- luasnip completion source for nvim-cmp
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-path" },
        },
    })

    use({ "tpope/vim-fugitive" })

    use({
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup()
        end,
    })

    use({ "mbbill/undotree" })

    use({
        "mfussenegger/nvim-dap",
        requires = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "nvim-telescope/telescope-dap.nvim",
            "folke/neodev.nvim",
            "nvim-telescope/telescope-dap.nvim", -- I am trying to see if I need this
            "folke/neodev.nvim",
            "mortepau/codicons.nvim",
            "nvim-telescope/telescope-dap.nvim",
            "folke/neodev.nvim",
            "nvim-neotest/nvim-nio",
        },
    })

    use({ "nvim-tree/nvim-web-devicons" })

    use({ "folke/trouble.nvim" })

    use({ "j-hui/fidget.nvim" })

    use({ "stevearc/conform.nvim" })

    use({ "mfussenegger/nvim-lint" })

    use({ "prichrd/netrw.nvim" })

    use({ "nvim-lualine/lualine.nvim" })

    use({ "norcalli/nvim-colorizer.lua" })
end)
