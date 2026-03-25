return {
	{
		lazy = false,
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"python",
					"lua",
					"vimdoc",
					"markdown",
					"markdown_inline",
					"rust",
					"haskell",
					"bash",
					"html",
					"css",
					"javascript",
					"typst",
				},
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-S-v>",
						node_incremental = "<space>",
						scope_incremental = false,
						node_decremental = "<backspace>",
					},
				},
				textobjects = {
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
						},
						goto_prev_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
						},
					},
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
				},
			})
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
}
