return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("rmagatti/auto-session")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	-- Doc generation (<leader>d)
	use({
		"kkoomen/vim-doge",
		run = ":call doge#install()",
	})
	-- Undo Tree (<leader>u)
	use("mbbill/undotree")
	-- Center buffer (<leader>v)
	use("jmckiern/vim-venter")
	use("lewis6991/gitsigns.nvim")
	use({ "neovim/nvim-lspconfig", "tami5/lspsaga.nvim" })
	use({
		"hrsh7th/cmp-nvim-lsp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
		},
	})
	use({
		"L3MON4D3/LuaSnip",
		requires = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	})
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("folke/trouble.nvim")
	use("nvim-lualine/lualine.nvim")
	-- Colorscheme
	use({
		"gruvbox-community/gruvbox",
		requires = "sainnhe/gruvbox-material",
	})
	use("lervag/vimtex")
	use("vimwiki/vimwiki")
	use({
		"anuvyklack/windows.nvim",
		requires = "anuvyklack/middleclass",
	})
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
end)
