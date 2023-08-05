" The file extension of a zettel isn't used by vim-zettelstecker to 
" recognise the file as a zettel.
"
" Markdown syntax is assumed, and used, by other components of the plugin to
" offer some functionality such as the link navigation. If you want that
" functionality, then you also need to use Markdown syntax, in which case it
" makes sense to store your zettels as *.md files. This also allows you to
" open them seemlessly in other md parsing programs. 
"
"
" To be recognised as a zettel file, the file must be text based and have a
" YAML Frontmatter block. 
" A [YAML Frontmatter block](https://jekyllrb.com/docs/front-matter/) must be
" at the start of the file delimited between triple-dashed lines. The plugin
" searches for the variable assignment <filetype: zettel> anywhere in the
" frontmatter to recognise the file as a zettel. The minimal example:
"
" ---
" filetype: zettel
" ---
"
" regex for YAML frontmatter section delimited by hypens including <filetype:
" zettel> variable.
" Assumes the search begins from start of file. 
" From start of line, search --- at the end of the line, followed by zero or
" more of any character including newline, the variable <filetype: zettel> at
" the end of a line, followed by zero or more of any character including 
" newline, concluding with --- and newline. eg.
" ---
" .
" ..
" filetype: zettel
" .
" ..
" ---
"
" ^---\_$\_.*filetype: zettel\_.*---\_$

if did_filetype()   " filetype already set..
  finish        " ..don't do these checks
endif

if search("^---\_$\_.*filetype: zettel\_.*---\_$")
  setfiletype zettel
endif
