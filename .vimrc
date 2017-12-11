source $HOME/.vim/env_setup.vim
source $HOME/.vim/common_key_bindings.vim
source $HOME/.vim/plugins.vim

if filereadable($HOME."/.vim/local.vim")
    source $HOME/.vim/local.vim
endif
