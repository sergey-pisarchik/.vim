
filetype indent on      " load filetype-specific indent files


set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
au FileType lua setl sw=2 sts=2 et

set showcmd             " show (partial) command in status line
set ruler	        	" show the cursor position all the time
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line - если включить будут пролемы с подсветкой пробелов в текущей строке.
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set hidden              " Возможность переключаться(?) при несохраненных изменениях
set noswapfile
set nowrap
set wildmode=longest:list
"set clipboard=unnamed
"set wildcharm=<C-z>
"nnoremap <leader>C :colorscheme <C-z><S-Tab>
set sessionoptions+=resize,winpos
set history=5000		" keep 50 lines of command line history
"Включить автоотступы для новых строк
set ai
"Перечитывать открытые файлы если они были изменены извне
set autoread
set autowrite

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
"Использовать инкрементальный поиск
set incsearch
"Регистронезависимый поиск
set ignorecase
"Игнорировать регистр при поиске, если в искомом выражении нет символов верхнего регистра
set smartcase

"set iskeyword=@,48-57,_,192-255
""set iskeyword+=-
"set iskeyword-="

"Перенос по словам, а не по буквам
set linebreak
set dy=lastline


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

if argc() == 0
  autocmd VimEnter * :source ~/tmp/session.vim
endif
autocmd VimEnter * NERDTreeTabsToggle
autocmd VimEnter * wincmd l
"autocmd VimEnter * :source ~/.vimrc 
autocmd VimEnter * NERDTreeFind
autocmd VimEnter * wincmd l

autocmd VimLeave * NERDTreeTabsClose
autocmd VimLeave * :mksession! ~/tmp/session.vim





map <F7> :BufOnly<CR>
"map <F5> :w<CR> :!sh -xc "cd '%:p:h' && th '%:t'"<CR>
autocmd FileType nerdtree map <buffer> <F3> <nop>
autocmd FileType nerdtree map <buffer> <F4> <nop>

" move lines up and down
nnoremap <c-j> :m .+1<cr>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


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


" Повторить последнюю команду
imap <F5> <Esc><F5>
map <F5> :w<CR>:!!<CR>

"Вызываем встроенный файловый менеджер по F8
"map <silent> <F8>   :Explore<CR>
"
"map <silent> <S-F8> :sp +Explore<CR>

"let mapleader = ","

"На сервере иногда не работает удаление с помощью backspace, фикс:
"backspace обрабатывает отступы, концы строк
set backspace=indent,eol,start

"Данный кусок кода включает весьма полезные возможности, доступные начиная с версии 7.00: после того, как вы закрываете редактор(а если точнее, то текущий буффер), в предыдущих версиях история UNDO-REDO терялась. Начиная же с 7.00 появилась возможность записи этой истории в служебные файлы по каждому ранее открытому буфферу.
"То есть теперь вы можете сменить буффер, закрыть окно, вообще выключить редактор, но открыв заново какой-либо файл, история Ваших изменений восстановится.
if version >= 700
    execute ':silent !mkdir -p ~/.vim/undodir/'
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undolevels=1000
    set undoreload=10000
endif




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


" ===================================================
" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>

nnoremap <C-c> :Bclose<CR>
autocmd FileType nerdtree map <buffer> <C-c> <nop>

"===========================================================================

" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer] 
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction

"===========================================================================


