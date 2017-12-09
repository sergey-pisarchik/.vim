
filetype off                  " required
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim


filetype plugin on
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"The following are examples of different formats supported.
"Keep Plugin commands between vundle#begin/end.
"plugin on GitHub repo

"http://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
"Plugin 'christoomey/vim-tmux-navigator'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" NERDTree
Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
map <C-n> :NERDTreeTabsToggle<CR>
"let g:NERDTreeMapOpenInTab = "tt"
let g:NERDTreeIgnore = ['\.pyc$', '\.o$']
"let g:NERDTreeMapNextHunk = ",n"
"let g:NERDTreeMapPrevHunk = ",p"
let g:NERDTreeWinPos = "left"
"let g:nerdtree_tabs_open_on_gui_startup=1
"autocmd BufEnter * lcd %:p:h
"navigate to file in nerd tree
map <leader>r :NERDTreeFind<cr>zz
autocmd FileType nerdtree nmap <buffer> <CR> go


" for tags from https://habrahabr.ru/post/265635/ 
"Plugin 'szw/vim-tags'

" for spellcheck, i think this disable default and enable when need
"Plugin 'scrooloose/syntastic'
" Посмотреть потом

" html and css
"Plugin 'mattn/emmet-vim'

" python
"Plugin 'davidhalter/jedi-vim'

" interactive python
"Plugin 'ivanov/vim-ipython'
"let g:ipy_perform_mappings=0

" markdown
" Plugin 'godlygeek/tabular' "Можно выравнивать такест по вертикали, рапример по = или по :
" Plugin 'plasticboy/vim-markdown' не понял что такое - чтото для html

" markdown preview  - все что ты делаешь, сразу отображается в браузере
"Plugin 'JamshedVesuna/vim-markdown-preview'
"let vim_markdown_preview_browser='Safari'
"let vim_markdown_preview_hotkey='<C-m>'

" Git
"Plugin 'airblade/vim-gitgutter'

" hotcommand
"Plugin 'tpope/vim-fugitive'
"set diffopt=vertical

" Schema color - цветовая схема - попробовать включить
"Plugin 'altercation/vim-colors-solarized'

" Status line
Plugin 'vim-airline/vim-airline'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" https://github.com/Lokaltog/powerline-fonts - Еще одна статус строка- вроде
" прикльная. Можно попробовать.
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"let g:airline_powerline_fonts = 1

"Plugin 'edkolev/tmuxline.vim'

"Plugin 'jeetsukumaran/vim-buffergator'

"- Use `<Leader>b` (typically: `\b`) to open a window listing all buffers.
"In this window, you can use normal movement keys to select a buffer and then:

"- <ENTER> to edit the selected buffer in the previous window
"- <C-V> to edit the selected buffer in a new vertical split
"- <C-S> to edit the selected buffer in a new horizontal split
"- <C-T> to edit the selected buffer in a new tab page

"- Use `gb` (or <M-b>) and `gB` (or <M-S-b>) to flip through
"the most-recently used buffer stack without opening the buffer listing
""drawer".

"- Use `<Leader><LEFT>`, `<Leader><UP>`, `<Leader><RIGHT>`, `<Leader><DOWN>` to
"split a new window left, up, right, or down, respectively, and edit the
"previous MRU buffer there.

 "автодополнение - обязательно попробовать
"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_goto_buffer_command = 'new-tab'
"let g:ycm_always_populate_location_list = 1 "let g:ycm_error_symbol = '>'
"let g:ycm_warning_symbol = '!'

" C++ highlight
"Plugin 'octol/vim-cpp-enhanced-highlight'
"let g:cpp_class_scope_highlight = 1

" golang
"Plugin 'fatih/vim-go'
"let g:go_fmt_autosave = 0
"let g:go_fmt_command = "goimports"
"let g:go_highlight_array_whitespace_error = 0

" coffee-script
"Plugin 'kchmck/vim-coffee-script'

" scala
"Plugin 'derekwyatt/vim-scala'

" f#
"Plugin 'fsharp/vim-fsharp'

" freemarker template language syntax
"Plugin 'chaquotay/ftl-vim-syntax'

" clang-format
"Plugin 'rhysd/vim-clang-format'
"let g:clang_format#code_style = "file"
"let g:clang_format#auto_format = 0
"let g:clang_format#auto_format_on_insert_leave = 1
"let g:clang_format#auto_formatexpr = 1

" tab size detector - Что-то будет кричать если проблема с табами в файле.
" Возможно даст исправить
"Plugin 'luochen1990/indent-detector.vim'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
