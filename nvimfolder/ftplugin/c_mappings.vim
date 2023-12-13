set nowrap

nnoremap <buffer> <leader>74 <cmd>set cc=74<CR>

nnoremap <buffer> <leader>gcc m1<cmd>w<CR><bar><cmd>cd %:p:h<CR><bar><cmd>!g++ -pedantic -Wall -Werror %<CR>
