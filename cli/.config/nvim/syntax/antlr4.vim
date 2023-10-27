" vim: ts=8
" Vim syntax file
" Language:     ANTLRv4
" Maintainer:   Jörn Horstmann (updated by Dylon Edwards)
" Last Change:  2015-12-15
"
" Copyright 2018 Dylon Edwards <dylon.devo+vim-antlr@gmail.com>

" Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

" The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword antlrKeyword import fragment lexer parser grammar returns locals throws catch finally mode options tokens header members init after channels mode protected public private

syn keyword antlrReserved rule

syn match  antlrCharacter '\\\(r\|n\|t\|f\|b\|"\|\'\|\\\|u\x\{4}\)' contained display

syn match antlrToken "\<[A-Z_][a-zA-Z_0-9]\+\>"
syn match antlrRule "[a-z][a-zA-Z_0-9]\+"
syn match antlrScopeVariable '$\k\+::\k\+'

syn match antlrOperator "[:;@.]"
syn match antlrOperator "[()]"
syn match antlrOperator "[?+*~|!]"
syn match antlrOperator "[->=^]"

syn match antlrBlock "[{}]"
syn region antlrAction matchgroup=antlrBlock start="{" end="}" contains=antlrVariable,antlrAction
syn match antlrVariable contained "$[a-zA-Z][a-zA-Z_0-9]*"

syn include @JAVA syntax/java.vim
syn region ANTLR4EmbeddedJavaAction matchgroup=antlrBlock start="{" end="}" contains=@JAVA,antlrVariable containedin=antlrAction

syn keyword antlrOperations pushMode popMode skip channel

syn match antlrBrace "[\[\]]"
syn region antlrCharClass matchgroup=antlrBrace start="\[" end="\]" contains=antlrCharacter

syn region antlrLiteral start=+'+ end=+'+ contains=antlrCharacter
syn region antlrLiteral start=+"+ end=+"+ contains=antlrCharacter

syn region antlrComment start="/\*" end="\*/"
syn match  antlrComment "//.*$"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508
  if version < 508
    let did_antlr_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink antlrReserved          Error
  HiLink antlrOperations        Identifier
  HiLink antlrLiteral           String
  hi def antlrVariable		term=bold cterm=bold gui=bold
  HiLink antlrBrace		Operator
  HiLink antlrBlock		Operator
  HiLink antlrCharacter         Special
  HiLink antlrComment           Comment
  HiLink antlrOperator          Operator
  HiLink antlrKeyword           Keyword
  HiLink antlrToken             PreProc
  HiLink antlrScopeVariable     Identifier
  HiLink antlrRule		Type

  delcommand HiLink
endif

let b:current_syntax = "antlr4"
