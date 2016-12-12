"""""""""""""""""""""""""""MARKDOWN"""""""""""""""""""""""""""
au FileType mkd setlocal formatoptions=1 
au FileType mkd setlocal spell spelllang=en_us 
au FileType mkd set formatprg=par
au FileType mkd setlocal linebreak 
au FileType mkd setlocal textwidth=75

"""""""""""""""""""""""""""PYTHON"""""""""""""""""""""""""""
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set autoindent
au FileType python set setlocal shiftwidth=2 
au FileType python set setlocal tabstop=2
au FileType python set setlocal nonumber

"""""""""""""""""""""""""""COFFEESCRIPT"""""""""""""""""""""""""""
au FileType coffee,jade setlocal shiftwidth=2
au FileType coffee,jade setlocal tabstop=2
"""""""""""""""""""""""""""YAML"""""""""""""""""""""""""""
au FileType yaml setlocal shiftwidth=2
au FileType yaml setlocal tabstop=2

"""""""""""""""""""""""""""CLOJURE"""""""""""""""""""""""""""
let vimclojure#HighlightBuiltins=1 
let vimclojure#ParenRainbow=1
""""""""""""""""""""""""""GOLANG"""""""""""""""""""""""""""""
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:go_fmt_command = "goimports"

""""""""""""""""""""""""""OTHERS"""""""""""""""""""""""""""""
" groovy syntax for gradle
au BufNewFile,BufRead *.groovy,*.gradle setf groovy
