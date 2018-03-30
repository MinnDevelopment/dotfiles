if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword basicLanguageKeywords private public internal
syn keyword basicLanguageKeywords class interface data enum package import abstract init constructor open inner companion
syn keyword basicLanguageKeywords val var const final this super object
syn keyword basicLanguageKeywords for while when with try catch if else return
syn keyword basicLanguageKeywords in is as until
syn keyword basicLanguageKeywords fun async await launch runBlocking produce throw override inline infix suspend get set
syn keyword basicLanguageKeywords run let use apply
syn keyword basicConstantKeywords null
syn keyword basicTypeKeywords String Char Int Long Double Float Regex Unit Nothing Any
syn keyword basicTypeKeywords List Array Set Sequence Map Iterator
syn keyword basicTypeKeywords MutableList MutableSet MutableMap MutableIterator
syn keyword basicCommentKeywords TODO FIXME NOTE contained


" Matches

" decimal / octal
syn match ktNum '\d\+' display
syn match ktNum '-\d\+' display
syn match ktNum '\d\+[lL]' display
syn match ktNum '-\d\+[lL]' display

" binary
syn match ktNum '0b[01_]\+' display
syn match ktNum '-0b[01_]\+' display
syn match ktNum '0b[01_]\+[lL]' display
syn match ktNum '-0b[01_]\+[lL]' display

" hexadecimal
syn match ktNum '0x[0-9a-fA-F_]\+' display
syn match ktNum '-0x[0-9a-fA-F_]\+' display
syn match ktNum '0x[0-9a-fA-F_]\+[lL]' display
syn match ktNum '-0x[0-9a-fA-F_]\+[lL]' display

" float
syn match ktNum '\d*\.\d\+' display
syn match ktNum '-\d*\.\d\+' display
syn match ktNum '\d*\.\d\+[dD]' display
syn match ktNum '-\d*\.\d\+[dD]' display

" comment
syn match ktComment '//.*$' contains=basicCommentKeywords

" annotation
syn match ktAnnotation '@\w\+' display

" Regions
syn region ktString start='"' end='"' display
syn region ktChar start="'" end="'" display
syn region ktBlock start="{" end="}" fold transparent
syn region ktBComment start="/\*" end="\*/" fold contains=basicCommentKeywords


let b:current_syntax = "kt"

hi def link basicLanguageKeywords Statement
hi def link basicConstantKeywords Constant
hi def link basicCommentKeywords Todo
hi def link basicTypeKeywords Type
hi def link ktString Special
hi def link ktChar Special
hi def link ktNum Constant
hi def link ktBlock Statement
hi def link ktComment PreProc
hi def link ktBComment PreProc
hi def link ktAnnotation Type
