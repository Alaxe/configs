require "paq" {
    "savq/paq-nvim",
    'tpope/vim-sensible',
    'kyazdani42/nvim-web-devicons', -- icons in statusline
    'nvim-lualine/lualine.nvim',
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
