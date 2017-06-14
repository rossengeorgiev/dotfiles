" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" enable syntax hilighting
filetype off
filetype plugin indent on
syntax on

set background=dark
set backspace=2         " restore normal backspace behaviour
set nocompatible        " disable VI compability
set ruler               " show relative position within the buffer
set showcmd             " showcmd always
set clipboard=unnamed   " Make clipboard behave like normal
"" set mouse=a             " Enable mouse
set paste

" line numbers & length
set number
set nowrap
set tw=79
set colorcolumn=100     " hilight X column
set fo-=t               " disable auto wrap when typing
highlight ColorColumn ctermbg=233

" always use white spaces, 4 per tab
set expandtab
set tabstop=4
set shiftwidth=4

" default encoding to utf-8
set encoding=utf-8

set foldmethod=manual
set t_Co=256

" case insensitve searching
set incsearch
set ignorecase
set smartcase
set hlsearch

" disable swap and backup files
"" set nobackup
"" set nowritebackup
"" set noswapfile

" wrap block of text
map Q gq
map Q gqap

" easy paste toggle
set pastetoggle=<F6>
nmap \o :set paste!<CR>

" toggle number and wrap
nmap \l :setlocal number!<CR>
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

" clear hilighting
nmap \q :nohlsearch<CR>

" other
map <F8> :TagbarToggle<CR>

" easy indentation in visual mode
vnoremap < <gv
vnoremap > >gv

" quick save/load session
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3

" comment out lines in visual mode
" // style
vmap ,/ :s/^/\/\//<CR>:noh<CR>
vmap ,? :s/^\/\///<CR>:noh<CR>
" # style
vmap ,. :s/^/# /<CR>:noh<CR>
vmap ,> :s/^# //<CR>:noh<CR>

" Quickly get out of insert mode with no cursor movement (either use 'jj' or 'jk')
inoremap jj <Esc>`^
inoremap jk <Esc>`^

" Improve movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Ctrl+[jklm] to navigate splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" Alt+Keys to navigate splits
map <A-Down> <C-w>j
map <A-Up> <C-w>k
map <A-Right> <C-w>l
map <A-Left> <C-w>h

" Tab to navigate splits
map <Tab> <C-w>w

" switch boffers with ctrl arrows
map <C-Right> :bn<CR>
map <C-Left> :bN<CR>

" Swapover mark jumping keys
nnoremap ' `
nnoremap ` '

" I never mean to hit F1 intentionally, I always mean to hit Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


" Go to command mode with one less keystroke
nnoremap ; :

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" F5 strips trailing whitespace
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" Remove trailing whitespace
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


" =============================================================================
" Pathogen for plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()
" =============================================================================

" vim powerline - fancy status line
" git clone --depth 1 https://github.com/powerline/powerline.git
set laststatus=2
"" let g:Powerline_symbols = 'fancy'

" syntactic - syntax checking
" git clone --depth 1 https://github.com/scrooloose/syntastic.git
"" let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['python','flake8']

" ctrlp - file/folder finder
" git clone --depth 1 https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 20
set wildignore+=*.pyc
set wildignore+=*.ipynb
set wildignore+=*/dist/*
set wildignore+=*/build/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*

" NERDTree - file tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Python-mode
" git clone --depth 1 https://github.com/klen/python-mode.git

" netrw settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Move in omni pop-up with ctrl-j/k
" http://vimbits.com/bits/447

set omnifunc=syntaxcomplete#Complete
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
