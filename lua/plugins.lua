return {
	"folke/lazy.nvim",
	"rmagatti/auto-session",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	-- Doc generation (<leader>d)
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>d",
				":lua require('neogen').generate()<CR>",
				{ noremap = true, silent = true }
			)
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
		},
		version = "*",
	},
	-- Undo Tree (<leader>u)
	"mbbill/undotree",
	-- Center buffer (<leader>v)
	"jmckiern/vim-venter",
	"lewis6991/gitsigns.nvim",
	"neovim/nvim-lspconfig",
	"tami5/lspsaga.nvim",
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"folke/trouble.nvim",
	"nvim-lualine/lualine.nvim",
	-- Colorscheme
	{
		"gruvbox-community/gruvbox",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[
                let g:gruvbox_contrast_dark = 'hard'
                if exists('+termguicolors')
                    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
                    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
                endif
                let g:gruvbox_invert_selection = '0'

                colorscheme gruvbox
                set background=dark
            ]])
		end,
	},
	"lervag/vimtex",
	"vimwiki/vimwiki",
	{
		"anuvyklack/windows.nvim",
		dependencies = "anuvyklack/middleclass",
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jayp0521/mason-null-ls.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			signs = false,
		},
	},
}
