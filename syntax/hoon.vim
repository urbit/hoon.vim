"hoon.vim: Hoon syntax file
" Eric Fode, Philip C Monk

if exists("b:current_syntax")
  finish
endif

set autoindent
map g/ /+\(+\\|=\\|\-\\|\$\\|\*\)
nmap gs :let varname = '\<<C-R><C-W>\>'<CR>?++  <C-R>=varname<CR><CR>
set tabstop=2
set expandtab
set shiftwidth=2

" Allow gq, o, and <Enter> to understand comments
let b:comment_leader = '::  '
set comments=:::
set commentstring=::%s
set iskeyword+=-
set fo+=rq

" Don't wrap code at 72 characters, just comments
set fo-=t

" limit to 72 characters
set tw=72

syn case match

" Declarations
hi def link     hoonArm           Keyword
hi def link     hoonSymbol        Constant
hi def link     hoonAtom          Constant
hi def link     hoonAtomType      Constant
hi def link     hoonCubeType      Constant
hi def link     hoonCube          Constant
hi def link     hoonRune          Operator
hi def link     hoonId            Normal
hi def link     hoonBranch        Conditional
hi def link     hoonType          Type
hi def link     hoonNumber        Type
hi def link     hoonComment       Comment
hi def link     hoonTodo          Todo
hi def link     hoonString        String
hi def link     hoonSingleton     Identifier
hi def link     hoonColdString    Constant
hi def link     hoonLoobean       Identifier
hi def link     hoonLoobeanType   Constant

syn match       hoonSingleton     /\v[\`\~\.\@\*]/
syn region      hoonArm           start=/\v\+[\+\-=\$\*]/ end=/\v\w(\w|\-)*/
syn match       hoonAtomType      /\v\@(\w*)/
syn match       hoonCubeType      /\v\$\w(\w|\-)*/
syn match       hoonCubeType      /\v\$\$/
syn match       hoonCube          /\v\%\w(\w|\-)*/
syn match       hoonCube          /\v\%(\&|\||\$)/
syn match       hoonLoobean       /\v[|&]/
syn match       hoonLoobean       /\v\%\.[yn]/
syn match       hoonLoobeanType   /\v\$\.[yn]/
syn match       hoonId            /\v\l[\l\d\-]*/
syn match       hoonCube          /\v\l(\l|\d|\-)*\+/he=e-1


" numbers
" Numbers are in decimal, binary, hex, base32, or base64, and they must
" contain dots (optionally followed by whitespace), as in the German manner.

syn sync        linebreaks=1
syn match       hoonNumber        "\d\{1,3\}\%(\.\_s\?\d\{3\}\)*"
syn match       hoonNumber        "0x\x\{1,4\}\%(\.\_s*\x\{4\}\)*"
syn match       hoonNumber        "0b[01]\{1,4\}\%(\.\_s*[01]\{4\}\)*"
syn match       hoonNumber        "0v[0-9a-v]\{1,5\}\%(\.\_s*[0-9a-v]\{5\}\)*"
syn match       hoonNumber        "0w[-~0-9a-zA-Z]\{1,5\}\%(\.\_s*[-~0-9a-zA-Z]\{5\}\)*"

" comments

syn region      hoonComment       start=":\(:\|>\|<\)" end="$" contains=@spell,hoonTodo
syn region      hoonComment       start="+|" end="$" contains=@spell,hoonTodo

" strings

syn region      hoonString        start=+'+ skip=+\\[\\']+ end=+'+ contains=@spell
syn region      hoonBlock         start=+'''+ end=+'''+
syn region      hoonString        start=+"+ skip=+\\[\\"]+ end=+"+ contains=@spell


" match digraphs

syn match       hoonRune          "||"
syn match       hoonRune          "|_"
syn match       hoonRune          "|%"
syn match       hoonRune          "|@"
syn match       hoonRune          "|:"
syn match       hoonRune          "|\."
syn match       hoonRune          "|-"
syn match       hoonRune          "|\^"
syn match       hoonRune          "|+"
syn match       hoonRune          "|\*"
syn match       hoonRune          "|="
syn match       hoonRune          "|?"
syn match       hoonRune          "|\/"
syn match       hoonRune          "%_"
syn match       hoonRune          "%:"
syn match       hoonRune          "%\."
syn match       hoonRune          "%\^"
syn match       hoonRune          "%+"
syn match       hoonRune          "%-"
syn match       hoonRune          "%\~"
syn match       hoonRune          "%\*"
syn match       hoonRune          "%="
syn match       hoonRune          "\$|"
syn match       hoonRune          "\$_"
syn match       hoonRune          "\$:"
syn match       hoonRune          "\$%"
syn match       hoonRune          "\$,"
syn match       hoonRune          "\$&"
syn match       hoonRune          "\$?"
syn match       hoonRune          "\$+"
syn match       hoonRune          "\$-"
syn match       hoonRune          "\$="
syn match       hoonRune          "\$\~"
syn match       hoonRune          "\$\^"
syn match       hoonRune          "\$@"
syn match       hoonRune          ":_"
syn match       hoonRune          ":\~"
syn match       hoonRune          ":/"
syn match       hoonRune          ":\^"
syn match       hoonRune          ":+"
syn match       hoonRune          ":-"
syn match       hoonRune          ":\~"
syn match       hoonRune          ":\*"
syn match       hoonRune          "\.+"
syn match       hoonRune          "\.\*"
syn match       hoonRune          "\.="
syn match       hoonRune          "\.?"
syn match       hoonRune          "\.\^"
syn match       hoonRune          "#<"
syn match       hoonRune          "#>"
syn match       hoonRune          "\^|"
syn match       hoonRune          "\^\."
syn match       hoonRune          "\^-"
syn match       hoonRune          "\^+"
syn match       hoonRune          "\^&"
syn match       hoonRune          "\^\~"
syn match       hoonRune          "\^="
syn match       hoonRune          "\^?"
syn match       hoonRune          "\~|"
syn match       hoonRune          "\~\$"
syn match       hoonRune          "\~%"
syn match       hoonRune          "\~:"
syn match       hoonRune          "\~/"
syn match       hoonRune          "\~<"
syn match       hoonRune          "\~>"
syn match       hoonRune          "\~#"
syn match       hoonRune          "\~\^"
syn match       hoonRune          "\~+"
syn match       hoonRune          "\~&"
syn match       hoonRune          "\~="
syn match       hoonRune          "\~?"
syn match       hoonRune          "\~!"
syn match       hoonRune          "\~_"
syn match       hoonRune          ";_"
syn match       hoonRune          ";,"
syn match       hoonRune          ";%"
syn match       hoonRune          ";:"
syn match       hoonRune          ";/"
syn match       hoonRune          ";\."
syn match       hoonRune          ";<"
syn match       hoonRune          ";>"
syn match       hoonRune          ";-"
syn match       hoonRune          ";+"
syn match       hoonRune          ";&"
syn match       hoonRune          ";\~"
syn match       hoonRune          ";;"
syn match       hoonRune          ";\*"
syn match       hoonRune          ";="
syn match       hoonRune          ";?"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=|"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=?"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=\."
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=\^"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=:"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=;"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=<"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=%"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=>"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=-"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=+"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=\*"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=\~"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=/"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=,"
syn match       hoonRune          "?|"
syn match       hoonRune          "?:"
syn match       hoonRune          "?\."
syn match       hoonRune          "?<"
syn match       hoonRune          "?>"
syn match       hoonRune          "?-"
syn match       hoonRune          "?\^"
syn match       hoonRune          "?="
syn match       hoonRune          "?+"
syn match       hoonRune          "?&"
syn match       hoonRune          "?@"
syn match       hoonRune          "?\~"
syn match       hoonRune          "?!"
syn match       hoonRune          "!:"
syn match       hoonRune          "!,"
syn match       hoonRune          "!;"
syn match       hoonRune          "!\^"
syn match       hoonRune          "!<"
syn match       hoonRune          "!>"
syn match       hoonRune          "!="

" Not technically runes, but we highlight them like that.
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=="
syn match       hoonRune          "--"

let b:current_syntax = "hoon"

