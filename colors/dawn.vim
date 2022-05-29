" Name:       dawn.vim
" Version:    0.1
" Maintainer: github.com/CrispyBaccoon

hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name='dawn'

" Palette {{{

let s:p = {}

let s:p.bg0 = { "gui": "#161821" }
let s:p.bg1 = { "gui": "#262a39" }
let s:p.bg2 = { "gui": "#373c52" }
let s:p.bg3 = { "gui": "#474d6a" }
let s:p.fg0 = { "gui": "#f5f6f8" }
let s:p.fg1 = { "gui": "#e3e5ec" }
let s:p.fg2 = { "gui": "#cacedc" }
let s:p.fg3 = { "gui": "#b2b7cc" }
let s:dawn0 = { "gui": "#b0727b" }
let s:dawn1 = { "gui": "#bb95b5" }
let s:dawn2 = { "gui": "#787bb3" }
let s:dawn3 = { "gui": "#6164a2" }
let s:red = { "gui": "#e28178" }
let s:orange = { "gui": "#e2a478" }
let s:yellow = { "gui": "#e2c078" }
let s:green = { "gui": "#9ad387" }
let s:blue = { "gui": "#7f96db" }

if &background == 'dark'
  let s:bg0 = s:p.bg0
  let s:bg1 = s:p.bg1
  let s:bg2 = s:p.bg2
  let s:bg3 = s:p.bg3
  let s:fg0 = s:p.fg0
  let s:fg1 = s:p.fg1
  let s:fg2 = s:p.fg2
  let s:fg3 = s:p.fg3
else
  let s:bg0 = s:p.fg0
  let s:bg1 = s:p.fg1
  let s:bg2 = s:p.fg2
  let s:bg3 = s:p.fg3
  let s:fg0 = s:p.bg0
  let s:fg1 = s:p.bg1
  let s:fg2 = s:p.bg2
  let s:fg3 = s:p.bg3
endif

" }}}

function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
endfunction

" Basic UI {{{

call s:h("Normal", { "bg": s:bg0, "fg": s:fg1, "gui": "NONE" })
call s:h("VertSplit", { "fg": s:bg2 })
call s:h("LineNr", { "fg": s:bg3 })

call s:h("TabLineFill",{ "fg": s:dawn3, "gui": "NONE" })
call s:h("TabLineSel", { "fg": s:dawn1  , "gui": "NONE" })
call s:h("TabLine",    { "fg": s:dawn3, "gui": "NONE" })
hi! link EndOfBuffer TabLine

call s:h("ModeMsg", { "fg": s:fg3 })

call s:h("Cursor", { "bg": s:orange })
call s:h("CursorLine", { "bg": s:dawn3 })
call s:h("CursorLineNr", { "fg": s:orange })

call s:h("Comment", { "fg": s:bg3 })
hi! link Folded Comment

call s:h("WinBar", { "fg": s:bg3, "gui": "italic" })
call s:h("WinBarNC", { "fg": s:bg2, "gui": "italic" })

hi! link FoldColumn       TabLine
hi! link SignColumn       LineNr

" }}}

" Syntax {{{

call s:h("Identifier", {"fg": s:dawn0 })
call s:h("Constant", {"fg": s:dawn0 })
call s:h("Statement", {"fg": s:dawn1 })
call s:h("Type", {"fg": s:dawn0 })
call s:h("Special", {"fg": s:yellow })
call s:h("PreProc", {"fg": s:dawn3 })
call s:h("Boolean", {"fg": s:orange })
call s:h("Variable", {"fg": s:yellow })
call s:h("String", {"fg": s:green })
call s:h("Keyword", {"fg": s:dawn2 })
call s:h("Function", {"fg": s:dawn1 }) 
call s:h("Operator", { "fg": s:dawn2 })

" }}}

" Constant {{{
hi! link Character        Constant
hi! link Number           Constant
hi! link Float            Constant
hi! link Directory        Constant
hi! link Title            Constant
" }}}

" Statement {{{
hi! link Include          Statement
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Exception        Statement
" }}}

" ErrorMsg {{{
call s:h("ErrorMsg",      {"fg": s:red})
hi! link Error            ErrorMsg
hi! link Question         ErrorMsg
" }}}
" WarningMsg {{{
call s:h("WarningMsg",    {"fg": s:red})
" }}}
" MoreMsg {{{
call s:h("MoreMsg",       {"fg": s:bg2, "gui": "bold"})
" }}}

" NonText {{{
call s:h("NonText",       {"fg": s:bg1})
hi! link Conceal          NonText
" }}}

" Search {{{
call s:h("Search",     {"bg": s:yellow, "fg": s:bg0, "gui": "NONE"})
hi! link IncSearch Search
" }}}

" Visual {{{
call s:h("Visual",     {"bg": s:bg2})
" }}}
" VisualNOS {{{
call s:h("VisualNOS",     {"bg": s:bg2})
" }}}

" DiffAdd {{{
call s:h("DiffAdd",       {"fg": s:green})
" }}}
" DiffDelete {{{
call s:h("DiffDelete",    {"fg": s:red})
" }}}
" DiffChange {{{
call s:h("DiffChange",    {"fg": s:yellow})
" }}}
" DiffText {{{
call s:h("DiffText",      {"fg": s:blue})
" }}}

" StatuslineMsg {{{
call s:h("StatusLineOk",      {"gui": "underline", "fg": s:blue})
call s:h("StatusLineError",   {"gui": "underline", "fg": s:red})
call s:h("StatusLineWarning", {"gui": "underline", "fg": s:yellow})
" }}}

" Pmenu {{{
call s:h("PmenuSel", {"fg": s:bg0, "bg": s:dawn0})
hi! link Pmenu            TabLine
hi! link PmenuSbar        Pmenu
hi! link PmenuThumb       Pmenu
" }}}

" CursorColumn {{{
hi! link CursorColumn CursorLine
" }}}

" MatchParen {{{
call s:h("MatchParen",    {"bg": s:fg2, "fg": s:bg0})
" }}}

" HTML {{{

call s:h("htmlH1", { "fg": s:green })
call s:h("htmlH2", { "fg": s:red })
call s:h("htmlH3", { "fg": s:dawn2 })
call s:h("htmlH4", { "fg": s:blue })
call s:h("htmlH5", { "fg": s:dawn3 })
call s:h("htmlH6", { "fg": s:dawn1 })

" }}}

" Signify, git-gutter {{{
hi! link SignifySignAdd              LineNr
hi! link SignifySignDelete           LineNr
hi! link SignifySignChange           LineNr
hi! link GitGutterAdd                LineNr
hi! link GitGutterDelete             LineNr
hi! link GitGutterChange             LineNr
hi! link GitGutterChangeDelete       LineNr
" }}}

" Javascript {{{
hi link jsFlowTypeKeyword Statement
hi link jsFlowImportType Statement
hi link jsFunction Keyword
hi link jsFuncName Function
hi link jsGlobalObjects Normal
hi link jsGlobalNodeObjects Normal
hi link jsArrowFunction LineNr
hi link jsVariableDef Variable
hi link jsStorageClass StorageClass
hi link StorageClass Statement
" }}}

" XML {{{
hi link xmlTag Constant
hi link xmlTagName xmlTag
hi link xmlEndTag xmlTag
hi link xmlAttrib xmlTag
" }}}

" Markdown {{{

hi link markdownH1 htmlH1
hi link markdownH2 htmlH2
hi link markdownH3 htmlH3
hi link markdownH4 htmlH4
hi link markdownH5 htmlH5
hi link markdownH6 htmlH6
hi link markdownHeadingDelimiter Constant

call s:h("markdownBold", { "fg": s:dawn1, "gui": "bold" })
hi link markdownBoldDelimiter markdownBold

call s:h("markdownItalic", { "fg": s:dawn0, "gui": "italic" })
hi link markdownItalicDelimiter markdownItalic

call s:h("markdownUrl", { "fg": s:dawn2 })
call s:h("markdownLinkDelimiter", { "fg": s:bg3 })

call s:h("markdownLinkText", { "fg": s:yellow })
hi link markdownListMarker markdownLinkText

call s:h("markdownCode", { "fg": s:dawn1 })
hi link markdownCodeBlock markdownCode
hi link markdownCodeDelimiter markdownCode

" }}}

" VimWiki {{{
hi link VimwikiHeader1 markdownH1
hi link VimwikiHeader2 markdownH2
hi link VimwikiHeader3 markdownH3
" }}}

" Vim {{{
hi link vimHighlight Statement
hi link vimFunction Function
hi link vimVar Variable
hi link vimLet Statement
hi link vimFuncName Variable
hi link vimUserFunc vimFuncName
hi link vimUserCmd Function
hi link vimUsrCmd vimUserCmd
hi link vimOper vimHighlight
hi link helpExample markdownCodeBlock
" }}}

" Dosini {{{
hi link dosiniHeader Statement
hi link dosiniLabel Constant
hi link dosiniValue Variable
" }}}

" Python {{{

hi link pythonOperator Operator
hi link pythonInclude Include
hi link pythonStatement Statement
hi link pythonConditional Conditional
hi link pythonRepeat Repeat
hi link pythonException Exception
hi link pythonFunction Function

" }}}

" Go {{{

hi link goStatement Statement
hi link goConditional Conditional
hi link goRepeat Repeat
hi link goException Exception
hi link goConstants Constant
hi link goDeclaration Statement
hi link goBuiltins Include

" }}}

" Coffee {{{

hi link coffeeKeyword Keyword
hi link coffeeConditional Conditional

" }}}

" Ruby {{{

hi link rubyAttribute              Identifier
hi link rubyInclude                Include
hi link rubyLocalVariableOrMethod  Method
hi link rubyCurlyBlock             Keyword
hi link rubyConstant               Constant
" hi link rubyInterpolation          
" hi link rubyInterpolationDelimiter 
" hi link rubyRegexp
" hi link rubySymbol                 
hi link rubyStringDelimiter        String
hi link rubyConditional            Conditonal
hi link rubyRepeat                 Repeat

" }}}

" ALE {{{
hi link ALEWarning WarningMsg
hi link ALEWarningSign WarningMsg
hi link ALEError ErrorMsg
hi link ALEErrorSign ErrorMsg
hi link ALEInfo InfoMsg
hi link ALEInfoSign InfoMsg
" }}}

" SQL {{{
hi link sqlStatement Statement
hi link sqlKeyword Keyword
" }}}

call s:h("StatusLine", {"fg": s:bg3, "bg": s:bg0})