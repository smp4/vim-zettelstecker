" Title:        vim-zettelstecker 
" Description:  Bringing the power of vim to the zettelkasten.
" Last Change:  02 August 2023
" Maintainer:   smp4 <https://github.com/smp4>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_vim-zettelstecker")
    finish
endif
let g:loaded_vim-zettelstecker = 1

" Exposes the plugin's functions for use as commands in Vim.
" run_recognise_zettel_filetype
" run_backlink_generation (should it indicate where the backlinks arrive in
" this zettel?)
" run_publish
" run_open_any_link_part
" run_open_link_side_window
" run_copy_sentence_link
" run_copy_section_link
" run_copy_zettel_link
" run_go_to_index_zettel
" run_create_new_zettel
" run_add_citation_from_zotero
" run_generate_tags
" run_search_tags this is maybe an fzf function?
" run_update_lastupdated_on_write
" run_cycle_through_links_forwards (l, or t?)
" run_cycle_through_links_backwards (L, or T?)
"command! -nargs=0 DisplayTime call example-plugin#DisplayTime()
"command! -nargs=0 DefineWord call example-plugin#DefineWord()
"command! -nargs=0 AspellCheck call example-plugin#AspellCheck()
