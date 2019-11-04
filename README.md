Install with your favorite package manager.  For
[Plug](https://github.com/junegunn/vim-plug), between `plug#begin` and
`plug#end` in your .vimrc put:

```vim
Plug 'urbit/hoon.vim'
```

This will give you syntax highlighting and some useful keybindings, the
most useful of which is `g/` (search for arm name).

For autocomplete, syntax checking, and rune snippets, you should connect
to the [Hoon Language
Server](https://github.com/urbit/hoon-language-server).  Install it
with:

```bash
pip3 install -U hoon-language-server
```

Install and build [Urbit](https://github.com/urbit/urbit).  Then, start
a fake ~zod with:

```bash
urbit -lF zod -c zod
```

And start the language server at the Urbit Dojo prompt with:

```
|start %language-server
```

Then, you can connect to this language server with any vim LSP plugin.
Here's one full-featured configuration, using
[UltiSnips](https://github.com/SirVer/ultisnips) for snippets,
[asyncomplete.vim](https://gitub.com/prabirshrestha/asyncomplete.vim)
for autocomplete and
[vim-lsp](https://github.com/prabirshrestha/vim-lsp) to connect to the
language server.

```vim
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'urbit/hoon.vim'
call plug#end()

let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert

if executable('hoon-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'hoon-language-server',
        \ 'cmd': ['hoon-language-server'],
        \ 'whitelist': ['hoon'],
        \ })
endif
```

If this isn't working, check `:LspStatus` to see if the language server
started correctly.

This requires python support, and I've only tested it in neovim after
running `pip3 install -U neovim`.  If you're willing to give up rune
snippets, you can get the other features in vanilla vim with this
simpler configuration:

```vim
call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'urbit/hoon.vim'
call plug#end()

let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert

if executable('hoon-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'hoon-language-server',
        \ 'cmd': ['hoon-language-server'],
        \ 'whitelist': ['hoon'],
        \ })
endif
```

Various other combinations of plugins are possible, to taste.
