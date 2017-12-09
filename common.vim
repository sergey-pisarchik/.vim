syntax enable           " enable syntax processing
syntax on               " syntax highlighting
colorscheme slate
set expandtab           " tabs are spaces
set listchars=tab:ᐉ➛,trail:.,extends:.,precedes:.,space:.
set list
set number              " show line numbers

map <F3> :bp<cr>
imap <F3> <Esc> :bp <cr>
map <F4> :bn<cr>
imap <F4> <Esc> :bn<cr>

" Выход из режима редактирования по jj
inoremap jj <Esc>l
cnoremap jj <CR> 

map <C-j> 13j
map <C-k> 13k

" Сохранить файл
imap <F2> <Esc><F2>a
map <F2> :w<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"move the windows with keys
if bufwinnr(1)
  noremap <Up> <C-W>-
  noremap <Down> <C-W>+
  noremap <Left> <C-W>>
  noremap <Right> <C-W><
endif

"search and replace
"Ищем с текущей до конца. Потом повторяем (<bar> == |) поиск (&&) с первой до предыдущей (""-)
"и в конце смещаем курсор в позицию для ввода замены
vnoremap <leader><leader> "hy:,$s/<C-r>h//gc<bar>1,''-&&<left><left><left><left><left><left><left><left><left><left><left>
vnoremap // y/<C-R>"<CR>
nnoremap <leader><leader> viw"hy:,$s/<C-r>h//gc<bar>1,''-&&<left><left><left><left><left><left><left><left><left><left><left>
nnoremap // viwyk/<C-R>"<CR>

imap <F10> <Esc> :qa<CR>
map <F10> :qa<CR>
map <ESC><ESC> : nohlsearch<CR>

map <CR> o<esc>




