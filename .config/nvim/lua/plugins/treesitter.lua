return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Install languages:
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

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = false,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "vs",
						node_incremental = "<space>",
						scope_incremental = false,
						node_decremental = "<backspace>",
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
							["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
							["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
							["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

							["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
							["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

							["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
							["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

							["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

							["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
							["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

							["am"] = {
								query = "@function.outer",
								desc = "Select outer part of a method/function definition",
							},
							["im"] = {
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
		-- show context
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufEnter",
		opts = {},
		keys = {
			{ "<leader>uc", "<cmd>TSContext toggle<CR>", desc = " Toggle context" },
			{
				"[c",
				function()
					require("treesitter-context").go_to_context(vim.v.count1)
				end,
				{ silent = true },
			},
		},
	},
}
