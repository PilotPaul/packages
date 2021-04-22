"not wrap  
set nowrap 

if filereadable("tags.vim")  
    so tags.vim
endif  
  
"C syntax for colors  
hi cString		ctermbg=150 ctermfg=94
hi cFunction	cterm=bold ctermfg=46
hi cMacro		ctermfg=1
hi cGlobal		ctermfg=12
"hi cMember		ctermfg=LightMagenta  
hi def link		cTypedef cType
hi cEnum		ctermfg=11
