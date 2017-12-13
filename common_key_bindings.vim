
" Выход из режима редактирования по jj
inoremap jj <Esc>l
cnoremap jj <CR> 

map <S-j> 13j
map <S-k> 13k

" move lines up and down
nnoremap <c-j> :m .+1<cr>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"move the windows with keys
if bufwinnr(1)
  "noremap <Up> <C-W>-
  "noremap <Down> <C-W>+
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

" Сохранить файл
imap <F2> <Esc><F2>a
map <F2> :w<CR>
"Next tab
map <F3> :bp<cr>
imap <F3> <Esc> :bp <cr>
autocmd FileType nerdtree map <buffer> <F3> <nop>
autocmd FileType nerdtree map <buffer> <F4> <nop>
"Prew tab
map <F4> :bn<cr>
imap <F4> <Esc> :bn<cr>
" Повторить последнюю команду
imap <F5> <Esc><F5>
map <F5> :w<CR>:!!<CR>
"Close other tabs
source $HOME/.vim/BufOnly.vim
map <F7> :BufOnly<CR>
"Close vim
imap <F10> <Esc> :qa<CR>
map <F10> :qa<CR>
map <ESC><ESC> : nohlsearch<CR>
map <CR> o<esc>

source $HOME/.vim/BClose.vim
nnoremap <C-c> :Bclose<CR>
autocmd FileType nerdtree map <buffer> <C-c> <nop>


