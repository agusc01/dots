local map = vim.keymap.set

map({ "n", "v" }, "<C-p>", "<cmd>FzfLua command_history<cr>", { desc = "Command History" })

map({ "n", "v" }, '"', "<cmd>FzfLua registers<cr>", { desc = "Registers" })

map({ "n" }, "<leader>/", function()
	vim.cmd("normal! yiw")
	local cwd = vim.fn.getcwd()
	local word = vim.fn.expand("<cword>")
	package.loaded["telescope.builtin"] = nil
	require("telescope.builtin").live_grep({
		prompt_title = "Grep (" .. word .. ")",
		smart_case = true,
		search = word,
		default_text = word,
		cwd = cwd,
		rg_opts = "--sort-files",
		attach_mappings = function(_, map)
			local action = require("telescope.actions")
			map("i", "<C-j>", action.move_selection_next)
			map("i", "<C-k>", action.move_selection_previous)
			return true
		end,
	})
	-- vim.cmd('lua LazyVim.pick("live_grep")()')
end, { desc = "Grep (Root dir) current word" })

map({ "n", "v", "i" }, "<leader>sB", function()
	local word = vim.fn.expand("<cword>")
	package.loaded["telescope.builtin"] = nil
	require("telescope.builtin").current_buffer_fuzzy_find({
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "top" },
		prompt_title = "Buffer Grep (" .. word .. ")",
		sorting_strategy = "ascending",
		smart_case = true,
		default_text = word,
		attach_mappings = function(_, map)
			local action = require("telescope.actions")
			map("i", "<C-j>", action.move_selection_next)
			map("i", "<C-k>", action.move_selection_previous)
			return true
		end,
	})
end, { desc = "Buffer Grep Current Word" })

map("n", "<leader>7", 'yiwb/<C-R>"', { desc = "Find current word PRE search" })
map("n", "<leader>8", 'yiwb/<C-R>"<CR>', { desc = "Find current word POST search" })
map("v", "<leader>7", 'yb/<C-R>"', { desc = "Find current word PRE search" })
map("v", "<leader>8", 'yb/<C-R>"<CR>', { desc = "Find current word POST search" })

map({ "n", "v" }, "<M-r>", vim.lsp.buf.rename, { desc = "Rename" })

map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<C-S-Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<leader>d", "yyp", { desc = "Duplicate line" })
map("v", "<leader>d", "y<Esc>p", { desc = "Duplicate line" })

map("v", "<Tab>", ">gv", { desc = "Increment tabulation" })
map("n", "<Tab>", ">>_", { desc = "Increment tabulation" })
map("v", "<S-Tab>", "<gv", { desc = "Decrement tabulation" })
map("n", "<S-Tab>", "<<_", { desc = "Decrement tabulation" })

map("v", "$", "$h", { desc = "Back to a character" })
-- * Next current word
-- # Previous current word

map("v", "<leader>ñ", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle Comment Line" })
map("n", "<leader>ñ", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle Comment Line" })
map("v", "<leader>{", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Toggle Comment Block" })
map("n", "<leader>{", "<Plug>(comment_toggle_blockwise_current)", { desc = "Toggle Comment Block" })

map("n", "<leader>j", "0v$", { desc = "Select line and go down (0v$)" })
map("n", "<leader>J", "v$", { desc = "Select from cursor position and go down (v$)" })
map("n", "<leader>k", "$v0", { desc = "Select line and go up ($v0)" })
map("n", "<leader>K", "v0", { desc = "Select from cursor position and go up (v0)" })

-- % Jumping
map("n", "<C-w>", ":q<Cr>", { desc = "Save file", silent = false })
map({ "v", "i" }, "<C-w>", "<Esc>:q<Cr>", { desc = "Save file", silent = false })
