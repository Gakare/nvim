let PHP_htmlInStrings = 1
let PHP_oldStyle = 0
let PHP_parent_error_close = 1
let PHP_parent_error_open = 1
let PHP_sql_query = 1

"These two commands have me messing around with my <CR>, maybe I can fix it
"someday
let PHP_default_indenting = 0
"autocmd Filetype * setlocal autoindent

"Using https://kushellig.de/neovim-php-ide/ to make this php autocompletion
"augroup ncm2
"    au!
"    autocmd BufEnter * call ncm2#enable_for_buffer()
"    au User Ncm2PopupOpen set completeopt=noinsert, menuone, noselect
"    au User Ncm2PopupClose set completeopt=menuone
"augroup END

" parameter expansion for selected entry via Enter
"inoremp <silent> <expr> <CR> (pumvisible() ? ncm2_ultisninsn
nnoremap <buffer> <C-i> m1<cmd>set ft=html<cr>gg=G<cmd>set ft=php<cr>`1
