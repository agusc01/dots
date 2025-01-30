local tt = { noremap = true, silent = true }
-- local ff = { noremap = false, silent = false }
local tf = { noremap = true, silent = false }
-- local ft = { noremap = false, silent = true }
local map = vim.keymap.set

-- Do things without affecting the registers
map("n", "x", '"_x')
map("n", "<Leader>p", '"0p')
map("n", "<Leader>P", '"0P')
map("v", "<Leader>p", '"0p')
map("n", "<Leader>c", '"_c')
map("n", "<Leader>C", '"_C')
map("v", "<Leader>c", '"_c')
map("v", "<Leader>C", '"_C')
map("n", "<Leader>d", '"_d')
map("n", "<Leader>D", '"_D')
map("v", "<Leader>d", '"_d')
map("v", "<Leader>D", '"_D')

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
map("n", "<Leader>o", "o<Esc>^Da", tt)
map("n", "<Leader>O", "O<Esc>^Da", tt)

-- Jumplist
map("n", "<C-m>", "<C-i>", tt)

-- New tab
map("n", "te", ":tabedit")
-- map("n", "<Tab>", ":tabnext<Return>", tt)
-- map("n", "<S-Tab>", ":tabprev<Return>", tt)
-- Split window
map("n", "ss", ":split<Return>", tt)
map("n", "sv", ":vsplit<Return>", tt)
-- Move window
map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")

-- Resize window
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
map("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, tt)

map("n", "<Leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

map("n", "<Leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

map("i", "nn", "<Esc>", tt)

-- Show comands
map("n", "<C-p>", ":", tf)
map("n", "<Leader>p", ":", tf)
map("v", "<C-p>", ":", tf)
map("v", "<Leader>p", ":", tf)
map("i", "<C-p>", "<Esc>:", tf)

-- Duplicate lines
map("n", "<C-d>", "yyp", tt)
map("n", "<Leader>d", "yyp", tt)
map("v", "<C-d>", "y<Esc>p", tt)
map("v", "<Leader>d", "y<Esc>p", tt)
map("i", "<C-d>", "<Esc>yyp", tt)

-- Incremenet tabs
map("v", "<Tab>", ">gv", tt)
map("n", "<Tab>", ">>_", tt)
-- Decerement tabs
map("v", "<S-Tab>", "<gv", tt)
map("n", "<S-Tab>", "<<_", tt)
