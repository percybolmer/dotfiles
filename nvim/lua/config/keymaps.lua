-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap

-- save commands
map("n", "<C-s>", [[:w<CR>]], {})
map("i", "<C-s>", [[<ESC>:w<CR>]], {})

-- Harpoon to quick navigate between files
map("n", "<leader>m", [[:lua require'harpoon.mark'.add_file()<CR>]], {})
map("n", "<leader>mm", [[:lua require'harpoon.mark'.rm_file()<CR>]], {})
map("n", "<leader>s", [[:lua require'harpoon.ui'.toggle_quick_menu()<CR>]], {})
map("n", "1", [[:lua require'harpoon.ui'.nav_file(1)<CR>]], {})
map("n", "2", [[:lua require'harpoon.ui'.nav_file(2)<CR>]], {})
map("n", "3", [[:lua require'harpoon.ui'.nav_file(3)<CR>]], {})
map("n", "4", [[:lua require'harpoon.ui'.nav_file(4)<CR>]], {})
map("n", "5", [[:lua require'harpoon.ui'.nav_file(5)<CR>]], {})
map("n", "6", [[:lua require'harpoon.ui'.nav_file(6)<CR>]], {})

-- Floatterm
map("n", "t", ":FloatermToggle myfloat<CR>", {})
map("t", "<Esc>", "<C-\\><C-n>:q<CR>", {})
