-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', '<F1>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('v', '<F1>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<F1>', '<Esc>', { noremap = true, silent = true })

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-y>', '<C-d>zz', opts)
vim.keymap.set('v', '<C-y>', '<C-d>', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Pindahkan baris ke atas atau ke bawah di mode Normal
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true }) -- Alt + Down
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true }) -- Alt + Up

-- Pindahkan blok ke atas atau ke bawah di mode Visual
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- Alt + Down
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- Alt + Up

-- Disabled Buttons
-- Disable Ctrl + z
vim.keymap.set('n', '<C-z>', '<Nop>', opts)
vim.keymap.set('v', '<C-z>', '<Nop>', opts)

-- Disable Ctrl + d
vim.keymap.set('n', '<C-d>', '<Nop>', opts)

-- Disable Ctrl + p & Ctrl + n
vim.keymap.set('n', '<C-p>', '<Nop>', opts)
vim.keymap.set('n', '<C-n>', '<Nop>', opts)
vim.keymap.set('n', '<C-a>', '<Nop>', opts)

-- keymaps for folding
vim.keymap.set('n', '<leader>z', 'za', opts)

-- Shortcut untuk mengganti teks yang diseleksi
-- vim.keymap.set('v', '<leader>sr', function()
--   local pattern = vim.fn.getreg '"'                         -- Ambil teks yang diseleksi
--   local replacement = vim.fn.input 'Ganti dengan: '         -- Prompt untuk pengganti
--   vim.cmd(':%s/' .. pattern .. '/' .. replacement .. '/gc') -- Perintah substitusi
-- end, { noremap = true, silent = true, desc = 'Substitusi teks yang diseleksi' })
