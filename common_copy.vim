
filetype indent on      " load filetype-specific indent files
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
au FileType lua setl sw=2 sts=2 et
set ruler               " show the cursor position all the time
set nocursorline        " highlight current line - если включить будут пролемы с подсветкой пробелов в текущей строке.

"set wildcharm=<C-z>
"nnoremap <leader>C :colorscheme <C-z><S-Tab>
set sessionoptions+=resize,winpos

set nocompatible              " be iMproved, required
"Код убирающий лишние табы при вставке из буфера
"========================
if !exists("g:bracketed_paste_tmux_wrap")
    let g:bracketed_paste_tmux_wrap = 1
endif

let &t_ti .= "\<Esc>[?2004h"
let &t_te .= "\<Esc>[?2004l"

function! XTermPasteBegin(ret)
    set pastetoggle=<f29>
    set paste
    return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>
"========================



"filetype on                             " Включаем распознавание типов файлов и типо-специфичные плагины
"filetype plugin on
"filetype indent on

"Выключаем бибиканье и мигание
set visualbell
set t_vb=

"Выключить подсветку выделения
"set nohlsearch
"nnoremap <esc> :noh<return><esc>

"set iskeyword=@,48-57,_,192-255
""set iskeyword+=-
"set iskeyword-="



"Hightlighting
"set cursorline
"set cursorcolumn
"hi CursorLine ctermbg=Black cterm=none
"hi CursorColumn ctermbg=Black cterm=none
"hi Comment ctermfg=13
"hi LineNr ctermfg=Yellow

"Tabulation settings
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

"set completeopt=longest,menuone
"переключение между автокомплитом по tab
"function! InsertTabWrapper(direction)
    "let col = col('.') - 1
    "if !col || getline('.')[col - 1] !~ '\k'
        "return "\<tab>"
    "elseif "backward" == a:direction
        "return "\<c-p>"
    "else
        "return "\<c-n>"
    "endif
"endfunction

"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"set encoding=utf-8                                  " set charset translation encoding
"set termencoding=utf-8                              " set terminal encoding
"set fileencoding=utf-8                              " set save encoding
"set fileencodings=utf8,koi8r,cp1251,cp866,ucs-2le   " список предполагаемых кодировок, в порядке предпочтения

"menu Encoding.koi8-r  :e ++enc=koi8-r<CR>
"menu Encoding.cp1251  :e ++enc=cp1251<CR>
"menu Encoding.cp866   :e ++enc=cp866<CR>
"menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
"menu Encoding.utf-8   :e ++enc=utf-8<CR>
"map <s-F12> :emenu Encoding.<Tab>


" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start



set laststatus=2
"set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]









"map <F5> :w<CR> :!sh -xc "cd '%:p:h' && th '%:t'"<CR>





syntax enable
"
"set t_Co=256
"set term=xterm-256color
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

"""""""
"Отключаем стрелки во всех режимах
"Отключаем тулбар
"Отключаем меню
"Отключаем поддержку мыши
"for prefix in ['i', 'n', 'v']
    "for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        "exe prefix . "noremap " . key . " <Nop>"
    "endfor
"endfor

"set guioptions-=T
"set guioptions-=m
"set mouse=
"""""""

"Настроить перемещение курсора по файлу с длинными строками
"nmap j gj
"nmap k gk



"Вызываем встроенный файловый менеджер по F8
"map <silent> <F8>   :Explore<CR>
"
"map <silent> <S-F8> :sp +Explore<CR>

"let mapleader = ","

"На сервере иногда не работает удаление с помощью backspace, фикс:
"backspace обрабатывает отступы, концы строк
set backspace=indent,eol,start






"To ignore plugin indent changes, instead use: filetype plugin on
"
"Brief help
":PluginList       - lists configured plugins
":PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line


"Как вы знаете, если файл модифицирован, команды :bn, :bp, b# не сработают и выведут предупреждение о том, что надо его сохранить. Для этого мы и пишем эту функцию, в которой осуществляется проверка, модифицирован ли файл и может ли он быть модифицирован вообще.
"Здесь мы создаем функцию, аргумент которой примет как раз те команды по переключению буферов, описанный выше.
"nnoremap создает привязку определенной комбинации клавиш для какого либо действия. Аргумент \<silent\> — подавить echo вывод.

"function! ChangeBuf(cmd)
    "if (&modified && &modifiable)
        "execute ":w"
    "endif
    "execute a:cmd
"endfunction
"nnoremap <silent> <C-n> :call ChangeBuf(":bn")<CR>
"nnoremap <silent> <C-p> :call ChangeBuf(":bp")<CR>

"Автоматически перечитывать конфигурацию VIM после сохранения
"autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"включить подсветку
"set list
"установить символы, которыми будет осуществляться подсветка
"set listchars=tab:>-,trail:-
"Проблема красного на красном при spellchecking-е решается такой строкой в .vimrc
"highlight SpellBad ctermfg=Black ctermbg=Red




"set t_Co=256

"This command tries to perform the "most sensible" GoTo operation it can. Currently, this means that it tries to look up the symbol under the cursor and jumps to its definition if possible; if the definition is not accessible from the current translation unit, jumps to the symbol's declaration. For C#, implementations are also considered and preferred.
"nnoremap <leader>jd :YcmCompleter GoTo<CR>

"Those mappings use the easily-reached "t" key in combination with the well
"known "hjkl" navigation keys in normal mode that move the cursor left, down,
"up or right. 'tj' moves to the next tab, 'tk' moves to the previous tabpage
"while 'th' and 'tl' move to the leftmost/rightmost tabpage.
"nnoremap th :tabfirst<CR>
"nnoremap tj :tabnext<CR>
"nnoremap tk :tabprev<CR>
"nnoremap tl :tablast<CR>
"nnoremap td :tabclose<CR>

" Long line
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

"imap <F8> <Esc><F8>
"map <F8> :!"%:p:r"<CR>

"imap <F9> <Esc><F9>
"map <F9> :w<CR>:!rm -f "%:p:r" && g++ -Wno-unused-result -DLOCAL -Wall -O2 -std=c++11 -I $HOME/lib/include -o "%:p:r" "%:p"<CR>

"imap <F10> <Esc><F10>
"map <F10> :w<CR>:make<CR>

"autocmd BufNewFile *.py call WritePyinit()
"Все просто. Если у Вас новый файл *.py, в него будет добавлен стандартный код.
"Функция ниже смотрим в специальной папке файл с таким же расширение, и если
"он есть, то вставляет его во только что созданный
"function! InitFileByExtension()
    "silent! read !cat $HOME/documents/templates/*.%:e 2>/dev/null
    "silent! 1delete
"endfunction
"autocmd BufNewFile *.* call InitFileByExtension()

"function! SwitchSourceHeader()
    "if (expand ("%:e") == "cpp")
        "sf %:r.h
        "return
    "endif
    "if (expand ("%:e") == "h")
        "sf %:r.cpp
        "return
    "endif
"endfunction
"nmap ,h :call SwitchSourceHeader()<CR>

"set exrc
"set secure

"au FileType ftl map <F8> :!fmpp -s "%" -o "%:p.output"<CR>
"au FileType lua setl sw=2 sts=2 et
"au BufRead,BufNewFile *.ftl set filetype=ftl




