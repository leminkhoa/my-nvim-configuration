return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify", -- Optional for notifications
	},
	config = function()
		require("noice").setup({
			lsp = {
				-- Override markdown rendering to use Treesitter
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- Requires hrsh7th/nvim-cmp
				},
			},
			-- Enable presets for easier configuration
			presets = {
				bottom_search = true, -- Use classic bottom cmdline for search
				command_palette = true, -- Position cmdline and popupmenu together
				long_message_to_split = true, -- Send long messages to a split
				inc_rename = false, -- Enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- Add a border to hover docs and signature help
			},
			cmdline = {
				view = "cmdline_popup", -- Enables a centered cmdline
			},
			views = {
				cmdline_popup = {
					position = {
						row = "50%", -- Center vertically
						col = "50%", -- Center horizontally
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
			},
		})
	end,
}
