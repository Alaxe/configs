-- Plugins
require "paq" {
    "savq/paq-nvim",
    'tpope/vim-sensible',
    'kyazdani42/nvim-web-devicons', -- icons in statusline
    'nvim-lualine/lualine.nvim',
    {'neoclide/coc.nvim', branch = 'release'},
    -- 'whonore/Coqtail',
}

vim.g.coc_global_extensions = {
    'coc-json',
    'coc-jedi',
    'coc-clangd',
    'coc-rust-analyzer'
}

-- General options

vim.o.fileencoding = 'utf-8'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.number = true
vim.o.signcolumn = "number"
vim.o.showmatch = true

vim.o.textwidth = 80
vim.o.linebreak = true

vim.o.foldmethod = 'syntax'
vim.o.foldlevelstart = 20

vim.opt.termguicolors = false
vim.opt.background = 'dark'
vim.cmd('colorscheme vim')

vim.opt_local.list = true
vim.opt_local.listchars = {tab = '> ', trail='_'}
vim.opt.clipboard = "unnamedplus"

-- Netrw and tabs

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

vim.keymap.set("", "<C-E>", ":Explore <CR>")
vim.keymap.set("", "<C-T>", ":tabnew <CR>")
vim.keymap.set("", "<C-C>", ":q <CR>")

vim.keymap.set("", "<F5>", "!xclip -selection clipboard < % <CR>")

for _, c in pairs({"j", "k", "$", "^"}) do
    vim.keymap.set("", c, "g" .. c)
    vim.keymap.set("", "g" .. c, c)
end


-- Cyrilic mappings
require("cyrilic")


-- Filetypes

vim.filetype.add({
    pattern = {
        [".*.bsv"] = "bsv", -- bluespec
        [".*.ms"] = "bsv", -- minispec
        [".*.g4"] = "antlr4", -- antrl
        [".*.tex"] = "tex", -- disable plaintex
        [".*.sy"] = "syncopy",
        ["SConscript"] = "python"
    }
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"make", "go"},
    callback = function()
        vim.o.expandtab = false
        vim.opt_local.listchars:prepend {tab='  '}
    end
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"html", "htmldjango", "markdown", "bib"},
    callback = function()
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"bsv", "syncopy"},
    callback = function() vim.o.textwidth = 100; end
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"bib", "tex", "markdown"},
    callback = function() vim.o.textwidth = 0; end
})


vim.b.verilog_indent_modules = 1

-- Building

local function buildCurrent()
    cmd_table = {
        cpp = "g++ % -o %:r --std=c++20" ..
            " -fsanitize=undefined -fsanitize=address" ..
            " -Wall -Wextra -Wpedantic" ..
            " && ./%:r",
        rust = "rustc % && ./%:r",
        go = "go run %",
        java = "javac % && java %:r",
        javascript = "node %",
        python = "python %",
        sh = "bash %",
        tex = "pdflatex -interaction=nonstopmode -halt-on-error %",
    }


    local makefile = io.open("Makefile", "r")
    local cmd = cmd_table[vim.bo.filetype]

    if makefile then
        vim.api.nvim_command("wall")
        vim.api.nvim_command("!make")
        io.close(makefile)
    elseif cmd then
        vim.api.nvim_command("w")
        vim.api.nvim_command("te " .. cmd)
        vim.api.nvim_command("startinsert")
    else
        print("Can't build filetype " .. vim.bo.filetype)
    end
end
vim.keymap.set("", "<F9>", buildCurrent)

-- TODO autocmd Filetype go         map <F6> <ESC>:w <bar> !gofmt -w % <CR>

-- Plugin configuration

require 'line-conf'

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"text", "markdown", "tex", 'gitcommit'},
    callback = function() vim.b.coc_suggest_disable = true; end
})


require "coc-conf"

if vim.env.EXTRA_VIM then
    for p in string.gmatch(vim.env.EXTRA_VIM, "[^:]+") do
        dofile(p)
    end
end
