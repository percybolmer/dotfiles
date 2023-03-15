-- fetch keymap
local map = vim.api.nvim_set_keymap

-- leave insert mode with jk
map('i', 'jk', '', {})
-- map the key n to run the command :NvimTreeToggle
map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})
-- update leader key to ,
vim.g.mapleader = ","
-- update save on keader+s
map('n', '<C-s>', [[:w<CR>]], {})
map('i', '<C-s>', [[<ESC>:w<CR>]], {})
-- Trouble tab bar key
map('n', '<Leader>t', [[:TroubleToggle<CR>]], {})
-- Tagbar Toggle to see code structure
map('n', '<Leader>o', [[:TagbarToggle<CR>]], {})
-- folding shortcuts
map('n', '<Leader>l', [[zc]], {})
map('n', '<Leader>k', [[zo]], {})
map('n', '<Leader>ö', [[zR]], {})
-- Open git terminal
map('n', '<Leader>g', [[:FloatermNew lazygit<CR>]], {})
-- nvim-dap keymappings
-- Press f5 to debug
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- Press CTRL + b to toggle regular breakpoint
map('n', '<A-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press CTRL + c to toggle Breakpoint with Condition
map('n', '<A-c>', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], {})
-- Press CTRL + l to toggle Logpoint
map('n', '<A-l>', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]], {})
-- Pressing F10 to step over
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {})
-- Pressing F11 to step into
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
-- Pressing F12 to step out
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
-- Press F6 to open REPL
map('n', '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})
-- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
map('n', 'dl', [[:lua require'dap'.run_last()<CR>]], {})
-- Press d to toggle debug mode, will remove NvimTree also
map('n', '<A-d>', [[:lua require'dapui'.toggle()<CR>]], {})
-- Floatterm Settings
map('n', "<leader>fnt", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ", {})
map('n', "<leader>t", ":FloatermToggle myfloat<CR>",{})
map('t', "<Esc>", "<C-\\><C-n>:q<CR>",{})


-- Show ToDOS
map('n', "<leader>ft", ":TodoTelescope<CR>", {})

-- Move up and down
map('n', '<A-k>', ":m .-2<CR>", {})
map('n', '<A-j>', ":m .+1<CR>", {})
map('v', '<A-k>', ":m '<-2<CR>gv=gv", {})
map('v', '<A-j>', ":m '>+1<CR>gv=gv", {})
map('i', '<A-k>', "<Esc> :m .-2<CR>==gi", {})
map('i', '<A-j>', "<Esc> :m .+1<CR>==gi", {})
-- DB related and DBUI
map('n', '<leader>db', "[[:DBUI<CR>:vertical resize 80<CR>]]", {})
map('n', '<leader>dn', "[[:FloatermNew --name=db :DBUI<CR>]]", {})


-- Harpoon to quick navigate between files
map('n', '<leader>m', [[:lua require'harpoon.mark'.add_file()<CR>]], {})
map('n', '<leader>mm', [[:lua require'harpoon.mark'.rm_file()<CR>]], {})
map('n', '<leader>s', [[:lua require'harpoon.ui'.toggle_quick_menu()<CR>]], {})
map('n', '1', [[:lua require'harpoon.ui'.nav_file(1)<CR>]], {})
map('n', '2', [[:lua require'harpoon.ui'.nav_file(2)<CR>]], {})
map('n', '3', [[:lua require'harpoon.ui'.nav_file(3)<CR>]], {})
map('n', '4', [[:lua require'harpoon.ui'.nav_file(4)<CR>]], {})
map('n', '5', [[:lua require'harpoon.ui'.nav_file(5)<CR>]], {})
map('n', '6', [[:lua require'harpoon.ui'.nav_file(6)<CR>]], {})
