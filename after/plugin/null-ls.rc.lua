local null_ls = require("null-ls")

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		code_actions.gitsigns,

		formatting.stylua,
		formatting.black,

		-- Docker linting
		diagnostics.hadolint,
		diagnostics.markdownlint,
		diagnostics.shellcheck,
		diagnostics.yamllint,
	},
	on_attach = require("lsp_utils").on_attach,
})

require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
	automatic_setup = false,
})
