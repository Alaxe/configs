execute pathogen#infect()
" Pluigins:
"  - Pathogen(loader)  https://github.com/tpope/vim-pathogen
"  - SimplyFold:       https://github.com/tmhedberg/SimpylFold
"  - vim-sensible      https://github.com/tpope/vim-sensible
"  - vim-javascript    https://github.com/pangloss/vim-javascript
"  - vim-markdown      https://github.com/plasticboy/vim-markdown
"  - vim-airline       https://github.com/vim-airline/vim-airline
"  - vimtex            https://github.com/lervag/vimtex
filetype plugin indent on
syntax on
Helptags

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible

set autoindent
set smartindent
set expandtab
set smarttab

set tabstop=4
set shiftwidth=4

set foldmethod=syntax
set foldlevelstart=20
set textwidth=80
set t_Co=256

set number
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */

set background=dark

set hlsearch
set nojoinspaces


let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_sort_sequence = "[\/]$,*,\.o$,\.swp$,\.bak$,\~$"

let g:vimtex_fold_enabled=1
let g:vimtex_indent_enabled=0
let g:vimtex_imaps_leader="🤠"
let g:tex_flavor="latex"

let g:airline#extensions#tabline#enabled = 1

highlight ExtraWhitespace ctermfg=white ctermbg=green
match ExtraWhitespace /\s\+$/
hi MatchParen ctermfg=white ctermbg=green

set list
set listchars=tab:▸\

source ~/.vim/cyrilic.vim

let g:indentLine_setConceal=0
set conceallevel=0

autocmd BufNewFile,BufRead *.bsv set ft=bsv
autocmd BufNewFile,BufRead *.ms  set ft=bsv
autocmd BufNewFile,BufRead *.tex set ft=tex
autocmd BufNewFile,BufRead *.hbs set ft=html
autocmd BufNewFile,BufRead *.m   set ft=html
"
"Use tabs
autocmd Filetype make       setlocal noexpandtab nolist
autocmd Filetype go         setlocal noexpandtab nolist

"Minispec
autocmd FileType bsv set textwidth=100
let b:verilog_indent_modules = 1

"Use 2-space indent in html and makrdown
autocmd Filetype html       setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown   setlocal ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead */janncy/**.\(cc\|h\) setlocal ts=2 sts=2 sw=2

autocmd Filetype tex        setlocal nosmartindent indentexpr=
autocmd Filetype markdown   setlocal nofoldenable
autocmd Filetype markdown   setlocal nosmartindent

" save a file
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i

map <C-N> :Explore <CR>
map <C-T> :tabnew <CR>
map <C-C> :q <CR>

map <F5> <ESC>:w <bar> !xclip -selection clipboard < % <CR>
map <F10> <ESC> :wa <bar> !make <CR>

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

