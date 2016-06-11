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
Bundle "MarcWeber/ultisnips"
Bundle "jpalardy/vim-slime"

Bundle "garbas/vim-snipmate"
"
" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'tsaleh/vim-align'
"Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'cespare/vim-toml'

" CoVim Collaborative editor
"Bundle 'FredKSchott/CoVim'
" YouCompleteMe code completion
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'Floobits/floobits-vim'

"Bundle 'MarcWeber/vim-addon-async'
"Bundle 'MarcWeber/vim-addon-completion'
"Bundle 'MarcWeber/vim-addon-json-encoding'
"Bundle 'MarcWeber/ensime', {'rtp': 'vim/'}

" vim-scripts repoon
"Bundle 'Color-Sampler-Pack'
"Bundle 'BusyBee'
"Bundle 'cscope_macros.vim'
" non github repos
"Bundle 'git://repo.or.cz/vcscommand'
" coffeescript and node
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
"
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-scripts/ZoomWin'
Bundle 'ctrlp.vim'
" bundles for mohit
Bundle 'altercation/vim-colors-solarized'
Bundle 'plasticboy/vim-markdown'
Bundle 'Jinja'
Bundle 'Lokaltog/vim-powerline'
" WriteRoom for vim 
"Bundle 'mikewest/vimroom' 
"Bundle 't9md/vim-chef'
"Bundle 'klen/python-mode.git'
" Python autocomplete
"Bundle 'davidhalter/jedi-vim'
Bundle 'sjl/gundo.vim'
" git
Bundle 'tpope/vim-fugitive'
" github
Bundle 'mattn/gist-vim'
Bundle 'jez/vim-github-hub'
" mac clipboard
"Bundle 'kana/vim-fakeclip'
" saltstack (sls files)
Bundle 'saltstack/salt-vim'
" File types
Bundle 'csv.vim'
Bundle 'fatih/vim-go'
Bundle 'majutsushi/tagbar'

" Typescript  
" syntax highlighting
Bundle 'leafgarland/typescript-vim'


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
