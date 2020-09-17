" GUI color definitions
" black
let s:gui00 = "26292B"
let s:gui08 = "303436"
" red
let s:gui01 = "C16A6D"
let s:gui09 = "CF8C8E"
" green
let s:gui02 = "8AB97B"
let s:gui10 = "A1C794"
" yellow
let s:gui03 = "DBA057"
let s:gui11 = "E2B378"
" blue
let s:gui04 = "7B82B9"
let s:gui12 = "949AC7"
" magenta
let s:gui05 = "B17ABA"
let s:gui13 = "C193C8"
" cyan
let s:gui06 = "7BB0B9"
let s:gui14 = "94BFC7"
" white
let s:gui07 = "D3D0CB"
let s:gui15 = "E7E5DF"

" Terminal color definitions
" black
let s:cterm00 = "00"
let s:cterm01 = "08"
" red
let s:cterm02 = "01"
let s:cterm03 = "09"
" green
let s:cterm04 = "02"
let s:cterm05 = "10"
" yellow
let s:cterm06 = "03"
let s:cterm07 = "11"
" blue
let s:cterm08 = "04"
let s:cterm09 = "12"
" magenta
let s:cterm10 = "05"
let s:cterm11 = "13"
" cyan
let s:cterm12 = "06"
let s:cterm13 = "14"
" white
let s:cterm14 = "07"
let s:cterm15 = "15"

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#".s:gui00
  let g:terminal_color_1 =  "#".s:gui01
  let g:terminal_color_2 =  "#".s:gui02
  let g:terminal_color_3 =  "#".s:gui03
  let g:terminal_color_4 =  "#".s:gui04
  let g:terminal_color_5 =  "#".s:gui05
  let g:terminal_color_6 =  "#".s:gui06
  let g:terminal_color_7 =  "#".s:gui07
  let g:terminal_color_8 =  "#".s:gui08
  let g:terminal_color_9 =  "#".s:gui09
  let g:terminal_color_10 = "#".s:gui10
  let g:terminal_color_11 = "#".s:gui11
  let g:terminal_color_12 = "#".s:gui12
  let g:terminal_color_13 = "#".s:gui13
  let g:terminal_color_14 = "#".s:gui14
  let g:terminal_color_15 = "#".s:gui15
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
elseif has("terminal")
  let g:terminal_ansi_colors = [
        \ "#".s:gui00,
        \ "#".s:gui01,
        \ "#".s:gui02,
        \ "#".s:gui03,
        \ "#".s:gui04,
        \ "#".s:gui05,
        \ "#".s:gui06,
        \ "#".s:gui07,
        \ "#".s:gui08,
        \ "#".s:gui09,
        \ "#".s:gui10,
        \ "#".s:gui11,
        \ "#".s:gui12,
        \ "#".s:gui13,
        \ "#".s:gui14,
        \ "#".s:gui15,
        \ ]
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "springan"


" Thanks to nuaNce (co1ncidence), for the following code.
" Found on his theme, at https://github.com/co1ncidence/mountaineer.vim


" Highlighting function
" Optional variables are attributes and guisp
function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfunction


fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun

" Vim editor colors
call <sid>hi("Normal",        s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Directory",     s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("Error",         s:gui00, s:gui08, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",      s:gui08, s:gui00, s:cterm08, s:cterm00, "", "")
call <sid>hi("Exception",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("FoldColumn",    s:gui12, s:gui01, s:cterm12, s:cterm01, "", "")
call <sid>hi("Folded",        s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("IncSearch",     s:gui01, s:gui09, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",    "", s:gui03, "", s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("MoreMsg",       s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("Question",      s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("Search",        s:gui01, s:gui10, s:cterm01, s:cterm10,  "", "")
call <sid>hi("Substitute",    s:gui01, s:gui10, s:cterm01, s:cterm10, "none", "")
call <sid>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("TooLong",       s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Visual",        "", s:gui02, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WarningMsg",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WildMenu",      s:gui08, s:gui10, s:cterm08, "", "", "")
call <sid>hi("Title",         s:gui13, "", s:cterm13, "", "none", "")
call <sid>hi("Conceal",       s:gui13, s:gui00, s:cterm13, s:cterm00, "", "")
call <sid>hi("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "", "")
call <sid>hi("NonText",       s:gui00, "", s:cterm00, "", "", "")
call <sid>hi("LineNr",        s:gui02, s:gui00, s:cterm03, s:cterm01, "", "")
call <sid>hi("SignColumn",    s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("StatusLine",    s:gui04, s:gui02, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none", "")
call <sid>hi("ColorColumn",   "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorColumn",  "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",    "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",  s:gui04, s:gui00, s:cterm04, s:cterm01, "", "")
call <sid>hi("QuickFixLine",  "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("PMenu",         s:gui05, s:gui01, s:cterm05, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:gui01, s:gui05, s:cterm01, s:cterm05, "", "")
call <sid>hi("TabLine",       s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineFill",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineSel",    s:gui11, s:gui01, s:cterm11, s:cterm01, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("Conditional",  s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("Constant",     s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:gui14, "", s:cterm14, "", "none", "")
call <sid>hi("Delimiter",    s:gui15, "", s:cterm15, "", "", "")
call <sid>hi("Float",        s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("Identifier",   s:gui08, "", s:cterm08, "", "none", "")
call <sid>hi("Include",      s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("Keyword",      s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("Label",        s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("Number",       s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Operator",     s:gui05, "", s:cterm05, "", "none", "")
call <sid>hi("PreProc",      s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("Repeat",       s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("Special",      s:gui12, "", s:cterm12, "", "", "")
call <sid>hi("SpecialChar",  s:gui15, "", s:cterm15, "", "", "")
call <sid>hi("Statement",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("StorageClass", s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("String",       s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("Structure",    s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("Tag",          s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("Todo",         s:gui10, s:gui01, s:cterm10, s:cterm01, "", "")
call <sid>hi("Type",         s:gui10, "", s:cterm10, "", "none", "")
call <sid>hi("Typedef",      s:gui10, "", s:cterm10, "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:gui12, "", s:cterm12, "", "", "")
call <sid>hi("cPreCondit",  s:gui14, "", s:cterm14, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("csAttribute",             s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("csModifier",              s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("csType",                  s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("csContextualStatement",   s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("csNewDecleration",        s:gui08, "", s:cterm08, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",   s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("cssColor",       s:gui12, "", s:cterm12, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui11, s:gui01,  s:cterm11, s:cterm01, "", "")
call <sid>hi("DiffChange",   s:gui03, s:gui01,  s:cterm03, s:cterm01, "", "")
call <sid>hi("DiffDelete",   s:gui08, s:gui01,  s:cterm08, s:cterm01, "", "")
call <sid>hi("DiffText",     s:gui13, s:gui01,  s:cterm13, s:cterm01, "", "")
call <sid>hi("DiffAdded",    s:gui11, s:gui00,  s:cterm11, s:cterm00, "", "")
call <sid>hi("DiffFile",     s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")
call <sid>hi("DiffNewFile",  s:gui11, s:gui00,  s:cterm11, s:cterm00, "", "")
call <sid>hi("DiffLine",     s:gui13, s:gui00,  s:cterm13, s:cterm00, "", "")
call <sid>hi("DiffRemoved",  s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("gitcommitSummary",        s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("gitcommitComment",        s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitSelected",       s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitHeader",         s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("gitcommitBranch",         s:gui09, "", s:cterm09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:gui08, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:gui08, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:gui11, "", s:cterm11, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:gui11, s:gui01, s:cterm11, s:cterm01, "", "")
call <sid>hi("GitGutterChange",  s:gui13, s:gui01, s:cterm13, s:cterm01, "", "")
call <sid>hi("GitGutterDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",  s:gui14, s:gui01, s:cterm14, s:cterm01, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("htmlItalic",  s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("htmlTag",     s:gui05, "", s:cterm05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptBraces",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptNumber",  s:gui09, "", s:cterm09, "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("jsStatement",         s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("jsReturn",            s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("jsThis",              s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("jsClassDefinition",   s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("jsFunction",          s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("jsFuncName",          s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("jsFuncCall",          s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("jsClassFuncName",     s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("jsClassMethodType",   s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("jsRegexpString",      s:gui12, "", s:cterm12, "", "", "")
call <sid>hi("jsGlobalObjects",     s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("jsGlobalNodeObjects", s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("jsExceptions",        s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("jsBuiltins",          s:gui10, "", s:cterm10, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("mailQuoted2",  s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("mailQuoted3",  s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("mailQuoted4",  s:gui12, "", s:cterm12, "", "", "")
call <sid>hi("mailQuoted5",  s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("mailQuoted6",  s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("mailURL",      s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("mailEmail",    s:gui13, "", s:cterm13, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call <sid>hi("markdownCodeBlock",         s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:gui13, "", s:cterm13, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:gui05, "", s:cterm05, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpComparison",      s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpParent",          s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpMethodsVar",      s:gui12, "", s:cterm12, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("pythonRepeat",    s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("pythonInclude",   s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("pythonStatement", s:gui14, "", s:cterm14, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui13, "", s:cterm13, "", "", "")
call <sid>hi("rubyConstant",                s:gui10, "", s:cterm10, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui15, "", s:cterm15, "", "", "")
call <sid>hi("rubyRegexp",                  s:gui12, "", s:cterm12, "", "", "")
call <sid>hi("rubySymbol",                  s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:gui11, "", s:cterm11, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("sassClassChar",  s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("sassInclude",    s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("sassMixing",     s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("sassMixinName",  s:gui13, "", s:cterm13, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui11, s:gui01, s:cterm11, s:cterm01, "", "")
call <sid>hi("SignifySignChange",  s:gui13, s:gui01, s:cterm13, s:cterm01, "", "")
call <sid>hi("SignifySignDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", "", "", "", "undercurl", s:gui08)
call <sid>hi("SpellLocal",   "", "", "", "", "undercurl", s:gui12)
call <sid>hi("SpellCap",     "", "", "", "", "undercurl", s:gui13)
call <sid>hi("SpellRare",    "", "", "", "", "undercurl", s:gui14)

" Startify highlighting
call <sid>hi("StartifyBracket",  s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("StartifyFile",     s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("StartifyFooter",   s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("StartifyHeader",   s:gui11, "", s:cterm11, "", "", "")
call <sid>hi("StartifyNumber",   s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("StartifyPath",     s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("StartifySection",  s:gui14, "", s:cterm14, "", "", "")
call <sid>hi("StartifySelect",   s:gui12, "", s:cterm12, "", "", "")
call <sid>hi("StartifySlash",    s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("StartifySpecial",  s:gui03, "", s:cterm03, "", "", "")

" Java highlighting
call <sid>hi("javaOperator",     s:gui13, "", s:cterm13, "", "", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui10  s:gui11  s:gui12  s:gui13  s:gui14  s:gui15
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm10 s:cterm11 s:cterm12 s:cterm13 s:cterm14 s:cterm15
