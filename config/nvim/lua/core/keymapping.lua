local map = require("utils").map

vim.g.mapleader = " "

--------------------------------
-- SPLITS AND BASICS MAPPINGS --
--------------------------------
-- Split windows
map("n", "ss", "<Cmd>split<Return><C-w>w")
map("n", "sv", "<Cmd>vsplit<Return><C-w>w")

-- Move on splits
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")

-- Resize splits
map("n", "<C-w>j", "<C-w>-")
map("n", "<C-w>k", "<C-w>+")
map("n", "<C-w>h", "<C-w>>")
map("n", "<C-w>l", "<C-w><")

-- Fast save and quit
map("n", "<Leader>w", "<Cmd>:w<CR>")
map("n", "<Leader>q", "<Cmd>:q<CR>")

--- MOVE TEXT AROUND  --
------------------------
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<leader>k", ":m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")

----------------------------------------------
-- FIND FILES, LINES, TEXT USING TELESCOPE  --
----------------------------------------------
-- Fuzzi by filenames
-- map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
-- Fuzzi on content
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
-- Fuzzi open buffers
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")
-- Grep on current buffer
map("n", "<Leader>fl", "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<cr>")

----------------------------------------------
-- LSP RELATED - FIX ACTIONS AND DIAGNOSTIC --
----------------------------------------------
-- Go to definition
map("n", "<Leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- Go to type definition
map("n", "<Leader>vt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
-- Open lsp_references fuzzi finder
map("n", "<Leader>vrr", "<cmd>Telescope lsp_references<CR>")
-- Rename function/object/etc
map("n", "<Leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
-- Show pop up with information
map("n", "<Leader>vh", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- Show popup to fix
map("n", "<Leader>vf", "<cmd>CodeActionMenu<CR>")
-- Go to the next/prev error found
map("n", "<Leader>vj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
map("n", "<Leader>vk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
