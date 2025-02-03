local map = vim.keymap.set
local del = vim.keymap.del

local function telescope_function(func, desc)
	local cwd = vim.fn.getcwd()
	require("telescope.builtin")[func]({
		cwd = cwd,
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "top" },
		prompt_title = desc ~= "" and desc or nil, -- Set only if desc is not empty
		sorting_strategy = "ascending",
		smart_case = true,
		attach_mappings = function(_, map)
			local actions_telescope = require("telescope.actions")
			local actions_fzf = require("fzf-lua.actions")

			-- Teclas para mover la selección
			map("i", "<C-j>", actions_telescope.move_selection_next)
			map("i", "<C-k>", actions_telescope.move_selection_previous)

			-- Usar las acciones de fzf-lua
			-- map("i", "<A-i>", actions_fzf.toggle_ignore) -- alt-i
			-- map("i", "<A-h>", actions_fzf.toggle_hidden) -- alt-h

			return true
		end,
	})
end

local function telescope_map(modes, func, desc, key)
	local excluded_funcs = {
		grep_string = true,
	}
	local new_desc = excluded_funcs[func] and "" or desc
	map(modes, key, function()
		telescope_function(func, new_desc)
	end, { desc = desc })
end

telescope_map({ "n", "v", "i" }, "command_history", "Command History", "<C-g>")
telescope_map({ "n", "v", "i" }, "live_grep", "Search word", "<C-f>")

telescope_map({ "n", "v", "i" }, "search_history", "Search History", "<C-m>")

telescope_map({ "n", "v", "i" }, "find_files", "Find files", "<C-p>")
telescope_map({ "n", "v", "i" }, "oldfiles", "Find recent files", "<C-o>")
telescope_map({ "n", "v", "i" }, "grep_string", "Find current word", "<C-t>")

map("n", "=", function()
	local word = vim.fn.expand("<cword>")
	require("telescope.builtin").grep_string({
		search = word,
		cwd = vim.fn.getcwd(),
		layout_config = { prompt_position = "top" },
		prompt_title = "Search in current file : " .. word,
		sorting_strategy = "ascending",
		smart_case = true,
		attach_mappings = function(_, map)
			local actions = require("telescope.actions")
			map("i", "<C-j>", actions.move_selection_next)
			map("i", "<C-k>", actions.move_selection_previous)
			return true
		end,
	})
end, { desc = "Search in current file " })

telescope_map({ "n", "v", "i" }, "registers", "History registers", "<C-r>")

map("n", "&", function()
	telescope_function("current_buffer_fuzzy_find", "Search in current file")
end, { desc = "Search in current file" })

map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

map({ "n", "v" }, "<Leader>t", function()
	vim.cmd("split | resize 10 | terminal")
end, { desc = "Open terminal (split)" })

map({ "n", "v" }, "<Leader>T", function()
	vim.cmd("vsplit | resize 10 | terminal")
end, { desc = "Open terminal (vsplit)" })

-- map("n", "<Leader>o", "o<Esc>^Da", { desc = "Disable continuations" })
-- map("n", "<Leader>O", "O<Esc>^Da", { desc = "Disable continuations" })

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

map("n", "<Leader>d", "yyp", { desc = "Duplicate line" })
map("v", "<Leader>d", "y<Esc>p", { desc = "Duplicate line" })

map("v", "<Tab>", ">gv", { desc = "Increment tabulation" })
map("n", "<Tab>", ">>_", { desc = "Increment tabulation" })
map("v", "<S-Tab>", "<gv", { desc = "Decrement tabulation" })
map("n", "<S-Tab>", "<<_", { desc = "Decrement tabulation" })

map("v", "$", "$h", { desc = "Back to a character" })
map("n", "*", "*N", { desc = "Back in the first search" })

map("v", "<Leader>ñ", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle Comment Line" })
map("n", "<Leader>ñ", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle Comment Line" })
map("v", "<Leader>{", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Toggle Comment Block" })
map("n", "<Leader>{", "<Plug>(comment_toggle_blockwise_current)", { desc = "Toggle Comment Block" })

map("n", "<leader>j", "0v$", { desc = "Select line and go down (0v$)" })
map("n", "<leader>J", "v$", { desc = "Select from cursor position and go down (v$)" })
map("n", "<leader>k", "$v0", { desc = "Select line and go up ($v0)" })
map("n", "<leader>K", "v0", { desc = "Select from cursor position and go up (v0)" })

map({ "n", "v" }, "<Leader>m", "%", { desc = "Jumping (%)" })

map("n", "<C-w>", ":q<Cr>", { desc = "Save file", silent = false })
map({ "v", "i" }, "<C-w>", "<Esc>:q<Cr>", { desc = "Save file", silent = false })

del("n", "<Cr>")
