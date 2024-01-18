-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'sharkdp/fd' },
            { 'BurntSushi/ripgrep' },
        }
    }
    -- Color scheme
	use ({ "miikanissi/modus-themes.nvim" })

	use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {

			 {'williamboman/mason.nvim'},
			 {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

    use 'tpope/vim-fugitive'

    use {
        'akinsho/toggleterm.nvim', config = function()
            require("toggleterm").setup()
        end
    }

    use 'mbbill/undotree'

    use {
        'mfussenegger/nvim-dap',
        requires = {
            'theHamsta/nvim-dap-virtual-text',
            'rcarriga/nvim-dap-ui',
            'nvim-telescope/telescope-dap.nvim',
            'folke/neodev.nvim',
            'nvim-telescope/telescope-dap.nvim', -- I am trying to see if I need this
            'folke/neodev.nvim',
            'mortepau/codicons.nvim',
            'nvim-telescope/telescope-dap.nvim',
            'folke/neodev.nvim'
        }
    }

    use 'nvim-tree/nvim-web-devicons'

    use 'folke/trouble.nvim'

    use 'j-hui/fidget.nvim'

    -- To be determined if I need a linter
    use 'mfussenegger/nvim-lint'
end)
