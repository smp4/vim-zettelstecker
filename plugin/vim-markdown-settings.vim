" Title:        vim-zettelstecker 
" Description:  Bringing the power of vim to the zettelkasten.
" Last Change:  07 August 2023
" Maintainer:   smp4 <https://github.com/smp4>

" allow dollar sign escapable math syntax highlighting $$
let g:vim_markdown_math = 1

" allow YAML front matter syntax highlighting
let g:vim_markdown_frontmatter = 1

" allow tilde strikethrough ~~
let g:vim_markdown_strikethrough = 1

" do not require .md extensions for markdown links
let g:vim_markdown_no_extensions_in_markdown = 1

" allow ge command to follow named anchors in links of form file#anchor
let g:vim_markdown_follow_anchor = 1
