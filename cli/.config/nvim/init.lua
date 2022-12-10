--[[
Plug('tpope/vim-sensible')
Plug('kyazdani42/nvim-web-devicons')
Plug('nvim-lualine/lualine.nvim')
Plug('neoclide/coc.nvim', {branch = 'release'})
--]]
require "paq" {
    'tpope/vim-sensible',
    'kyazdani42/nvim-web-devicons', -- icons in statusline
    'nvim-lualine/lualine.nvim',
}

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.keymap.set("", "<C-N>", ":Explore <CR>")
vim.keymap.set("", "<C-T>", ":tabnew <CR>")
vim.keymap.set("", "<C-C>", ":q <CR>")


vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
--let g:netrw_sort_sequence = "[\/]$,*,\.o$,\.swp$,\.bak$,\~$"

require("cyrilic")


pcall(function()
    local function getWords()
        if vim.bo.filetype == "text" or vim.bo.filetype == "markdown" or vim.bo.filetype == "tex" then
            local wc_d = vim.fn.wordcount()
            local wc = wc_d.visual_words or wc_d.words
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
