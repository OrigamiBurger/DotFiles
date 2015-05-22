" * * * * * * * * * Begin vundle setup * * * * * * * * *

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Provides keyword completion system by maintaining a cache of keywords in the current buffer
" Provides keyword completion system by maintaining a cache of keywords in the current buffer
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neosnippet.vim' 
" Contains additional snippets files for various programming languages
Plugin 'honza/vim-snippets'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" Misc. colorschemes
Plugin 'chrishunt/color-schemes'
Plugin 'chriskempson/base16-vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'

" Use * on visually selected text to search for it
Plugin 'bronson/vim-visual-star-search'

" Lightweight vim status bar
Plugin 'bling/vim-airline'

" Scala syntax and defaults for the scala language
Plugin 'derekwyatt/vim-scala'

" Better JSON syntax coloring
Plugin 'elzr/vim-json'

" Full path fuzzy file, buffer, mru, tag, finder for Vim
Plugin 'kien/ctrlp.vim'

" Provides an easy way to browse the tags of the current file and get an overview of its structure
Plugin 'majutsushi/tagbar'

" Color nested matching parentheses with different colors
Plugin 'kien/rainbow_parentheses.vim'

" A much faster replacement for 99% of the uses of grep
Plugin 'rking/ag.vim'

" A tree explorer plugin for navigating the filesystem
Plugin 'scrooloose/nerdtree'

" Easily navigate vim's undo tree visually
Plugin 'sjl/gundo.vim'

" Helps break the habit of spamming 'jjjjj', 'kkkkk', etc.
" Plugin 'takac/vim-hardtime'

" Press <C-G>c in insert mode to get a temporary software caps lock
Plugin 'tpope/vim-capslock'

" Adds new operator 'gc' for easy commenting in many languages
Plugin 'tpope/vim-commentary'

" Vim sugar for common UNIX shell commands
Plugin 'tpope/vim-eunuch'

" Powerful git wrapper for vim
Plugin 'tpope/vim-fugitive'

" Operators for deleting, changing, and adding surroundings like parens, brackets, etc.
Plugin 'tpope/vim-surround'

" vim-signature is a plugin to place, toggle and display marks
Plugin 'kshenoy/vim-signature'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" * * * * * * * * * End vundle setup * * * * * * * * *
"Features
syntax on
set relativenumber
set hlsearch
set showcmd
set backspace=2 " make backspce work like most other apps

"Mouse
set mouse=a

"Indentation 1
set tabstop=4
set autoindent
set shiftwidth=4
set expandtab
nnoremap \ :wa<CR>

" Set 'per project' vimrc
set exrc        " Enable per-directory .vimrc files
set secure      " disable unsafe commands in local .vimrc files

" Dont ask to re-read files changed outside vim
set autoread

" Setting the leader to space
let mapleader = " "


" Useful shortcuts with leader
nnoremap <leader>T :TagbarToggle<cr>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>P :CtrlP ~/pt-software/<CR>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <Leader>i :set invnumber<CR>
nnoremap <Leader><TAB> <C-w><C-w>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <leader>c :!ctags -R $(git rev-parse --show-toplevel) && echo "Done generating ctags"<CR>
vnoremap <Leader>s :w !scala

nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

nnoremap <Leader>, <C-w>>
nnoremap <Leader>. <C-w><
nnoremap <Leader>. <C-w><
nnoremap <Leader>- <C-w>-
nnoremap <Leader>= <C-w>+

nnoremap <Leader>f :cnext<CR>
nnoremap <Leader>F :cnfile<CR>
nnoremap <Leader>b :cprev<CR>
nnoremap <Leader>B :cpfile<CR>

nnoremap <silent> <UP> :copen<CR>
nnoremap <silent> <DOWN> :cclose<CR>
nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <LEFT> :cprev<CR>

nnoremap <Leader>g :GundoToggle<CR>

" Neocomplete settings
let g:neocomplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Toggle relative line numbers
nnoremap <silent><C-l> :set relativenumber!<cr>

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set matchtime=2
set scrolloff=2

nnoremap <Leader>0 :RainbowParenthesesToggle<CR>
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" If editing a scala file, set the makeprg to compile with maven
au BufNewFile,BufRead *.scala set makeprg=mvn\ test
nnoremap <Leader>m :wa <bar> :make<CR>

" Use Honza's snippets, not default ones
let g:neosnippet#disable_runtime_snippets = { "_": 1, }
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Map Q to executing the q macro
nnoremap Q @q

" # # # # # Airline config # # # # #
let g:airline#extensions#tabline#enabled = 1
"does weird arrows with not correct font installed
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 0

" Start neocomplete
let g:neocomplete#enable_at_startup = 1

" Don't wrap text by default
set nowrap

" Show line number on tab label
set guitablabel=%N/\ %t\ %M

" Show line numbers with NT
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeDirArrows=0
let g:NERDTreeShowBookmarks=1

" Open the quickfix window after using any grep-based fugitive command
autocmd QuickFixCmdPost *grep* cwindow

" Vim HardTime enabled (no jjjjj or kkkkk)
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 3
let g:hardtime_default_on = 1
let g:hardtime_timeout = 500

" Misc. formatting
filetype indent on
filetype on
filetype plugin indent on
set autoindent
set hlsearch
set linebreak
set number
set relativenumber
set showmatch
syntax on

" Override scala.vim's tabstop of 2 spaces
au BufNewFile,BufRead *.scala set sw=4

" Gruvbox doesn't play well with cursorline when in vimdiff mode, so disable
" it in that case
if !&diff
    " Highlight the current line
    set cursorline
endif

" Gruvbox colorscheme options
let g:gruvbox_contrast_dark="soft"

" Gruvbox's italics go wonky outside of the GUI vim
if !has("gui_running")
    let g:gruvbox_italicize_comments=0
endif
set background=dark
colorscheme gruvbox

" Bold the cursor linenumber
highlight scalaDef cterm=bold
highlight scalaClass cterm=bold
highlight scalaObject cterm=bold
highlight scalaTrait cterm=bold
highlight CursorLineNR cterm=bold

" Use tabs instead of spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Periodic backups
set backup
set backupdir=~/.vim/backup
set undodir=~/.vim/backup
set undofile
set directory=~/.vim/tmp

" Split correctly
set splitright
set splitbelow

" Cleaning options for gvim/mvim"
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar"

" Remap color to semicolon and vis-versa
nnoremap : ;
nnoremap ; :
vnoremap ; :
vnoremap : ;



" visually select the last paste or change
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" * * * * * * * * * * * * * * * * *
" CtrlP plugin settings
" * * * * * * * * * * * * * * * * *
"
" Ag - The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_cmd = 'CtrlP'

" Search by file name by default (<c-d> switches modes)
let g:ctrlp_by_filename = 0

" Regex mode by default (<c-r> to toggle)
let g:ctrlp_regexp = 0

let g:ctrlp_working_path_mode = 'acr'

" CtrlP window appears at bottom instead of top
let g:ctrlp_match_window_bottom = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.tar.gz,*.tgz,*.tar,*.gzip,*.jar

" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Use smart case sensitive searching
set ignorecase
set smartcase

" Vim keeps 50 commands in history(`q:` in normal mode.) Let's bump this to 1000.
set history=1000

" Show “invisible” characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:…
set list

" Highlighting of various characters
highlight NonText ctermfg=grey guifg=grey ctermbg=NONE guibg=NONE
highlight SpecialKey ctermfg=grey guifg=grey ctermbg=NONE guibg=NONE

" Incremental, highlighted search
set incsearch
set hlsearch

" Tagbar config
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

" Show visibility symbols (public private, etc)
let g:tagbar_show_visibility = 0
let g:tagbar_width = 36

" Rainbow Parantheses Settings
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Edit buffers and switch without saving them
set hidden

" Don't conceal in vim-json
let g:vim_json_syntax_conceal = 0

" Create a command for formatting pipe delimited files
command Pipef execute "%!column -s '|' -t"
command Tabf execute "%!column -s '\t' -t"

" Use sudo to write the file even if vim wasn't run with sudo
command Swrite execute "w !sudo tee > /dev/null %"

" Custom function to populate the argslist with files in the quickfix list
" Usage can be found here:
" http://vimcasts.org/episodes/project-wide-find-and-replace/
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
