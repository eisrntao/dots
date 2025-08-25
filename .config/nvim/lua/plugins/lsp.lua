return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"mason-org/mason-lspconfig.nvim",
				opts = { ensure_installed = { "lua_ls", "pyright", "ruff", "hls", "bashls", "marksman" } },
			},
			"saghen/blink.cmp",
		},
		config = function()
			-- One place for your LSP keymaps + inlay hints for ANY server
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("my.lsp", {}),
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local function map(m, lhs, rhs, desc)
						vim.keymap.set(m, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
					end

					map("n", "K", vim.lsp.buf.hover, "Hover")
					map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "Signature help")
					map("n", "gl", vim.diagnostic.open_float, "Line diagnostics")
					map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
					map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
					map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
					map("n", "gd", vim.lsp.buf.definition, "Go to definition")
					map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
					map("n", "<space>cr", vim.lsp.buf.rename, " Rename symbol")

					-- Native inlay hints (0.11 API): enable per-buffer
					if client and client.supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) -- use filter style on 0.11
					end
				end,
			})

			-- Give every server Blink’s completion capabilities
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- 0.11: define defaults for all servers once
			vim.lsp.config("*", {
				capabilities = capabilities,
				root_markers = { ".git" },
			})

			-- Per-server tweaks
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						hint = { enable = true },
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							inlayHints = {
								variableTypes = true,
								functionReturnTypes = true,
								callArgumentNames = "all",
							},
						},
					},
				},
			})

			-- Finally, auto-start these servers whenever files match their filetypes
			vim.lsp.enable({ "lua_ls", "pyright", "ruff", "hls", "bashls", "marksman" })
			-- (0.11 adds vim.lsp.config/enable; you can also add lsp/<name>.lua files.) :contentReference[oaicite:1]{index=1}
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "classic",
				transparent_bg = true,
				multilines = { enabled = true, always_show = true },
			})
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
			})
		end,
	},
}
