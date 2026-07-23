local theme = "gruvbox-material"
return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		opts = {
			-- flavor = "frappe",
			auto_integrations = true,
			no_italic = true,
			transparent_backaground = false,
			lsp_styles = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				fzf = true,
				grug_far = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				mini = true,
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				snacks = true,
				telescope = true,
				treesitter_context = true,
				which_key = true,
			},
		},
		specs = {
			{
				"akinsho/bufferline.nvim",
				optional = true,
				opts = function(_, opts)
					if (vim.g.colors_name or ""):find("catppuccin") then
						opts.highlights = require("catppuccin.special.bufferline").get_theme()
					end
				end,
			},
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = true,
		opts = {
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		},
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				filter = "ristretto",
			})
			--vim.cmd.colorscheme("monokai-pro")
		end,
	},
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = true,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- Optionally configure and load the colorscheme
	-- 		-- directly inside the plugin declaration.
	-- 		vim.g.gruvbox_material_enable_italic = false
	-- 		-- vim.cmd.colorscheme("gruvbox-material")
	-- 	end,
	-- },
	{
		"f4z3r/gruvbox-material.nvim",
		name = "gruvbox-material",
		lazy = false,
		priority = 1000,
		opts = {
			italics = false,
			contrast = "hard",
		},
	},
	{
		"sainnhe/everforest",
		lazy = true,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_background = "hard"
			vim.g.everforest_enable_italic = false
			-- vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"sainnhe/sonokai",
		lazy = true,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.sonokai_enable_italic = false
			-- vim.cmd.colorscheme("sonokai")
		end,
	},
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		-- optional but recommended
	-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- 	},
	-- },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = theme,
		},
	},
	-- {
	-- 	"LazyVim/LazyVim",
	-- 	opts = {
	-- 		-- colorscheme = "catppuccin-nvim",
	-- 		colorscheme = "gruvbox",
	-- 	},
	-- },
}
