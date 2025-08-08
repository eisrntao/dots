return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		icons = { mappings = false },
		spec = {
			{ "<leader>f", group = " Search" },
			{ "<leader>u", group = " UI" },
			{ "<leader>c", group = " Code" },
			{ "<leader>b", group = " Buffer" },
		},
	},
}
