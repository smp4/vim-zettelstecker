# vim-zettelstecker

> Bringing the power of vim to the zettelkasten.

## What is a Zettelkasten?

See (zettelkasten.de)[https://zettelkasten.de/].

## Features
`vim-zettelstecker` provides tools to reduce the friction of writing, maintaining and navigating a Zettelkasten in Vim. Optional interfaces to external services add some extra functionality for navigating (contextual backlinks, zettelgraph), adding citations from a reference source and publishing your Kasten to external formats (html, pdf or anything else supported by `pandoc`).

The core functionality of writing and basic navigation through the Zettelkasten is provided by a superset of the markdown tools offered by `vim-markdown`. 

Advanced navigation (contextual backlinks, zettelgraph), citations from a reference source and publishing are provided by Vim commands to Zotero, pandoc and some custom Python scripts. 

Feature list:

- Markdown syntax highlighting and relative file navigation within Vim from `vim-markdown`.
- Support for [CommonMark](https://spec.commonmark.org/) and [Github Flavored Markdown GFM](https://github.github.com/gfm/). (Optional: Using GFM adds strikethrough, pipe tables and GitHub wiki style links).
- Frictionless relative link generation from another zettel, from a heading in any zettel or from any point in any zettel.
- New Zettel and new Daily Log (TODO) templates. 
- Optional: Generating contextual backlinks (requires a Python interpreter).
- Optional: Generating a zettelgraph (requires a Python interpreter).
- Optional: Publishing to html (requires `pandoc`).
- Optional: Central reference list for the whole Zettelkasten, and publishing a Reference list at the bottom of each zettel in html (requires `pandoc` and [Zotero](https://www.zotero.org/)).
- Optional: Fuzzy word and file searching (requires `fzf`, `fzf-vim` and `RipGrep`).
- Optional: Fuzzy tag searching (requires `fzf`, `fzf-vim` and `ctags`).

## Getting Started

For the core vim-only experience, all you need are the Vim plugins. Install using your choice of plugin manager:

Plug:
```
Plug 'godlygeek/tabular' | 'preservim/vim-markdown' | Plug 'smp4/vim-zettelstecker'
```

`vim-plug` does not manage dependencies. `vim-zettelstecker` relies on `vim-markdown` which relise on `tabular`. The order in your `Plug` listing matters: It allows latterly loaded plugins to overwrite any mappings created by any plugins loaded before them.

Pathogen (untested): 
```
cd ~/.vim/bundle
git clone https://github.com/preservim/vim-markdown 
git clone https://github.com/smp4/vim-zettelstecker
```

This gets you the markdown syntax highlighting and basic navigation through your zettelkasten within Vim.


## Goals

* **Frictionless flow** from thought to permanent record. Tools should not disturb your flow or thought processes. It should be possible to record your thoughts as they come to you, in real time. Create and move with muscle memory.
* **No lock-in**. Your Zettelkasten is yours. All zettel material is recorded in open, human (and machine) readable formats (Markdown, with YAML front matter). The central reference list is stored in an open format within the Zettelkasten itself.
* **Free, and Open Source**. No paid tools required. Use only mature, well maintained tools with large communities.
* **Extensible**. Make it easy to extend the Zettelkasten toolset to fit different and evolving workflows.
* **Separation of concerns**. Beyond providing functionality needed to make the Zettelkasten a Zettelkasten (eg. provide features to support relative linking through the hypertext, reference management), the act of writing and formatting Zettels should not be over-burdened by tool-specific syntax. Creation of Zettels shall always be as frictionless as possible, and shall always be easily human readable.
* **Longevity**. Your Zettelkasten will be with you for life (and possibly with others beyond your life). Storage and access must be possible regardless of your current toolset. See also "No Lock-in".


Maintaining a Zettelkasten is primarily about *writing text*, and about *frictionless* writing at that. The only text editors I can think of that meet the above goals are Vim and Emacs, and right now I prefer Vim. So here we are.

**Non-Goals:**

* Pretty web front-ends. But since we have markdown files and pandoc, others might easily implement this.

## Assumptions

`vim-zettelstecker` assumes the following:

* Your Zettelkasten is a single directory of zettels with no file hierarchy. That is, zettels are not organised into sub-directories.
* Your Zettelkasten is either at `$HOME/zettelkasten` or you have an environment variable `$ZETTEL_DIR` set to an alternate path. TODO: 
* All zettels are written in Markdown (either CommonMark or Github Flavored Markdown), with a Markdown file extension recognised by vim (*.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md). 
* There is an `index.md` file in the zettel directory, which is the landing page each time you start up the Zettelkasten.
* Once created a Zettel never gets deleted, and never gets renamed.

## Installing Optional Dependencies

### fzf, fzf-vim

Although it isn't mandatory to install `RipGrep` and `ctags` with `fzf`, to get the most out of the `fzf` search functionality, you really should. See the `Ripgrep` and `ctags` sections below.

### RipGrep

### ctags

### Zotero, BetterBibTex

### Pandoc

* enable `backtick_code_blocks`

### Python

## User Guide

### Key mappings

All default mapped commands in Normal mode begin with `<leader>`. It would have been nice to follow with `z` for **z**ettel, but this character is already wired to vim fold functions. `n` for **n**ote, is fine, plus at least on my keyboard, the `n` character is close to `,` which is my leader. This allows a quick two character double-tap with the same hand.

In short: all `vim-zettelstecker` key mappings begin with `<leader>n`.

### Markdown

See the [markdown guide](https://www.markdownguide.org/basic-syntax/#links).

### Links

Always create links to locations in the Zettelkasten at the most granular level possible. This normally means creating a destination anchor at the sentence level. This keeps the relationship from one idea to another atomic. As an example of an anti-pattern, consider if links were created only to headers, or to identifiers (like `{#foo}` below):

```markdown
## My Heading {#foo}
```

What if some days after creating a link into `My heading`, you develop the idea under `My Heading` further, perhaps significantly, but that new development has no relationship to the backlinked Zettel? You need to refactor the backlinked Zettel to link more granularly to the intended idea. 

Or, what if you decide `My Heading` was a bad description, and now you want to change the heading? Again, the backlinked Zettel needs refactoring. 

It is tempting to use identifiers like `{#foo}` to have some non-changing identifier to avoid refactoring backlinked zettels irrespective of changes to the heading text. This would be a bad idea, because changing the heading name is a good indicator that the ideas contained within have changed, in which case although an annoyance, refactoring incoming links is a good thing. The prompt is welcome.

The above problems are even worse for links to a Zettel itself (or the title of a Zettel), much less the sub-heading example given here. 

All of these cases could have been avoided by granular anchor links to sentences describing the related idea. `vim-zettelstecker` provides commands and default keymaps to create links at the sentence, heading and Zettel level, however the sentence option should be used in most cases.

**Example `link-sentence`:**

> A zettel, let's call it the *primary* zettel, needs to have a link to an idea in a different *secondary* zettel. Make the buffer of the secondary zettel active and find the location of the idea to reference. Let's say we have found a good sentence.
>
> In normal mode, move the cursor anywhere in the sentence, press `<leader>nls` for `link-sentence`. This will create an anchor in the sentence, and copy an explicit markdown link to the TODO register.
>
> Make the buffer of the primary zettel active. Move the cursor to the location you'd like to place the link. In Normal mode, paste the markdown link with TODO. The cursor will be placed ready for you to type the visible text of the link. Enter Insert mode, give the text, and you're done.

Anchors have the form `{#ddd}` where d is a digit from 0-9. This means any single Zettel can have at most 1000 anchors. When creating an anchor, `vim-zettelstecker` will search the Zettel for any other anchors, find the highest number, and create the new anchor with `{#ddd+1}`. If there are gaps because old anchors were deleted, they will not be filled.

**Example `link-heading`:**

> Make the buffer of the secondary zettel active. 
>
> In normal mode, position the cursor anywhere in the heading or in the text below the heading. Press `<leader>nlh` for `link-heading`. This will copy an explicit markdown link to the TODO register.
>
> Make the buffer of the primary zettel active. Move the cursor to the location you'd like to place the link. In normal mode, paste the markdown link with TODO. The visible text of the link will be prepopulated with the text of the heading.

Note that `link-heading` uses the explict header link format, referencing the header text itself.

**Example `link-zettel`**

> Make the buffer of the secondary zettel active.
>
> Position the cursor anywhere below the YAML frontmatter section. In normal mode, press `<leader>nlz` for `link-zettel`. This will copy an explicit markdown link to the TODO register.
>
> Make the buffer of the primary zettel active. Move the cursor to the location you'd like to place the link. In normal mode, paste the markdown link with TOOD. The visible text of the link will be prepopulated with the title of the Zettel as defined in the YAML frontmatter.

`vim-zettelstecker` will only follow explicit header references both in vim, and in the default pandoc output. 

## Tips

This section adds helpful vim zettelkasten workflow tips. Not all of them related to `vim-zettelstecker` directly, but they play nicely together.

* Central reference source, stored with the Zettelkasten.
* References everywhere: Zotero and syncthing
* Publishing to static site with pandoc
* shell alias to jump into zettelkasten from everywhere (vim, changedir, landing page)
* Backups

### Folding

For general background on folding, read the folding section of the Vim user manual `:help usr_28`. 

A useful workflow is to have markdown files (Zettels) already folded to level 2 headings (level 1 is the title of the Zettel) so that you immediately have an overview of the Zettel. 

Bind `za` to `<space>` in your `.vimrc` (`nnoremap <space> za`) to toggle between open and close of a foldable section under the cursor. 

Then move between the folds with the cursor, position where you want to read or edit, `<space>` to open and edit, when done, `<space>` to close again.

Vim *really* slows down in Insert mode when automatic folds are turned on, since it is constantly recomputing where folds are as new text is added. [FastFold](https://github.com/Konfekt/FastFold) fixes this.

A minimal setup for a Zettelkasten in your `.vimrc` (see the `FastFold` repo for more):

```vimscript
" vim-plug section
Plug 'Konfekt/FastFold'

" FastFold configuration 
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1

" native vim folding settings
" Set foldlevel to collapse level 2+ headings
autocmd FileType markdown set foldlevel=1
```

This:

* Disables `vim-markdown` style markdown folding.
* Update folds on all possible fold commands.
* Also maps `zuz` to update folds.
* Uses `expression` fold method for markdown (our zettels).


### Customising vim-markdown

By default, `vim-zettelstecker` turns on the following `vim-markdown` syntax extensions for compatibility with Github-Flavored Markdown:

* `g:vim_markdown_strikethrough` for strikethrough with two tildes `~~` for `pandoc` compatibility.
* `g:vim_markdown_no_extensions_in_markdown` for GitHub wiki style links like `[link text](link-url)`.

These additional `vim-markdown` extensions are also turned on by `vim-zettelstecker`:

* `g:vim_markdown_math` to allow LaTeX math.
* `g:vim_markdown_frontmatter` to highlight YAML front matter.


### Publishing

`vim-zettelstecker` currently assumes `pandoc` is used for publishing to html or anything else. `pandoc` has its own flavour of markdown, based on CommonMark. The following `pandoc` extensions are recommended:

* `pipe_tables`, this should also be compatible with Github Flavored Markdown tables.
* `strikeout`, this should also be compatible with Ghub Flavored Markdown. Use two tildes `~~`.
* `tex_math_dollars`, escape math with two \$'s `$$`.

## Known Bugs

* Strange automatic folding may happen upon editing or deleting lines inside a fenced code block. If this is the case, a hacky workaround is to just temporarily disable folding in the buffer with `set nofoldenable`, make the edits, then turn folding back on when you're done `set foldenable`.

## Todo

- DONE zettel filetype in zettel metadata (put warning in dependencies)
- Be kinder to users - allow them to decide which vim-markdown configuration options get overwritten by vim-zettelstecker.
- template - daily log
- Break zettelstecker into just core parts with no publishing, references, minimum dependencies, and zettelsteckdosen for everything.
- how to extend `ge` in `vim-markdown` to open in the rightmost split, and open a new right split if there is only one window. can see how vim-markdown extends `gx` as a template.
- footnotes. not supported with GFM or CommonMark?
- links to anchors in other files
- zettel filetype recognisance
- Move all zettel related mappings to the plugin
- Copy all markdown settings over as well to the zettel filetype
- initalise repo
- window management: <https://vimways.org/2019/writing-vim-plugin/>
- not obliterating user maps (if somethign can be done with a command, use a command. dont force your maps on users): <https://vim.fandom.com/wiki/How_to_write_a_plugin>
- backlinks from here?: <https://github.com/Aarleks/zettel.vim>
- see link to sam wallage: <https://github.com/Aarleks/zettel.vim>
- graph <https://github.com/StotoV/zettel/blob/master/plugin/zettel.vim>
- Landing page is (left) index.md and (right) either keys.md, reading.md or a blank buffer.
- move keys.md to plugin documentation, since they are all vim keys and not zettelkasten keys.
- Footnotes, might require pandoc or MyST flavoured Markdown though.
- squish vsplits left and right. Default - assume main authoring pane is the left most vsplit. assume workflow uses vsplits. Default behaviour is keep minimum of mess on the left. Individual commands to squish a window left or right (resize it to only a couple columns, resize others to evenly fill remaining space). A focus command executed on any vsplit that squishes anything to the right, to the right, and anything to the left to the left. Another command "focus main" that squishes everything except left most pane. 
- everything is a command, that then gets mapped to the standard "`<leader>nx`" where x is the mapping. 
- Exposes the plugin's functions for use as commands in Vim.
- run_recognise_zettel_filetype
- run_backlink_generation (should it indicate where the backlinks arrive in this zettel?)
- run_publish
- run_open_any_link_part
- run_open_link_side_window
- run_copy_sentence_link
- run_copy_section_link
- run_copy_zettel_link
- run_go_to_index_zettel
- run_create_new_zettel
- run_add_citation_from_zotero
- run_generate_tags
- run_search_tags this is maybe an fzf function?
- run_update_lastupdated_on_write
- run_cycle_through_links_forwards (l, or t?)
- run_cycle_through_links_backwards (L, or T?)


## Usage and Support

This plugin is intended for my personal use. I'll be very happy to see others benefit from it, but please beware that although I use it every day and entrust my own Zettelkasten to it, it is not otherwise extensively tested. 

So, please feel free to use it for yourself, but if it wipes out your Zettelkasten then you will have my sympathies but the most I can do is sink a cold beer in remembrance of your lost wisdom. Please make backups before testing this plugin for yourself!

## Inspiration

Many thanks to Steve Losh at [https://learnvimscriptthehardway.stevelosh.com/](https://learnvimscriptthehardway.stevelosh.com/). Although I am a long-time Vim user, his book finally parted the veil behind which Vimscript-fu had been hiding.

## License

MIT license. See LICENSE.md.

## Contributing

Contributions are very welcome, however please take note that I am not in a position to guarantee timely or continuous maintenance. Life is busy at the moment.

I am by no means a professional software developer, or Vim expert. If you find bugs or have ideas for new features, please post an issue in GitHub. Pull Requests are also very welcome.
