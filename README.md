# vim-zettelstecker

*Bringing the power of vim to the zettelkasten.*

## What is a Zettelkasten?

See (zettelkasten.de)[https://zettelkasten.de/].

## Features

- 

## Installation

Pathogen: `git clone https://github.com/smp4/vim-zettelstecker ~/.vim/bundle/vim-zettelstecker`

Plug: `Plug 'smp4/vim-zettelstecker'` in your `.vimrc`.

## Dependencies

The following dependencies are expected:

* fzf
* Ripgrep
* `perservim/vim-markdown`
* Zotero
* Pandoc
* ctags

The plugin expects zettels to be `*.md` files with YAML frontmatter blocks. The frontmatter must contain a key:value pair `filetype: zettel`. This is used to help vim identify that it is working with zettels, rather than ordinary markdown files.

## Usage

This package is intended for my personal use. Feel free to use it for yourself, but if it wipes out your zettelkasten, the most I can and will do is have a cold beer in remembrance.

## Todo

- zettel filetype in zettel metadata (put warning in dependencies)
- zettel filetype recognisance
- Move all zettel related mappings to the plugin
- Copy all markdown settings over as well to the zettel filetype
- initalise repo
- window management: <https://vimways.org/2019/writing-vim-plugin/>
- not obliterating user maps (if somethign can be done with a command, use a command. dont force your maps on users): <https://vim.fandom.com/wiki/How_to_write_a_plugin>
- backlinks from here?: <https://github.com/Aarleks/zettel.vim>
- see link to sam wallage: <https://github.com/Aarleks/zettel.vim>
- graph <https://github.com/StotoV/zettel/blob/master/plugin/zettel.vim>


## License

MIT license. See LICENSE.md.

## Inspiration

Many thanks to Steve Losh at (https://learnvimscriptthehardway.stevelosh.com/)[https://learnvimscriptthehardway.stevelosh.com/]. 
