local map = vim.keymap.set

map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- map("n", "<Leader>o", "o<Esc>^Da", { desc = "Disable continuations" })
-- map("n", "<Leader>O", "O<Esc>^Da", { desc = "Disable continuations" })
--
map("n", "te", ":tabedit", { desc = "New tab" })
map("n", "<C-Tab>", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<C-S-Tab>", ":tabprev<CR>", { desc = "Previous tab" })
map("n", "wh", ":split<Return>", { desc = "New Horizontal Window" })
map("n", "wv", ":vsplit<Return>", { desc = "New Vertical Window" })

map("n", "<C-h>", "<C-w>h", { desc = "Move window to the left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move window to the down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move window to the up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move window to the right" })

map("n", "<S-h>", "<C-w><", { desc = "Resize window h-" })
map("n", "<S-l>", "<C-w>>", { desc = "Resize window h+" })
map("n", "<S-k>", "<C-w>+", { desc = "Resize window v-" })
map("n", "<S-j>", "<C-w>-", { desc = "Resize window v+" })

-- Diagnostics
-- map("n", "<C-j>", function()
-- 	vim.diagnostic.goto_next()
-- end, tt)

map("n", "<Leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)
map("n", "<Leader>p", function()
	require("craftzdog.lsp").toggleInlayHints()
end, { desc = "Toggle Inlay Hints" })

map({ "v", "i" }, "nn", "<Esc>", { desc = "Escape from visual or insert node" })

local function telescope(modes, func, desc, key)
	map(modes, key, function()
		require("telescope.builtin")[func]({
			cwd = vim.fn.getcwd(),
			layout_config = { prompt_position = "top" },
			sorting_strategy = "ascending",
			smart_case = true,
			attach_mappings = function(_, map)
				local actions = require("telescope.actions")
				map("i", "<C-j>", actions.move_selection_next)
				map("i", "<C-k>", actions.move_selection_previous)
				return true
			end,
		})
	end, { desc = desc })
end

telescope("n", "command_history", "Command History", "<C-p>")
telescope("n", "search_history", "Search History", "<C-o>")
telescope("n", "live_grep", "Find words (grep)", "<C-f>")
telescope("n", "find_files", "Find files (fgrep)", "<C-r>")
telescope("n", "oldfiles", "Find oldfiles (fgrep)", "<C-t>")
telescope("n", "grep_string", "Find current word (fgrep)", "<C-g>")
telescope("n", "registers", "History registers", "<C-m>")

map({ "n", "v" }, "<Leader>t", function()
	vim.cmd("split | resize 10 | terminal")
end, { desc = "Open terminal (split)" })

map({ "n", "v" }, "<Leader>T", function()
	vim.cmd("vsplit | resize 10 | terminal")
end, { desc = "Open terminal (vsplit)" })

map("n", "<Leader>d", "yyp", { desc = "Duplicate line" })
map("v", "<Leader>d", "y<Esc>p", { desc = "Duplicate line" })

map("v", "<Tab>", ">gv", { desc = "Increment tabulation" })
map("n", "<Tab>", ">>_", { desc = "Increment tabulation" })
map("v", "<S-Tab>", "<gv", { desc = "Decrement tabulation" })
map("n", "<S-Tab>", "<<_", { desc = "Decrement tabulation" })

map("v", "$", "$h", { desc = "Back to a character" })

map("v", "<Leader>ñ", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle Comment Line" })
map("n", "<Leader>ñ", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle Comment Line" })
map("v", "<Leader>{", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Toggle Comment Block" })
map("n", "<Leader>{", "<Plug>(comment_toggle_blockwise_current)", { desc = "Toggle Comment Block" })

map("n", "<leader>j", "0v$", { desc = "Select line and go down (0v$)" })
map("n", "<leader>J", "v$", { desc = "Select from cursor position and go down (v$)" })
map("n", "<leader>k", "$v0", { desc = "Select line and go up ($v0)" })
map("n", "<leader>K", "v0", { desc = "Select from cursor position and go up (v0)" })

map({ "n", "v" }, "<Leader>m", "%", { desc = "Jumping (%)" })

map("n", "<C-w>", ":confirm wq<CR>", { desc = "Save file" })
map({ "v", "i" }, "<C-w>", "<Esc>:confirm wq<CR>", { desc = "Save file" })
