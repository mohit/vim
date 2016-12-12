set nocompatible
filetype off

" let plug be the vundle
call plug#begin('~/.vim/bundle')

" Bundles

" File and directory support
Plug 'scrooloose/nerdtree'
Plug 'ctrlp.vim'

Plug 'majutsushi/tagbar'

" Display
Plug 'troydm/zoomwintab.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}  " for golang
Plug 'ervandew/supertab'

" Undo
Plug 'simnalamburt/vim-mundo'

" edit tools
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'


" git and github
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

"""""""""languages"""""""""""
"Plug 'neomake/neomake' " linter runner

Plug 'saltstack/salt-vim' " saltstack (sls files)
Plug 'csv.vim'
Plug 'fatih/vim-go'
Plug 'vim-pandoc/vim-pandoc', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'Jinja'
" coffeescript and node
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'} " HTML explader
Plug 'leafgarland/typescript-vim' " Typescript  
Plug 'cespare/vim-toml'


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

"tab = 4 spaces "indent spaces = 2 and tab to spaces
set expandtab
set tabstop=4
set shiftwidth=2

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

"""""""""""""""""""""""""AUTOCOMPLETE"""""""""""""""""""""""
"Deoplete

let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1

" SUPERTAB

"set completion type to change based on context around it
let g:SuperTabDefaultCompletionType = "context"

"Helps with completions not autofinishing first match
set completeopt=longest,menu,preview

""""""""""""""""""""""""""""""NERDTree""""""""""""""""""""""""""""""

"ignore files
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

"""""""""""""""""""""""""""""""IMPORT ADDITIONAL CONFIG""""""""""""""""""""""""""""""

"" Include user's local vim config
if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
" Include keymappings
if filereadable(expand("~/.vim/keymaps.vim"))
  source ~/.vim/keymaps.vim
endif
" Include language specific settings
if filereadable(expand("~/.vim/language.vim"))
  source ~/.vim/language.vim
endif
