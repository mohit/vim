"""""""PATHOGEN INITIALIZATION"""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc() 
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles :
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

Bundle "garbas/vim-snipmate"
"
" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tsaleh/vim-align'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
"Bundle 'msanders/cocoa.vim'
"Bundle 'riobard/scala.vim'
"Bundle 'Rip-Rip/clang_complete'

"Bundle 'MarcWeber/vim-addon-async'
"Bundle 'MarcWeber/vim-addon-completion'
"Bundle 'MarcWeber/vim-addon-json-encoding'
"Bundle 'MarcWeber/ensime', {'rtp': 'vim/'}

" vim-scripts repoon
Bundle 'a.vim'
Bundle 'L9'
Bundle 'Color-Sampler-Pack'
Bundle 'BusyBee'
Bundle 'cscope_macros.vim'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'git://repo.or.cz/vcscommand'
" ...

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
set tabstop=3
set shiftwidth=3

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

"""""""""""""""""""""""""""SNIPMATE"""""""""""""""""""""""""""""
let gsnippets_dir="~/.vim/bundle/snipmate-snippets"

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

"Taglist
"nnoremap <silent> <cr> :TlistToggle<CR>
"let Tlist_WinWidth=40
nnoremap <silent> <leader><CR> :TagbarToggle<CR>
let g:tagbar_autofocus=1

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

function! AntSingle()
    "change ant single to current file
    ! python ~/code/eric/scripts/change_ant_single.py %:p
    ! ant single
endfunction

function! SparkleSetup()
    "add cscope db also prepend source paths, cscope can't handle relative
    "paths

    cscope add /home/mohit/code/sparkle/sparkle/cscope.out                         /home/mohit/code/sparkle/sparkle
    cscope add /home/mohit/code/sparkle/model/cscope.out                           /home/mohit/code/sparkle/model
    cscope add /home/mohit/code/sparkle/common/cscope.out                          /home/mohit/code/sparkle/common
    cscope add /home/mohit/code/sparkle/invitation_service/cscope.out              /home/mohit/code/sparkle/invitation_service
    cscope add /home/mohit/code/sparkle/smsrouter/cscope.out                       /home/mohit/code/sparkle/smsrouter
    cscope add /home/mohit/code/sparkle_demo/cscope.out                            /home/mohit/code/sparkle_demo
    cscope add /home/mohit/code/sparkle_client_java/sparkle_client_java/cscope.out /home/mohit/code/sparkle_client_java/sparkle_client_java

    cscope add /home/mohit/code/db_java/cscope.out                                 /home/mohit/code/db_java/
    cscope add /home/mohit/code/factory_java_1.7/cscope.out                        /home/mohit/code/factory_java_1.7/
    cscope add /home/mohit/code/logging_java/cscope.out                            /home/mohit/code/logging_java/
    cscope add /home/mohit/code/mobile_account/cscope.out                          /home/mohit/code/mobile_account/
    cscope add /home/mohit/code/rest_java/cscope.out                               /home/mohit/code/rest_java/
    cscope add /home/mohit/code/sms_java_1.9/cscope.out                            /home/mohit/code/sms_java_1.9/
    cscope add /home/mohit/code/web_java/cscope.out                                /home/mohit/code/web_java/
    cscope add /home/mohit/code/ws_java_1.4/cscope.out                             /home/mohit/code/ws_java_1.4/
    cscope add /home/mohit/code/c2dm/cscope.out                                    /home/mohit/code/c2dm/
    cscope add /home/mohit/code/cache_java/cscope.out                              /home/mohit/code/cache_java/
    cscope add /home/mohit/code/oauth_java/cscope.out                              /home/mohit/code/oauth_java/
    cscope add /home/mohit/code/redis_java/cscope.out                              /home/mohit/code/redis_java/
    cscope add /home/mohit/code/schedule_java/cscope.out                           /home/mohit/code/schedule_java/
    
    cscope add /home/mohit/code/spring-framework-3.0.5.RELEASE/src/cscope.out      /home/mohit/code/spring-framework-3.0.5.RELEASE/src/
endfunction

function! SparkleClientSetup()
    "add cscope db also prepend source paths, cscope can't handle relative
    "paths

    cscope add /home/mohit/code/sparkle_client_java/cscope.out /home/mohit/code/sparkle_client_java/
    cscope add /home/mohit/code/web_java_1.16/cscope.out       /home/mohit/code/web_java_1.16/
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

" Include user's local vim config
if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
