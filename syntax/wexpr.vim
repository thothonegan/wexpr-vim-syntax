" Vim syntax file
" Language:    Wexpr
" Maintainer:  Kenneth Perry (thothonegan) <thothonegan@gmail.com>
"
if exists("b:current_syntax")
	finish
endif

" Syntax: Comments
syntax keyword wexprCommentTodo contained TODO FIXME XXX TBD
syntax match wexprLineComment /\v;.*$/ contains=@Spell,wexprCommentTodo
syntax region wexprComment start=/\v;\(--/ end=/\v--\)/ contains=@Spell,wexprCommentTodo fold

" Syntax: Strings
syntax region wexprString start=/\v"/ skip=/\v\\./ end=/\v\"/
syntax region wexprBinaryString start=/\v\</ end=/\v\>/
syntax match wexprBareword /\v[a-zA-Z_0-9]+[a-zA-Z0-9_\.]*/

syntax keyword wexprSymbols (
syntax keyword wexprBoolean true false
syntax keyword wexprNull null nil
syntax region wexprReferenceInject start="\*\[" end="\]" contains=@Spell
syntax region wexprReferenceDeclaration start="\[" end="\]" contains=@Spell

" Syntax: Braces
syn region wexprFold matchgroup=wexprRegion start="#(" end=")" transparent fold
syn region wexprFold matchgroup=wexprRegion start="@(" end=")" transparent fold

" Highlights
highlight link wexprCommentTodo Todo
highlight link wexprLineComment Comment
highlight link wexprComment Comment
highlight link wexprString String
highlight link wexprBinaryString Constant
highlight link wexprBareword Identifier
highlight link wexprBoolean Boolean
highlight link wexprNull Constant
highlight link wexprSymbols Keyword
highlight link wexprReferenceInject Type
highlight link wexprReferenceDeclaration Type
highlight link wexprRegion Delimiter

let b:current_syntax = "wexpr"
