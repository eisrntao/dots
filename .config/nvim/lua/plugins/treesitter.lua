return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			require("nvim-treesitter").setup({})

			-- install
			require("nvim-treesitter").install({
				"bash",
				"css",
				"haskell",
				"html",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
				"typst",
				"vimdoc",
				"yaml",
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "<filetype>" },
				callback = function()
					-- highlight
					vim.treesitter.start()

					-- folds
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"

					-- indent
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		-- textobjects
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true

			-- Or, disable per filetype (add as you like)
			-- vim.g.no_python_maps = true
			-- vim.g.no_ruby_maps = true
			-- vim.g.no_rust_maps = true
			-- vim.g.no_go_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
						["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
						["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
						["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
						["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
						["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },
						["ad"] = {
							query = "@function.outer",
							desc = "Select outer part of a method/function definition",
						},
						["id"] = {
							query = "@function.inner",
							desc = "Select inner part of a method/function definition",
						},
						["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
					},
				},

				move = {
					enable = true,
					set_jumps = true,
				},
			})

			-- swap
			vim.keymap.set("n", "gsp", function()
				require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
			end)
			vim.keymap.set("n", "gsP", function()
				require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
			end)

			-- movement
			vim.keymap.set({ "n", "x", "o" }, "]f", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]]", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
			end)
			-- You can also pass a list to group multiple queries.
			vim.keymap.set({ "n", "x", "o" }, "]o", function()
				require("nvim-treesitter-textobjects.move").goto_next_start(
					{ "@loop.inner", "@loop.outer" },
					"textobjects"
				)
			end)
			-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
			vim.keymap.set({ "n", "x", "o" }, "]s", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]z", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
			end)

			vim.keymap.set({ "n", "x", "o" }, "]F", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "][", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
			end)

			vim.keymap.set({ "n", "x", "o" }, "[f", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[[", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
			end)

			vim.keymap.set({ "n", "x", "o" }, "[F", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[]", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
			end)

			-- Go to either the start or the end, whichever is closer.
			-- Use if you want more granular movements
			vim.keymap.set({ "n", "x", "o" }, "]d", function()
				require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[d", function()
				require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
			end)

			-- Repeat movement with ; and ,
			local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufEnter",
		keys = {
			{ "<leader>uc", "<cmd>TSContext toggle<CR>", desc = " Toggle context" },
			{
				"[c",
				function()
					require("treesitter-context").go_to_context(vim.v.count1)
				end,
				silent = true,
			},
		},
	},

	{
		-- faster navigation by node
		"aaronik/treewalker.nvim",
		opts = {},
		keys = {
			{ "<C-up>", "<cmd>Treewalker Up<CR>", mode = { "n", "v", "o" }, silent = true, desc = "Go node up" },
			{ "<C-down>", "<cmd>Treewalker Down<CR>", mode = { "n", "v", "o" }, silent = true, desc = "Go node down" },
			{ "<C-left>", "<cmd>Treewalker Left<CR>", mode = { "n", "v", "o" }, silent = true, desc = "Go node left" },
			{
				"<C-right>",
				"<cmd>Treewalker Right<CR>",
				mode = { "n", "v", "o" },
				silent = true,
				desc = "Go node right",
			},
			{ "<C-S-up>", "<cmd>Treewalker SwapUp<CR>", silent = true, desc = "Go node up" },
			{ "<C-S-down>", "<cmd>Treewalker SwapDown<CR>", silent = true, desc = "Go node down" },
			{ "<C-S-left>", "<cmd>Treewalker SwapLeft<CR>", silent = true, desc = "Go node left" },
			{
				"<C-S-right>",
				"<cmd>Treewalker SwapRight<CR>",
				silent = true,
				desc = "Go node right",
			},
		},
	},

	{
		"Sang-it/fluoride",
		opts = {},
		keys = {
			{ "<leader>co", "<cmd>FluorideToggle<CR>", silent = true, desc = "󱁊 Show code outline" },
		},
	},
}
