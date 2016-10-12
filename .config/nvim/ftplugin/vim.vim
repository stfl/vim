

setloca
setlocal foldmethod=marker

" syn match markdownLineStart '"' nextgroup=@markdownBlock
"
" exe 'syn region markdownBold matchgroup=markdownBoldDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=markdownLineStart,markdownItalic,@Spell' . concealends
" exe 'syn region markdownItalic matchgroup=markdownItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=markdownLineStart,@Spell' . concealends
" exe 'syn region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend contains=markdownLineStart,@Spell' . concealends
"
" hi def link markdownItalic                htmlItalic
" hi def link markdownItalicDelimiter       markdownItalic
" hi def link markdownBold                  htmlBold
" hi def link markdownBoldDelimiter         markdownBold
" hi def link markdownBoldItalic            htmlBoldItalic
" hi def link markdownBoldItalicDelimiter   markdownBoldItalic
