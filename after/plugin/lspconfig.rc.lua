require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"rust_analyzer",
		"texlab",
		"tsserver",
	},
})

require("lspconfig").clangd.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").texlab.setup({})
require("lspconfig").tsserver.setup({})

local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Add new servers to list
local servers = { "clangd", "rust_analyzer", "texlab", "tsserver" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = require("lsp_utils").on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
