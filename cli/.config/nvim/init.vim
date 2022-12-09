call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}

call plug#end()


set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" set smartindent
set expandtab

set tabstop=4
set shiftwidth=4

set foldmethod=syntax
set foldlevelstart=20
set textwidth=80

" set t_Co=256
" set comments=sl:/*,mb:\ *,elx:\ */

set number
set showmatch

set nojoinspaces


let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_sort_sequence = "[\/]$,*,\.o$,\.swp$,\.bak$,\~$"

" let g:vimtex_fold_enabled=1
" let g:vimtex_indent_enabled=0
" let g:vimtex_imaps_leader="🤠"
" let g:tex_flavor="latex"

" let g:airline#extensions#tabline#enabled = 1

" highlight ExtraWhitespace ctermfg=white ctermbg=green
" match ExtraWhitespace /\s\+$/
" hi MatchParen ctermfg=white ctermbg=green

" set list
" set listchars=tab:▸\

source ~/.vim/cyrilic.vim

" let g:indentLine_setConceal=0
" set conceallevel=0
"
autocmd BufNewFile,BufRead */janncy/**.\(cc\|h\) setlocal ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead *.bsv set ft=bsv
autocmd BufNewFile,BufRead *.ms  set ft=bsv
autocmd BufNewFile,BufRead *.tex set ft=tex
autocmd BufNewFile,BufRead *.hbs set ft=html
autocmd BufNewFile,BufRead *.m   set ft=html


"Use tabs
autocmd Filetype make       setlocal noexpandtab nolist
autocmd Filetype go         setlocal noexpandtab nolist


"Use 2-space indent in html and makrdown
autocmd Filetype html       setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown   setlocal ts=2 sts=2 sw=2
autocmd FileType markdown   let b:coc_suggest_disable=1
autocmd FileType text   let b:coc_suggest_disable=1
"
"Minispec
autocmd FileType bsv set textwidth=100
let b:verilog_indent_modules = 1


" autocmd Filetype tex        setlocal nosmartindent indentexpr=
" autocmd Filetype markdown   setlocal nofoldenable
" autocmd Filetype markdown   setlocal nosmartindent

map <C-N> :Explore <CR>
map <C-T> :tabnew <CR>
map <C-C> :q <CR>

map <F2> <ESC>:w<CR>
map <F5> <ESC>:w <bar> !xclip -selection clipboard < % <CR>
map <F10> <ESC> :wa <bar> !make <CR>

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

"Compile a basic program
autocmd Filetype cpp        map <F9> <ESC>:w <bar>
    \ !g++ % -o %:r -std=c++14 -fsanitize=undefined -fsanitize=address -DLOCAL
    \ -Wall -Wextra -Wpedantic && ./%:r <CR>
autocmd Filetype go         map <F9> <ESC>:w <bar> !go run % <CR>
autocmd Filetype java       map <F9> <ESC>:w <bar> !javac % && java %:r <CR>
autocmd Filetype javascript map <F9> <ESC>:w <bar> !node % <CR>
autocmd Filetype python     map <F9> <ESC>:w <bar> !python % <CR>
autocmd Filetype r          map <F9> <ESC>:w <bar> !Rscript % <CR>
autocmd Filetype sh         map <F9> <ESC>:w <bar> !bash % <CR>
autocmd Filetype tex        map <F9> <ESC>:w <bar>
    \ !xelatex -interaction=nonstopmode -halt-on-error % <CR>

autocmd Filetype go         map <F6> <ESC>:w <bar> !gofmt -w % <CR>


" Unnecessary in neovim
" set autoindent
" set background=dark
" set smarttab
" set hlsearch




" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

lua << END
local function getWords()
  if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" or vim.bo.filetype == "tex" then
    if not (vim.fn.wordcount().visual_words == nil) then
      return tostring(vim.fn.wordcount().visual_words) .. " words"
    else
      return tostring(vim.fn.wordcount().words) .. " words"
    end
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
        lualine_y = {{getWords}, 'progress'},
        lualine_z = {'location'}
    },
}
END
