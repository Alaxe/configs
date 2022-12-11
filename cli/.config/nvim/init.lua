-- Plugins
require "paq" {
    "savq/paq-nvim",
    'tpope/vim-sensible',
    'kyazdani42/nvim-web-devicons', -- icons in statusline
    'nvim-lualine/lualine.nvim',
    {'neoclide/coc.nvim', branch = 'release'},
}

vim.g.coc_global_extensions = {
    'coc-json',
    'coc-pyright',
}

-- General options

vim.o.fileencoding = 'utf-8'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.number = true
vim.o.showmatch = true
vim.o.textwidth = 80

vim.o.foldmethod = 'syntax'
vim.o.foldlevelstart = 20

vim.opt.list = true
vim.opt.listchars = {tab = '> ', trail='_'}


-- Netrw and tabs

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

vim.keymap.set("", "<C-N>", ":Explore <CR>")
vim.keymap.set("", "<C-T>", ":tabnew <CR>")
vim.keymap.set("", "<C-C>", ":q <CR>")

vim.keymap.set("", "<F5>", "!xclip -selection clipboard < % <CR>")


-- Cyrilic mappings
require("cyrilic")


-- Filetypes

vim.filetype.add({
    pattern = {
        [".*.bsv"] = "bsv", -- bluespec
        [".*.ms"] = "bsv", -- minispec
        [".*.tex"] = "tex", -- disable plaintex
    }
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"make", "go"},
    callback = function()
    vim.go.expandtab = false
    vim.opt_local.listchars = {trail = "_"}
    end
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"html", "htmldjango", "markdown"},
    callback = function()
        vim.go.tabstop = 2
        vim.go.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"bsv"},
    callback = function() vim.go.textwidth = 100; end
})

--[[
autocmd FileType markdown   let b:coc_suggest_disable=1
autocmd FileType text   let b:coc_suggest_disable=1
--]]

vim.b.verilog_indent_modules = 1

-- Building

local function buildCurrent()
    cmd_table = {
        cpp = "g++ % -o %:r --std=c++14" ..
            " -fsanitize=undefined -fsanitize=address" ..
            " -Wall -Wextra -Wpedantic" ..
            " && ./%:r",
        go = "go run %",
        java = "javac % && java %:r",
        javascript = "node %",
        python = "python %",
        sh = "bash %",
        tex = "xelatex -interaction=nonstopmode -halt-on-error %",
    }


    local makefile = io.open("Makefile", "r")
    local cmd = cmd_table[vim.bo.filetype]

    if makefile then
        vim.api.nvim_command("wall")
        vim.api.nvim_command("!make")
        io.close(makefile)
    elseif cmd then
        vim.api.nvim_command("w")
        vim.api.nvim_command("!" .. cmd)
    else
        print("Can't build filetype " .. vim.bo.filetype)
    end
end
vim.keymap.set("", "<F9>", buildCurrent)

-- TODO autocmd Filetype go         map <F6> <ESC>:w <bar> !gofmt -w % <CR>

-- Status Line

pcall(function()
    local function getWords()
        local filetypes = {
            text = true,
            markdown = true,
            tex = true,
        }
        local wc_dict = vim.fn.wordcount()
        local wc = wc_dict.visual_words or wc_dict.words

        if filetypes[vim.bo.filetype] then
            return tostring(wc) .. " words"
        else
            return ""
        end
    end
    print(vim.bo.filetype)
    require('lualine').setup{
        options = {
            icons_enabled = true,
            theme = 'powerline',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'filetype'},
            lualine_y = {getWords, 'progress'},
            lualine_z = {'location'}
        },
    }
end)

---- Coc ----

vim.opt.signcolumn = "number"

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"text", "markdown", "tex"},
    callback = function() vim.bo.coc_suggest_disable = true; end
})


local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion.
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window.
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming.
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code.
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s).
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})


-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for applying codeAction to the current buffer.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)


-- Apply AutoFix to problem on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)


-- Run the Code Lens action on the current line.
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> for scroll float windows/popups.
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics.
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions.
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands.
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document.
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols.
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item.
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item.
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list.
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

