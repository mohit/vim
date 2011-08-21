""""""PATHOGEN INITIALIZATION"""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tsaleh/vim-align'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'msanders/cocoa.vim'
Bundle 'sorin-ionescu/python.vim'

Bundle 'MarcWeber/vim-addon-async'
Bundle 'MarcWeber/vim-addon-completion'
Bundle 'MarcWeber/vim-addon-json-encoding'
Bundle 'MarcWeber/ensime', {'rtp': 'vim/'}
" vim-scripts repoon
Bundle 'a.vim'
Bundle 'L9'
Bundle 'Color-Sampler-Pack'
Bundle 'BusyBee'
Bundle 'cscope_macros.vim'
Bundle 'Jinja'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'git://repo.or.cz/vcscommand'
" ...

filetype plugin indent on     " required!off                                                                

"""""""""""""""""""""""""GENERAL"""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on

"read modeline at bottom of files
set modeline

"allow mouse control
set mouse=a

syntax on
set t_Co=256
"set background=dark
"let g:solarized_termcolors=16

"colorscheme solarized 
colorscheme BusyBee 

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
let mapleader=","

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
set backupdir=~/code/.tmpvim/backup
set backup
set directory=~/code/.tmpvim/swap

"""""""""""""""""""""""""""CTAGS"""""""""""""""""""""""""""""

"Tags files
"autocmd FileType java set tags+=~/.vim/tags/java_tags
"autocmd FileType python set tags+=~/.vim/tags/python_tags

"regenerate cscope
nmap <F6> :!find . -iname "*.c" -o -iname "*.cpp" -o -iname "*.cc" -o -iname "*.c++" -o -iname "*.h" -o -iname "*.hpp" -o -iname "*.java" -o -iname "*.py" -o -iname "*.scala" > cscope.files<CR>:!cscope -b<CR>:cs reset<CR><CR>

"""""""""""""""""""""""""""SNIPMATE"""""""""""""""""""""""""""""
let g:snippets_dir="~/.vim/bundle/snipmate_snippets"

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
let g:SuperTabDefaultCompletionType = 'context'

"Helps with completions not autofinishing first match
set completeopt=longest,menu,preview


"""""""""""""""""""""""""""PYTHON"""""""""""""""""""""""""""
au FileType python set omnifunc=pythoncomplete#Complete


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

"Taglist
"nnoremap <silent> <cr> :TlistToggle<CR>
"let Tlist_WinWidth=40
nnoremap <silent> <cr> :TagbarToggle<CR>
let g:tagbar_autofocus=1

noremap <silent> <C-h> :bp<CR>
noremap <silent> <C-l> :bn<CR>

"caps to escape
map! <C-j> <Esc>
map <C-j> <Esc>

"Trick if forgot to sudo
cmap w!! w !sudo tee % > /dev/null

"VCSVimDiff
nmap <silent><leader>v :VCSVimDiff<CR>

""""""""""""""""""""""""""""""NERDTree""""""""""""""""""""""""""""""

"NERDTree Ctrl-n for nerdtree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

"change nerdtree directory to directory containing current file Ctr-d goto dir
nnoremap <silent> <C-d> :NERDTree %:h<CR>

"ignore files
let NERDTreeIgnore=['\.pyc$', '\~$']

""""""""""""""""""""""""""""""AcK""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
if !empty(matchstr(hostname(), "ebox"))
    let g:ackprg="ack -H --nocolor --nogroup --column"
endif

"""""""""""""""""""""""""""""""PROJECT SPECFIC FUNCTIONS""""""""""""""""""""""""""""""

"default code directory
let s:codedir = "~/code"

if !empty(matchstr(hostname(), "eric"))
    let s:codedir = "/usr/local/code"
endif

function! SparkleSetup()
    "add cscope db also prepend source paths, cscope can't handle relative
    "paths

    cscope add /usr/local/code/sparkle/sparkle/cscope.out                         /usr/local/code/sparkle/sparkle
    cscope add /usr/local/code/sparkle/model/cscope.out                           /usr/local/code/sparkle/model
    cscope add /usr/local/code/sparkle_demo/sparkle_demo/cscope.out               /usr/local/code/sparkle_demo/sparkle_demo
    cscope add /usr/local/code/sparkle_client_java/sparkle_client_java/cscope.out /usr/local/code/sparkle_client_java/sparkle_client_java

    cscope add /usr/local/code/db_java_1.14/cscope.out                            /usr/local/code/db_java_1.14/
    cscope add /usr/local/code/factory_java_1.7/cscope.out                        /usr/local/code/factory_java_1.7/
    cscope add /usr/local/code/logging_java/cscope.out                            /usr/local/code/logging_java/
    cscope add /usr/local/code/mobile_account/cscope.out                          /usr/local/code/mobile_account/
    cscope add /usr/local/code/rest_java/cscope.out                               /usr/local/code/rest_java/
    cscope add /usr/local/code/sms_java_1.9/cscope.out                            /usr/local/code/sms_java_1.9/
    cscope add /usr/local/code/web_java/cscope.out                                /usr/local/code/web_java/
    cscope add /usr/local/code/ws_java_1.4/cscope.out                             /usr/local/code/ws_java_1.4/
    cscope add /usr/local/code/c2dm/cscope.out                                    /usr/local/code/c2dm/
    cscope add /usr/local/code/cache_java/cscope.out                              /usr/local/code/cache_java/
    
    cscope add /usr/local/code/spring-framework-3.0.5.RELEASE/src/cscope.out      /usr/local/code/spring-framework-3.0.5.RELEASE/src/
endfunction

function! SparkleClientSetup()
    "add cscope db also prepend source paths, cscope can't handle relative
    "paths

    cscope add /usr/local/code/sparkle_client_java/cscope.out /usr/local/code/sparkle_client_java/
    cscope add /usr/local/code/web_java_1.16/cscope.out       /usr/local/code/web_java_1.16/
endfunction

function! PolyOmniSetup()
    cscope add /usr/local/Cellar/box2d/2.1.2/cscope.out /usr/local/Cellar/box2d/2.1.2 
endfunction

" Sparkle call
if !empty(matchstr($PWD, "sparkle[^_]"))
    "load files if path contains sparkle_demo
    call SparkleSetup()
endif

" Sparkle_demo call
if !empty(matchstr($PWD, "sparkle_demo"))
    "load files if path contains sparkle_demo
    call SparkleSetup()
endif

" Sparkle_client_java 
if !empty(matchstr($PWD, "sparkle_client_java"))
    "load files if path contains sparkle_demo
    call SparkleClientSetup()
endif

"PolyOmni 
if !empty(matchstr($PWD, "polyomni"))
    call PolyOmniSetup()
endif
