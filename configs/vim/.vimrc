" -------------- Plugins config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'w0rp/ale'
Plugin 'valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'taketwo/vim-ros'

Plugin 'surround.vim'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'yggdroot/indentline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'raimondi/delimitmate'
Plugin 'bronson/vim-trailing-whitespace'

Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'konfekt/fastfold'
Plugin 'tmhedberg/simpylfold'
Plugin 'danro/rename.vim'

Plugin 'dikiaap/minimalist'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'

filetype plugin indent on

" -------------- UltiSnip config
set runtimepath+=~/.vim/my-snippets
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" -------------- NERD Tree config
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
" set t_Co=256
syntax enable
" set background=light
" let g:solarized_termcolors=256
" colorscheme solarized
colorscheme minimalist

" -------------- Airline status bar config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'
let g:bufferline_echo = 0

" -------------- Fugitive config
set diffopt+=vertical

" -------------- Git gutter config
set updatetime=100 " Reduce vim update time to make the diff gutter apear/update faster

" -------------- Indentation guide config
let g:indent_guides_enable_on_vim_startup = 1
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
" highlight SpecialKey ctermbg=DarkMagenta
set formatoptions=coql

" -------------- Folding config
au BufRead * normal zR

" -------------- Window splitting behaviour
set splitbelow
set splitright

" -------------- Editor config
set number
set listchars=tab:>-,trail:~
set colorcolumn=80
set cursorcolumn
set cursorline
highlight ColorColumn ctermbg=LightGrey guibg=lightgrey
autocmd FileType c,cpp,python,roslaunch,vim autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd VimResized * wincmd =

" -------------- Filetype matching
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.urdf,*.world,*.sdf set filetype=xml
autocmd BufNewFile,BufReadPost *.launch set filetype=roslaunch

" -------------- YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" -------------- Airline status bar config
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = -1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" -------------- CtrlP config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <Leader>rp2 :echo system('python2 "' . expand('%') . '"')<cr>
nnoremap <Leader>rp3 :echo system('python3 "' . expand('%') . '"')<cr>
nnoremap <Leader>rb :echo system('bash "' . expand('%') . '"')<cr>

let g:ctrlp_max_depth = 40

set ttimeoutlen=50 " Make airline mode update faster

" File diff mappings
nnoremap <Leader>wt :windo diffthis<cr>
nnoremap <Leader>wo :windo diffoff<cr>

" Buffer navigation mappings
nnoremap <Tab> :bnext<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>
