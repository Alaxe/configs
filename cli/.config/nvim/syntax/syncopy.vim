if exists("b:current_syntax")
  finish
endif

syntax case match

syntax match sy_op "[][()+\-*%/=!<>&|^~@?,:.#{};]"

syntax keyword sy_todo TODO
syntax region sy_comment start="//"  end=/$/   contains=sy_todo
syntax region sy_comment start="/\*" end="\*/" contains=sy_todo

syntax match sy_number "\<[0-9]\+\>"
syntax match sy_number "\<0b[0-1]\+\>"
syntax match sy_number "\<0x[0-9a-fA-F]\+\>"

syntax keyword sy_bool true false
syntax keyword sy_invalid invalid

syntax region sy_string start=/"/ end=/"/

syntax keyword sy_keyword as comb mod import let rule systolic def tick proc pipe
syntax keyword sy_mut mut
syntax keyword sy_control_flow if else in
syntax match sy_control_flow "\(#for\|#if\)\>"

syntax match sy_func_call "\<[a-z_][a-zA-Z0-9_]*\s*("he=e-1,me=e-1
syntax match sy_func_call "\<[a-z_][a-zA-Z0-9_]*\s*#("he=e-2,me=e-2
syntax match sy_type "\<_*[A-Z][a-zA-Z0-9_]*\>"
syntax match sy_const "\<[A-Z_][A-Z_0-9]\+\>"


syntax match sy_builtin "\w\(\w\)*!"

" link classes to vim colors
highlight link sy_todo Todo
highlight link sy_comment Comment
highlight link sy_number Number
highlight link sy_bool Boolean
highlight link sy_invalid Constant

highlight link sy_string String

highlight link sy_type Type
highlight link sy_const Constant
highlight link sy_func_call Function
highlight link sy_def_call Function
highlight link sy_builtin Macro

highlight link sy_op Operator
highlight link sy_keyword Keyword
highlight link sy_mut StorageClass
highlight link sy_control_flow Conditional


let b:current_syntax="syncopy"

