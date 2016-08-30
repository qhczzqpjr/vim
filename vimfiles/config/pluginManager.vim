" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 set runtimepath^=./vimfiles/bundle/neobundle.vim/
 
 call neobundle#begin(expand('./vimfiles/bundle/'))

 NeoBundleFetch 'Shougo/neobundle.vim'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'low-ghost/nerdtree-fugitive'
 "NeoBundle 'Xuyuanp/nerdtree-git-plugin'
 NeoBundle 'lokaltog/vim-powerline'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'vim-scripts/Gundo'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'altercation/vim-colors-solarized'
 NeoBundle 'nathanaelkane/vim-indent-guides'
 NeoBundle 'bronson/vim-trailing-whitespace'
 NeoBundle 'kien/rainbow_parentheses.vim'
 NeoBundle 'nathanaelkane/vim-indent-guides'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundle 'Raimondi/delimitMate'
 NeoBundle 'godlygeek/tabular'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'valloric/youcompleteme'
 NeoBundle 'ervandew/supertab'
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'honza/vim-snippets'
 NeoBundle 'SirVer/ultisnips'
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'TaskList.vim'
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'vimwiki/vimwiki'
 NeoBundle 'christoomey/vim-tmux-navigator'

 call neobundle#end()

 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
