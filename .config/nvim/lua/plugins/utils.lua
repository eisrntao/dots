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
}
