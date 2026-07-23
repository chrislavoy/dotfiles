local theme = "catppuccin"
-- local theme = "catppuccin"
local transparent = false

if theme == "tokyonight" then
	local opts = {}

	if transparent then
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		}
	end

	return {
		"folke/tokyonight.nvim",
		opts = opts,
	}
elseif theme == "catppuccin" then
	local opts = {}

	if transparent then
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		}
	end

	return {
		"catppuccin/nvim",
		opts = opts,
	}
else
	return
end
