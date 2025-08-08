return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			-- lua
			"lua_ls",
			-- python
			"ruff",
			"pyright",
			-- haskell
			"haskell-language-server",

			-- markdown
			"marksman",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
