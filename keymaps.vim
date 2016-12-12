"""""""""""""""""""""""""""MAPPINGS"""""""""""""""""""""""""""

"specialized leader key
let mapleader="\\"

imap jj <Esc>

"Trick if forgot to sudo
cmap w!! %!sudo tee > /dev/null %

"removes highlighting from search after space
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Shortcut to rapidly toggle `set list`
" Use the same symbols as TextMate for tabstops and EOLs
nmap <leader>c :set list!<CR>
set listchars=tab:▸\ ,eol:¬

nnoremap <leader>u :MundoToggle<CR>

" ZoomWinTab configuration
map <Leader><Leader> :ZoomWinTabToggle<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" pasting
set pastetoggle=<leader>sp


"change to next and previous buffers
noremap <silent> <C-h> :bp<CR>
noremap <silent> <C-l> :bn<CR>

"change to next quickfix error
noremap <silent><leader>h :cp<CR>
noremap <silent><leader>l :cn<CR>

"caps to escape
map! <C-j> <Esc>
map <C-j> <Esc>

"NERDTree Ctrl-n for nerdtree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeToggle<CR>

"change nerdtree directory to directory containing current file Ctr-d goto dir
nnoremap <silent> <C-d> :NERDTree %:h<CR>

