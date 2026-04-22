return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						"lua_ls", --lua

						"pyright", --python
						"ruff",

						"clangd", --c

						"bashls", --bash

						"marksman", --md

						"rust_analyzer", --rust
					},
				},
			},
			"saghen/blink.cmp",
			{ "jinzhongjia/LspUI.nvim", branch = "main", opts = {} },
			{
				"Dan7h3x/signup.nvim",
				branch = "main",
				opts = {
					trigger_chars = { "(", ",", ")", "<C-y>" },
				},
			},
		},
		config = function()
			vim.keymap.set("n", "<leader>ui", "<cmd>LspUI inlay_hint<CR>", { desc = " Toggle inlay hints" })
			vim.keymap.del("n", "<leader>sd")
			-- One place for your LSP keymaps + inlay hints for ANY server
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("my.lsp", {}),
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local function map(m, lhs, rhs, desc)
						vim.keymap.set(m, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
					end
					map("n", "K", "<cmd>LspUI hover<CR>", "Hover")
					map({ "n", "i" }, "<cmd>LspUI signature<CR>", "<C-k>", "Signature help")
					map("n", "gl", "<cmd>LspUI hover<CR>", "Line diagnostics")
					map("n", "[d", "<cmd>LspUI diagnostic prev<CR>", "Prev diagnostic")
					map("n", "]d", "<cmd>LspUI diagnostic next<CR>", "Next diagnostic")
					map("n", "gD", "<cmd>LspUI declaration<CR>", "Go to declaration")
					map("n", "gd", "<cmd>LspUI definition<CR>", "Go to definition")
					map("n", "gi", "<cmd>LspUI implementation<CR>", "Go to implementation")
					map("n", "<space>cr", "<cmd>LspUI rename<CR>", " Rename symbol")
					map("n", "<leader>ca", "<cmd>LspUI code_action<CR>", " Code actions")
					map("n", "<leader>ci", "<cmd>LspUI call_hierarchy incoming_calls<CR>", " Show incoming calls")

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
	{
		{
			"jinzhongjia/LspUI.nvim",
			branch = "main",
			event = "LspAttach",
			config = function()
				local LspUI = require("LspUI")
				LspUI.setup()
			end,
			keys = {
				{ "K", "<cmd>LspUI hover<CR>", desc = "LSP hover" },
				{ "gr", "<cmd>LspUI reference<CR>", desc = "Go to reference" },
				{ "gd", "<cmd>LspUI definition<CR>", desc = "Go to definition" },
				{ "gt", "<cmd>LspUI type_definition<CR>", desc = "Go to type definition" },
				{ "gi", "<cmd>LspUI implementation<CR>", desc = "Go to implementation" },
				{ "<leader>cr", "<cmd>LspUI rename<CR>", desc = "LSP rename" },
				{ "<leader>ca", "<cmd>LspUI code_action<CR>", desc = " Code actions" },
				{ "<leader>ci", "<cmd>LspUI call_hierarchy incoming_calls<CR>", desc = " Show incoming calls" },
				{
					"<leader>cI",
					"<cmd>LspUI call_hierarchy outgoing_calls<CR>",
					desc = " Show outgoing_calls calls",
				},
			},
		},
	},
}
