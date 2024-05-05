local wk = require('which-key')

local telescope = require('telescope.builtin')
local trouble = require("trouble")
local treesj = require('treesj');
local minidiff = require('mini.diff')

wk.register({
    e = { require('mini.files').open, "File Explorer" },
    f = { -- Telescope
        name = 'Telescope',
        f = { telescope.find_files, "Find File" },
        r = { telescope.oldfiles, "Recent Files" },
        g = { telescope.live_grep, "Live Grep" },
        b = { telescope.buffers, "Buffers" },
        h = { telescope.help_tags, "Help Tags" },
        c = { telescope.commands, "Commands" },
        q = { telescope.quickfix, "Quickfix" },
        t = { telescope.treesitter, "Treesitter" },
        p = { telescope.colorscheme, "Colorscheme" },
    },
    g = {
        name = "MiniDiff",
        d = { minidiff.toggle_overlay, "Toggle Overlay" },
    },
    n = { function() vim.cmd("noh") end, "No highlight" },
    s = {
        name = "TreeSJ",
        t = { treesj.toggle, "Toggle" },
        s = { treesj.split, "Split" },
        j = { treesj.join, "Join" },
        r = { function() treesj.toggle({ split = { recursive = true } }) end, "Toggle Recursively" }
    },
    t = {
        name = "Todo",
        t = { vim.cmd.TodoTrouble, "Todo Trouble" },
        f = { vim.cmd.TodoTelescope, "Todo Telescope" },
    },
    x = {
        name = "Trouble",
        x = { function() trouble.toggle() end, "Toggle" },
        w = { function() trouble.toggle("workspace_diagnostics") end, "Workspace Diagnostics" },
        d = { function() trouble.toggle("document_diagnostics") end, "Document Diagnostics" },
        q = { function() trouble.toggle("quickfix") end, "Quickfix" },
        l = { function() trouble.toggle("loclist") end, "Loclist" },
        r = { function() trouble.toggle("lsp_references") end, "LSP References" },
    },
}, { prefix = "<Leader>" })

-- Miscellaneous
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<C-q>', ':bdelete<CR>')
vim.keymap.set('n', '<C-n>', ':bnext<CR>')
vim.keymap.set('n', '<C-p>', ':bprev<CR>')
vim.keymap.set('n', '<C-c>', ':buffer')
vim.keymap.set('n', '<C-v>', ':vsplit<CR>')
vim.keymap.set('n', '<C-h>', ':hsplit<CR>')
