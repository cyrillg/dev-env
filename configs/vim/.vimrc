" File ~/.vimrc
" Global settings for all files (but may be overridden in ftplugin).
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'surround.vim'
Plugin 'honza/vim-snippets'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'raimondi/delimitmate'

Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'dikiaap/minimalist'
Plugin 'vim-airline/vim-airline-themes'

filetype plugin indent on

" --------------  NERD Tree config
" Automatically spawns NERD tree when opening Vim
" autocmd vimenter * NERDTree
" Toggle NERDTree with ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Focus on previously selected pane instead of NERDTree
autocmd VimEnter * wincmd p
" Automatically close Vim if only remaining window is NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" --------------  NERD Commenter config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" -------------- Color scheme config
set t_Co=256
syntax on
colorscheme minimalist

" -------------- Airline status bar config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'angr'

" -------------- Git gutter config
set updatetime=100 " Reduce vim update time to make the diff gutter apear/update faster

" -------------- Indentation config
let g:indent_guides_enable_on_vim_startup = 1
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
highlight SpecialKey ctermbg=DarkMagenta

set listchars=tab:>-,trail:~
set formatoptions=coql
set colorcolumn=80
set cursorcolumn
set cursorline
highlight ColorColumn ctermbg=LightGrey guibg=lightgrey
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.launch,*.urdf,*.world,*.sdf set filetype=xml

