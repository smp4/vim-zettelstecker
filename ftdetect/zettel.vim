" Expects zettels to be markdown files with a a YAML frontmatter block that
" includes the <filetype: zettel> variable. 
"
" The files must havea legal markdown file extension (or at least a markdown
" file extension that vim natively maps to the 'markdown' filetype).
"
" See <https://jekyllrb.com/docs/front-matter/> for guidance on correct
" formatting of a YAML frontmatter block. 
"
" ------------------------------------------
" YAML frontmatter regex search description
" ------------------------------------------
" ^---\_$\_.*filetype: zettel\_.*---\_$
" See: https://vim.fandom.com/wiki/Search_across_multiple_lines
" See: https://www.rexegg.com/regex-quickstart.html#anchors
" Assumes the search begins from start of file. 
" From start of line, search --- at the end of the line, followed by zero or
" more of any character including newline, the variable <filetype: zettel> at
" the end of a line, followed by zero or more of any character including 
" newline, concluding with --- and newline. eg.
"
"     ---
"     <...zero or more other frontmatter variables...>
"     filetype: zettel
"     <...zero or more other frontmatter variables...>
"     ---

autocmd BufRead,BufNewFile * if &ft == 'markdown' | if search("^---\_$\_.*filetype: zettel\_.*---\_$") | set ft=zettel | endif | endif
