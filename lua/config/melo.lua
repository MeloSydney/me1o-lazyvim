-- 1.options
-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = true            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint

vim.opt.wrap = false          -- Wrapping sucks (except on markdown)
vim.opt.swapfile = false      -- Do not leave any backup files
vim.opt.showmatch  = true     -- Highlights the matching parenthesis
vim.opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text
vim.opt.hidden = true         -- Allow multple buffers
vim.opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.
vim.opt.encoding = "utf-8"    -- Just in case
vim.opt.cmdheight = 2           -- Shows better messages

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- Melo for gtags
vim.g.lazyvim_picker = "telescope"

-- 2.keymaps
-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local map = vim.api.nvim_set_keymap
map("n", "<Space>", "<Nop>", opts)

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- NvimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {})
vim.keymap.set('n', '<A-n>', ':NvimTreeFindFile<CR>', {})
vim.keymap.set('n', '-', ':NvimTreeCollapse<CR>', {})

-- buffer
vim.keymap.set('n', '<leader>bp', ':bp<CR>')
vim.keymap.set('n', '<leader>bn', ':bn<CR>')

-- vscode 专用设置
if vim.g.vscode then
    local fold = {
        unfoldAll = function()
            vim.fn.VSCodeNotify("editor.unfoldAll")
        end,
        foldAll = function()
            vim.fn.VSCodeNotify("editor.foldAll")
        end,
        fold = function()
            vim.fn.VSCodeNotify("editor.fold")
        end,
        unfold = function()
            vim.fn.VSCodeNotify("editor.unfold")
        end,
    }


    local tab = {
        closeCurrentTab = function()
            vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
        end,
        closeOtherTab = function()
            vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
        end,
        closeAllTab = function()
            vim.fn.VSCodeNotify("workbench.action.closeAllEditors")
        end,
    }

    local codeReader = {
        quickInfo = function()
            vim.fn.VSCodeNotify("editor.action.showHover")
        end,
    }

    local refactor = {
        rename = function()
            vim.fn.VSCodeNotify("editor.action.rename")
        end,
    }

    local navigator = {
        forward = function()
            vim.fn.VSCodeNotify("workbench.action.navigateForward")
        end,
        backward = function()
            vim.fn.VSCodeNotify("workbench.action.navigateBack")
        end,
    }


    -- 折叠代码
    vim.keymap.set('n', 'zR', fold.unfoldAll)
    vim.keymap.set('n', 'zM', fold.foldAll)
    vim.keymap.set('n', 'zo', fold.unfold)
    vim.keymap.set('n', 'zc', fold.fold)


    -- 窗口
    vim.keymap.set('n', '<leader>wc', tab.closeCurrentTab)
    vim.keymap.set('n', '<leader>wo', tab.closeOtherTab)
    vim.keymap.set('n', '<leader>wa', tab.closeAllTab)

    -- Refactor
    vim.keymap.set('n', '<leader>r', refactor.rename)

    -- Navigator
    vim.keymap.set('n', 'gf', navigator.forward)
    vim.keymap.set('n', 'gb', navigator.backward)
else
     -- ordinary Neovim
end

