nnoremap <buffer>  <leader>lt <cmd>w<CR><bar><cmd>cd %:p:h<CR><bar><cmd>!pdflatex %<CR>

nnoremap <buffer>  <leader>xe <cmd>w<CR><bar><cmd>cd %:p:h<CR><bar><cmd>!xelatex %<CR>

"nnoremap <buffer> <leader>smt <cmd>cd ~<CR><bar><cmd>! .\AppData\Local\SumatraPDF\SumatraPDF.exe&<CR>
"not going to use it till I get why it is running SumatraPDF as the whole
"terminal instead of it being a daemon or sumthgng
set wrap

set colorcolumn = "false"
