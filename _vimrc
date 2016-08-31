" load Neobundle {{{
" source .\vimfiles\config\pluginManager.vim
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
  NeoBundle 'tsukkee/unite-help'
  NeoBundle 'sgur/unite-everything'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'ujihisa/unite-font'
  NeoBundle 'ujihisa/unite-locate'
  NeoBundle 'ujihisa/unite-launch'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'thinca/vim-unite-history'
 NeoBundle 'vim-scripts/Gundo'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
 NeoBundle 'altercation/vim-colors-solarized'
 NeoBundle 'nathanaelkane/vim-indent-guides'
 NeoBundle 'bronson/vim-trailing-whitespace'
 NeoBundle 'kien/rainbow_parentheses.vim'
 NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundle 'Raimondi/delimitMate'
 NeoBundle 'godlygeek/tabular'
 NeoBundle 'dhruvasagar/vim-table-mode'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'valloric/youcompleteme'
 "NeoBundle 'ervandew/supertab'
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'honza/vim-snippets'
 NeoBundle 'SirVer/ultisnips'
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'TaskList.vim'
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'vimwiki/vimwiki'
 NeoBundle 'fholgado/minibufexpl.vim'
 "NeoBundle 'christoomey/vim-tmux-navigator'
 "NeoBundle 'edkolev/tmuxline.vim'
 "NeoBundle 'benmills/vimux'
 "NeoBundle 'kien/ctrlp.vim'

 call neobundle#end()

 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
" }}}

source $VIMRUNTIME/mswin.vim

set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set ruler		" show the cursor position all the time
set nu "show line number
set relativenumber
set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch " highlight search result
set ignorecase

set smartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set textwidth=0
set wrapmargin=0
set formatoptions+=l
"set autochdir
set foldmethod=marker

" Set mapleader
let mapleader=","
" Support quick VIMRC edit and load
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Don't use Ex mode, use Q for formatting
map Q gq
" map <leader>cd :cd C:\Users\qz55554\Documents\Db<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" map sort function to a key
vnoremap <leader>s :sort<CR>
" format indent
vnoremap < <gv
vnoremap > >gv

" file encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Window Section {{{
" GUI controEnd
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>
" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>
" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

" }}}

" Fugitive {{{
autocmd QuickFixCmdPost *grep* cwindow
" }}}

" Nerdtree {{{
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" vim-colors-solarized {{{
syntax enable
colorscheme solarized
" set background=dark

if has('gui_running')
    set background=light
else
  set background=dark
endif
" }}}

" vim-airline {{{
let g:airline#extenions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" vim-airline_theme
let g:airline_theme='dark'
" }}}

" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}

" vim-easymotion {{{
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)
" }}}

" tagbar {{{
nmap <F8> :TagbarToggle<CR>

let g:tagbar_ctags_bin = '.\vimfiles\ctags58\ctags.exe'
"if g:system=='win'
"        let g:tagbar_ctags_bin = '.\vimfiles\ctags58\ctags.exe'
"    else
"        let g:tagbar_ctags_bin = 'ctags'
"    endif

let g:tagbar_autoclose = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
" }}}

" Unite {{{
nnoremap <C-l> : Unite file file_rec buffer everything<CR>
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>
" }}}

" Ultisnip {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}

" YouCommpleteMe {{{
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

" }}}

" Configure MiniBufExpl
map <C-m> :MBEToggle<CR> " Open MiniBufExpl with Ctrl-m
