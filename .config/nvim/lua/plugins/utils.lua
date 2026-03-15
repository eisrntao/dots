return {
	-- better repeat
	{ "tpope/vim-repeat", lazy = false },
	{
		-- better file browser
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>-", "<cmd>Oil<CR>", noremap = true, desc = "󰁴 Open Oil" },
		},
	},
	{
		-- file tree
		"ms-jpq/chadtree",
		cmd = "CHADopen",
		build = ":CHADdeps",
		keys = {
			{ "<leader>ut", "<cmd>CHADopen<CR>", desc = " Toggle file tree" },
		},
		config = function()
			local chadtree_settings = {
				view = { open_direction = "right" },
				theme = { icon_colour_set = "none" },
			}
			vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
		end,
	},
	{
		-- dim code
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{ "<leader>uz", "<cmd>Twilight<CR>", desc = "󰽥 Toggle zen mode" },
		},
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			disable_mouse = true,
			disabled_keys = {
				["<Up>"] = false,
				["<Down>"] = false,
				["<Left>"] = false,
				["<Right>"] = false,
			},
			restricted_keys = {
				["<Up>"] = { "n", "x" },
				["Down"] = { "n", "x" },
				["Left"] = { "n", "x" },
				["Right"] = { "n", "x" },
			},
			notification = false,
		},
	},
	{
		"andrewferrier/debugprint.nvim",

		opts = {
			display_counter = false,
			print_tag = "DEBUG",
			keymaps = {
				normal = {
					plain_below = "<leader>dp",
					plain_above = "<leader>dP",
					variable_below_alwaysprompt = "<leader>dv",
					variable_above_alwaysprompt = "<leader>dV",
					surround_variable_alwaysprompt = "<leader>ds",
					textobj_below = "<leader>do",
					textobj_above = "<leader>dO",
					toggle_comment_debug_prints = "<leader>dc",
					delete_debug_prints = "<leader>dd",
				},
			},
		},

		dependencies = {
			"ibhagwan/fzf-lua", -- Optional: If you want to use the `:Debugprint search` command with fzf-lua
		},

		lazy = false, -- Required to make line highlighting work before debugprint is first used
		version = "*", -- Remove if you DON'T want to use the stable version
	},
	{
		-- file jumps
		"niqodea/lasso.nvim",
		opts = {},
		keys = {
			{
				"<leader>mm",
				function()
					require("lasso").mark_file()
				end,
				desc = "󰓾 Mark file",
			},

			{
				"<leader>mt",
				function()
					require("lasso").open_marks_tracker()
				end,
				desc = " Open mark list",
			},

			{
				"<leader>1",
				function()
					require("lasso").open_marked_file(1)
				end,
				desc = "Go to mark 1",
			},
			{
				"<leader>2",
				function()
					require("lasso").open_marked_file(2)
				end,
				desc = "Go to mark 2",
			},
			{
				"<leader>3",
				function()
					require("lasso").open_marked_file(3)
				end,
				desc = "Go to mark 3",
			},
			{
				"<leader>4",
				function()
					require("lasso").open_marked_file(4)
				end,
				desc = "Go to mark 4",
			},
			{
				"<leader>5",
				function()
					require("lasso").open_marked_file(4)
				end,
				desc = "Go to mark 5",
			},
		},
	},
}
