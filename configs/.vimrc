set number
colorscheme ron
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
highlight SpecialKey ctermbg=DarkMagenta
set listchars=tab:>-,trail:~
set list
set autoread
set colorcolumn=80
highlight ColorColumn ctermbg=LightGrey guibg=lightgrey
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.launch,*.urdf,*.world,*.sdf set filetype=xml
