return {
	-- ToggleTerm Setup
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]], -- Shortcut to open terminal
				direction = "float", -- Floating terminal mode
				shade_terminals = true, -- Apply shading
				start_in_insert = true, -- Start in insert mode
				close_on_exit = true, -- Auto-close on exit
				float_opts = { border = "curved" }, -- Curved border style
			})

			-- Keymap to toggle terminal easily
			vim.keymap.set(
				"n",
				"<leader>tt",
				"<cmd>ToggleTerm direction=horizontal<CR>",
				{ noremap = true, silent = true }
			)

			-- Function to set terminal keymaps
			function _G.set_terminal_keymaps()
				local opts = { noremap = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts) -- Exit terminal mode
				vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts) -- Alternative exit
				vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts) -- Move left
				vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts) -- Move down
				vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts) -- Move up
				vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts) -- Move right
			end

			-- Apply terminal keymaps when opening a terminal
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

			-- Setup Floating Terminals
			local Terminal = require("toggleterm.terminal").Terminal

			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
			function _LAZYGIT_TOGGLE()
				lazygit:toggle()
			end
			vim.keymap.set("n", "<leader>lg", _LAZYGIT_TOGGLE, { noremap = true, silent = true })

			local python = Terminal:new({ cmd = "python", hidden = true })
			function _PYTHON_TOGGLE()
				python:toggle()
			end
			vim.keymap.set("n", "<leader>py", _PYTHON_TOGGLE, { noremap = true, silent = true })

			local htop = Terminal:new({ cmd = "htop", hidden = true })
			function _HTOP_TOGGLE()
				htop:toggle()
			end
			vim.keymap.set("n", "<leader>ht", _HTOP_TOGGLE, { noremap = true, silent = true })

			local node = Terminal:new({ cmd = "node", hidden = true })
			function _NODE_TOGGLE()
				node:toggle()
			end
			vim.keymap.set("n", "<leader>nd", _NODE_TOGGLE, { noremap = true, silent = true })
		end,
	},
}
