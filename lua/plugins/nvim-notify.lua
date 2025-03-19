return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#000000", -- Set background color explicitly
			priority = 10, -- Ensure a valid Lua number for priority
			timeout = 3000, -- Set notification timeout (3 sec)
			render = "default",
			stages = "fade_in_slide_out",
			max_width = 80,
			max_height = 20,
			fps = 30,
		})
		vim.notify = require("notify") -- Set `vim.notify` to use `nvim-notify`
	end,
}
