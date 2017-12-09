syntax enable           " enable syntax processing

map <F3> :bp<cr>
imap <F3> <Esc> :bp <cr>
map <F4> :bn<cr>
imap <F4> <Esc> :bn<cr>


" Выход из режима редактирования по jj
inoremap jj <Esc>l
cnoremap jj <CR> 

" Сохранить файл
imap <F2> <Esc><F2>a
map <F2> :w<CR>
