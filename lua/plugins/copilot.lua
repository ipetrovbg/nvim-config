return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	event = { "BufReadPre" },
	opts = {
		panel = {
			enabled = true,
			auto_refresh = true,
			layout = {
				position = "bottom", -- | top | left | right
				ratio = 0.6,
			},
		},
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 50,
			keymap = {
				accept = "<S-Tab>",
				accept_word = false,
				accept_line = false,
				next = "<c-j>",
				prev = "<c-k>",
				dismiss = "<c-]>",
			},
		},
	},
}
