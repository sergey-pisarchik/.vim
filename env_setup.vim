syntax enable           " enable syntax processing
set encoding=utf-8
syntax on               " syntax highlighting
colorscheme slate
set t_Co=256            " Без этого не работают некоторые цвета
set expandtab           " tabs are spaces
"set verbosefile=~/vim_verbose.txt
"set verbose=15
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
filetype plugin indent on "enable indentation based on filetype. Files stored in .vim/after/ftplugin/*.vim
set listchars=tab:ᐉ➛,trail:.,extends:.,precedes:.,space:.
set list
set number              " show line numbers
set showcmd             " show (partial) current vim command in status line
set wildmenu            " visual autocomplete for command menu
set wildmode=longest:list
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set hidden              " Возможность переключаться(?) при несохраненных изменениях
set noswapfile
set nowrap              " No wraps the lines
set history=5000        " keep 50 lines of command line history
set autoread            "Перечитывать открытые файлы если они были изменены извне
set autowriteall
set ai                  "Включить автоотступы для новых строк
set incsearch           "Использовать инкрементальный поиск
set ignorecase          "Регистронезависимый поиск
set smartcase           "Игнорировать регистр при поиске, если в искомом выражении нет символов верхнего регистра
"Перенос по словам, а не по буквам
set linebreak
set dy=lastline
"Make backspace work like most other programs
set backspace=2 
set backspace=indent,eol,start
set completeopt-=preview
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
"===========================================================
"Initialization of session
"===========================================================

"Reread saved session
if argc() == 0
  autocmd VimEnter * :source ~/tmp/session.vim
endif

"Open NerdTree
autocmd VimEnter * NERDTreeTabsToggle
autocmd VimEnter * wincmd l
autocmd VimEnter * NERDTreeFind
autocmd VimEnter * wincmd l
autocmd VimEnter * AirlineTheme dark "Почему-то нужно каждый раз в начале вызывать 
"установку темы. Иначе не подсвечиваются закладки


autocmd VimLeave * NERDTreeTabsClose
autocmd VimLeave * :mksession! ~/tmp/session.vim


"Данный кусок кода включает весьма полезные возможности, доступные начиная 
"с версии 7.00: после того, как вы закрываете редактор(а если точнее, то
"текущий буффер), в предыдущих версиях история UNDO-REDO терялась. Начиная 
"же с 7.00 появилась возможность записи этой истории в служебные файлы по
"каждому ранее открытому буфферу.
"То есть теперь вы можете сменить буффер, закрыть окно, вообще выключить 
"редактор, но открыв заново какой-либо файл, история Ваших изменений 
"восстановится.
if version >= 700
  execute ':silent !mkdir -p ~/.vim/undodir/'
  set history=64
  set undolevels=128
  set undodir=$HOME/.vim/undodir
  set undolevels=1000
  set undoreload=10000
  set undofile
endif

