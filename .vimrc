" Vundle Specific Options
filetype off         			    " Required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim	" Add vundle to the RuntimePath
call vundle#begin()


"Vundle Plugins
Plugin 'ajh17/VimCompletesMe'
Plugin 'felixhummel/setcolors.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-ragtag'
Plugin 'vim-scripts/closetag.vim'
Plugin 'vim-scripts/IndentAnything'
Plugin 'vim-scripts/SearchComplete'
Plugin 'itchyny/lightline.vim'        " https://github.com/itchyny/lightline.vim
Plugin 'VundleVim/Vundle.vim'
Plugin 'Align'

"File-type specific plugins
Plugin 'iamcco/markdown-preview.nvim' "run in vim after install :call mkdp#util#install()
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-python/python-syntax'
Plugin 'chase/vim-ansible-yaml'
Plugin 'darfink/vim-plist'
Plugin 'elzr/vim-json'
Plugin 'mrk21/yaml-vim'
Plugin 'sukima/xmledit'
call vundle#end()

"itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'seoul256'
      \ }

"iamcco/markdown-preview.nvim
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_page_title = ''
let g:mkdp_markdown_css='/home/knox/Drive/Programming/Markdown/github-markdown.css'

"plasticboy/vim-markdown
autocmd FileType markdown let b:sleuth_automatic=0
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR

" mrk21/yaml-vim
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"Syntax highlighting
syntax enable
let python_highlight_all=1
let python_highlight_file_headers_as_comments=1

"Autocomplete settings
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


"General Settings
colorscheme antares
set autoread				   " Automatically reload file on changes
set backspace=indent,eol,start " Sets backspace to delete
set clipboard=unnamed
set cul                        " highlights current line
set encoding=utf8
set ff=unix
set guifont=DejaVu\ Sans\ Mono:h12
set hidden                      " Something about hiding buffers"
set history=1000                " show n # of lines of history
set hlsearch                    " highlight search item
set ignorecase                  " ignores case
set incsearch                   " hihglights as you type an expression
set modelines=0                 " Some sort of security setting
set modifiable                  " Allows buffer to be edited, needed for NERDtree specifically
set nobackup
set noerrorbells
set noswapfile                  " Disables the creation of swp files"
set novisualbell
set nowb
set nowrap
set number 			           " numbered lines
set pastetoggle=<C-t>          " Toggle paste indentation
set ruler                      " shows ruler (width and column)
set showmatch
set showmode
set smartcase                   " knows when to not ignore case
set t_Co=256
set tabstop=4                   " Set tab width of 2 spaces
set ttyfast
set virtualedit=onemore         " allow for cursor beyond last character
set nofoldenable                " disable folding
"set spell spelllang=en_us		" turn on spellcheck
set spellfile=~/.vim/spell/en.utf-8.add

"Command Aliases
:command Wq wq
:command WQ wq
:command W w
:command Q q
:command Bundleupdate BundleUpdate

"Filetype specific options
filetype plugin indent on       

"Highlight specific options
hi Visual term=none cterm=none ctermbg=LightGrey
hi Search term=reverse ctermbg=8 guibg=LightGrey
hi Pmenu ctermfg=0 ctermbg=117

"NerdTree specific options
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>   " Toggle NerdTree with Control n

"Statusline tweaks
set laststatus=2
"set statusline=%F%m%r%h%w\ [%{&ff}]\%=\[POS=%v,%l,%L]\[%p%%]

"Disable tmux status bar when vim is open
autocmd VimEnter,VimLeave * silent !tmux set status
