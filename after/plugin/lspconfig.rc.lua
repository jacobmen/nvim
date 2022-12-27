require("mason").setup()

local nvim_lsp = require("lspconfig")
local mason_lsp = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lsp.setup({
	ensure_installed = {
		"clangd",
		"rust_analyzer",
		"texlab",
		"tsserver",
	},
})

mason_lsp.setup_handlers({
	-- default handler
	function(server_name)
		nvim_lsp[server_name].setup({
			on_attach = require("lsp_utils").on_attach,
			capabilities = capabilities,
		})
	end,
})
