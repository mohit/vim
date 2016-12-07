set nocompatible
filetype off

" let plug be the vundle
call plug#begin('~/.vim/bundle')

" Bundles
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/ultisnips'
Plug 'jpalardy/vim-slime'

Plug 'garbas/vim-snipmate'
"
" original repos on github
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'tsaleh/vim-align'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'cespare/vim-toml'

" coffeescript and node
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
"
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Plug 'L9'
Plug 'FuzzyFinder'
Plug 'vim-scripts/ZoomWin'
Plug 'ctrlp.vim'
" bundles for mohit
Plug 'altercation/vim-colors-solarized'
Plug 'plasticboy/vim-markdown'
Plug 'Jinja'
Plug 'Lokaltog/vim-powerline'
Plug 'sjl/gundo.vim'
" git
Plug 'tpope/vim-fugitive'
" github
Plug 'mattn/gist-vim'
Plug 'jez/vim-github-hub'
" mac clipboard
" saltstack (sls files)
Plug 'saltstack/salt-vim'
" File types
Plug 'csv.vim'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'

" Typescript  
" syntax highlighting
Plug 'leafgarland/typescript-vim'

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""""GENERAL"""""""""""""""""""""""""""""""
filetype plugin indent on

"read modeline at bottom of files
set modeline

"allow mouse control
set mouse=a

syntax on

colorscheme solarized 
"colorscheme BusyBee 

set t_Co=256
set background=light
let g:solarized_termcolors=16


"matches previous indent level,
"intelligently guesses indent (code level)
set autoindent
set smartindent

"tab = 4 spaces "indent spaces = 4 and tab to spaces
set expandtab
set tabstop=4
set shiftwidth=4

"allowing backspace to work after indent -> see :help i_backspacing
set backspace=indent,eol,start

"removes annoying beeps when bad command
"instead flashes screen
"first one helps with entering
autocmd VimEnter * set vb t_vb=
set vb t_vb=

"shows status of cursor position
set ruler

"sets search highlighting
"also...incremental search!
set hls
set incsearch

"specialized leader key
let mapleader="\\"

"removes highlighting from search after space
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

"no search wraps
set nowrapscan

"magic patterns - extended regular expresions
set magic

"colors for &hlsearch
hi Search ctermfg=white ctermbg=lightblue

set nowrap

"hides buffers instead of closing them
set hidden

"ignorecase when searching
set ignorecase

"Setup backup location and enable
set backupdir=~/.vim/backup
set backup
set directory=~/.vim/swp

"""""""""""""""""""""""""""CTAGS"""""""""""""""""""""""""""""

"Tags files
"autocmd FileType java set tags+=~/.vim/tags/java_tags

"regenerate cscope
nmap <F6> :!find . -iname "*.c" -o -iname "*.cpp" -o -iname "*.cc" -o -iname "*.c++" -o -iname "*.h" -o -iname "*.hpp" -o -iname "*.java" -o -iname "*.py" -o -iname "*.scala" > cscope.files<CR>:!cscope -b<CR>:cs reset<CR><CR>

"""""""""""""""""""""""""""UltiSnips"""""""""""""""""""""""""""""
let g:UltiSnips = {}

let g:UltiSnips.snipmate_ft_filter = {
            \ 'default' : {'filetypes': ["FILETYPE", "_"] },
            \ 'html'    : {'filetypes': ["html", "javascript", "_"] },
            \ 'xhtml'    : {'filetypes': ["xhtml", "html", "javascript", "_"] },
            \ 'cpp'    : {'filetypes': [] },
            \ }
let g:UltiSnips.always_use_first_snippet = 1

"""""""""""""""""""""""""""JAVA SPECIFIC"""""""""""""""""""""""""""""
"autocmd FileType java set foldmethod=syntax
function! ToggleComments()
    if &foldmethod == "marker"
        "need to add some way of undoing the folds
        let &foldmethod= "manual"
        let &foldmarker= "{{{,}}}"
    else
        let &foldmethod= "marker"
        let &foldmarker= "/*,*/"
    endif
endfunction

nmap <silent> <F7> :call ToggleComments()<CR>

"""""""""""""""""""""""""""C SPECIFIC"""""""""""""""""""""""""""""
"autocmd FileType c set foldmethod=syntax

"""""""""""""""""""""""""""SUPERTAB"""""""""""""""""""""""""""

"set completion type to change based on context around it
let g:SuperTabDefaultCompletionType = "context"

"Helps with completions not autofinishing first match
set completeopt=longest,menu,preview

"""""""""""""""""""""""""""ECLIM""""""""""""""""""""""""""""""

"eclim settings
"if has("PingEclim")  "PingEclim isn't loaded yet, so this always fails
if 1
    "disable eclim taglist
    let g:EclimTaglistEnabled=0

    "nnoremap <silent><buffer><Space> :JavaSearchContext<cr>
endif

"ImportMissing
nmap <silent><leader>m :JavaImportMissing<CR>

"""""""""""""""""""""""""""MAPPINGS"""""""""""""""""""""""""""

"change to next and previous buffers
noremap <silent> <C-h> :bp<CR>
noremap <silent> <C-l> :bn<CR>

"change to next quickfix error
noremap <silent><leader>h :cp<CR>
noremap <silent><leader>l :cn<CR>

"caps to escape
map! <C-j> <Esc>
map <C-j> <Esc>

"Trick if forgot to sudo
cmap w!! %!sudo tee > /dev/null %

"VCSVimDiff
nmap <silent><leader>v :VCSVimDiff<CR>

""""""""""""""""""""""""""""""NERDTree""""""""""""""""""""""""""""""

"NERDTree Ctrl-n for nerdtree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

"change nerdtree directory to directory containing current file Ctr-d goto dir
nnoremap <silent> <C-d> :NERDTree %:h<CR>

"ignore files
let NERDTreeIgnore=['\.pyc$', '\~$']

""""""""""""""""""""""""""""""Clang_complete""""""""""""""""""""""""""""""
let g:clang_auto_select=0
let g:clang_complete_auto=0
let g:clang_hl_errors=1

""""""""""""""""""""""""""""""AcK""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
if !empty(matchstr(hostname(), "ebox"))
    let g:ackprg="ack -H --nocolor --nogroup --column"
endif

"""""""""""""""""""""""""""""""PROJECT SPECFIC FUNCTIONS""""""""""""""""""""""""""""""

"default code directory
let s:codedir = "~/code"

if !empty(matchstr(hostname(), "evm-ubuntu"))
    let s:codedir = "/usr/local/code"
endif

"PolyOmni 
if !empty(matchstr($PWD, "polyomni"))
    call PolyOmniSetup()
endif

"" Include user's local vim config
if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
