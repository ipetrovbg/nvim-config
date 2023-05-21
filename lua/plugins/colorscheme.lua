-- Themes
-- onenord
-- gruvbox
-- oceanic_material
-- abstract
-- materialbox
-- alduin
-- challenger_deep
-- tokyonight-moon
-- OceanicNext
-- catppuccin
-- onedark
-- nightfox

vim.cmd("colorscheme gruvbox")

if vim.fn.has("termguicolors") == 1 then
	vim.o.termguicolors = true
end

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

function gruvbox_colors()
	vim.cmd("colorscheme gruvbox")

	if vim.fn.has("termguicolors") == 1 then
		vim.o.termguicolors = true
	end

	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end

vim.cmd("autocmd! ColorScheme gruvbox lua gruvbox_colors()")

-- require("catppuccin").setup({
-- 	flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 	term_colors = true,
-- 	dim_inactive = {
-- 	    enabled = false,
-- 	    shade = "dark",
-- 	    percentage = 0.15,
-- 	},
-- 	transparent_background = true,
-- })

-- require('onedark').setup  {
-- 	-- Main options --
-- 	style = 'dark',
-- }

-- require('nightfox').setup({
-- 	  options = {
-- 			transparent = true,     -- Disable setting background
-- 			terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
-- 			dim_inactive = false,   -- Non focused panes set to alternative background
-- 			module_default = true,  -- Default enable value for modules
-- 		}
-- })
