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

