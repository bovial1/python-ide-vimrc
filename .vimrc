" Should probably use vim-flake8 or ale, not both
" Still not sure which one I prefer. Ale does checking in real time, flake8
" when I hit F7 or on save
"
" On Centos 7, I compile vim from source
"
" yum install ncurses-devel
" wget https://github.com/vim/vim/archive/master.zip
" unzip master.zip
" cd vim-master
" cd src/
" ./configure --with-features=huge --with-python-config-dir=/usr/local/lib/python3.6/config-3.6m-x86_64-linux-gnu --enable-python3interp
" sudo make
" sudo make install DESTDIR=~/.local
" ln -s ~/.local/usr/local/bin/vim ~/bin/vim
" alias vi=~/bin/vim
" mkdir -p ~/.vim/pack/my-packages/start
"
" cd ~/.vim/pack/my-packages/start
" git clone https://github.com/ervandew/supertab.git
" git clone https://github.com/vim-scripts/bufkill.vim.git
" git clone https://github.com/vim-scripts/buftabline.git
" git clone https://github.com/jlanzarotta/bufexplorer.git
" git clone https://github.com/vim-airline/vim-airline.git
" git clone https://github.com/tpope/vim-fugitive.git 
" git clone https://github.com/tmhedberg/SimpylFold.git
" git clone https://github.com/scrooloose/nerdtree.git
" git clone https://github.com/unblevable/quick-scope.git
" git clone https://github.com/w0rp/ale.git
" git clone https://github.com/pearofducks/ansible-vim.git
" git clone https://github.com/leafgarland/typescript-vim.git
" git clone https://github.com/ryanoasis/vim-devicons
" git clone https://github.com/hashivim/vim-terraform.git
" git clone https://github.com/hashivim/vim-hashicorp-tools.git
" Download font Robotmon from here and install https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
"
" Optional?
" git clone --recursive https://github.com/davidhalter/jedi-vim.git
" git clone https://github.com/pedrohdz/vim-yaml-folds.git
" git clone https://github.com/junegunn/fzf.vim.git 
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ~/.fzf/install (or sudo dnf install fzf)
" git clone https://github.com/vim-scripts/vim-flake8.git
"
" pip install flake8 into virtualenv
" or pip/pip3 install as root to make available globally
"
" create a ~/.config/flake8 file for flake8 settings
" [flake8]
" max-line-length = 100
"
" Ale will use flake8 for linting and autopep8 for fixing
" create a ~/.config/pycodestyle for autopep8 fixing
" [pycodestyle]
" max-line-length = 100
"
" pip install autopep8 in virtualenv or globally
"
"color zenburn
color monokai

" make space my leader key
let mapleader = "\<Space>"

" Buffers
nnoremap <silent> <C-N> :bn<CR>
nnoremap <silent> <C-B> :bp<CR>
nnoremap <silent> <C-P> :b#<CR>
nnoremap <silent> <TAB> :b#<CR>
nnoremap <silent> <C-E> :BufExplorer<CR>

" Switch buffers without saving 
set hidden

" Enable folding with the spacebar
nnoremap <space> za

" Auto indent
filetype plugin indent on

set nu

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Start without folds
set foldlevelstart=99

au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab indentkeys-=<:> foldmethod=indent
au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab foldmethod=indent

" Allow Airline to format ALE errors 
let g:airline#extensions#ale#enabled = 1

" ALE to only run linters on save, not real-time 
let g:ale_lint_on_text_changed = 'never'

" ALE will not run linters on startup 
let g:ale_lint_on_enter = 1 

" Navigate between ALE errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Set ALE fixer for python and make it aggressive
let g:ale_fixers = {'python':['autopep8']}
let g:ale_python_autopep8_options = '--aggressive'

" Toggle ALE
nnoremap <leader>at :ALEToggle<CR>

" ALEFix
nnoremap <leader>af :ALEFix<CR>

" Quickly add break points
map <Leader>b Oimport ipdb; ipdb.set_trace()

" Make vim-flake8 check python files on save, otherwise call with F7
" autocmd BufWritePost *.py call flake8#Flake8()
"
" Specify python linters for ALE 
"let g:ale_linters_explicit = 1
let g:ale_linters = {'python':['flake8']}

" Set HashiCorp options
let g:terraform_align=1
let g:terraform_fold_sections=1
"let g:terraform_fmt_on_save=1

" For Jenkinsfile
au BufNewFile,BufRead Jenkinsfile setf groovy

" To make fzf available to vim
set rtp+=~/.fzf

" Minimap settings
" let g:minimap_auto_start=1
let g:minimap_highlight='Visual'
"
" Command line abbreviation to open files in same directory as current
cabbr <expr> %% expand('%:p:h')

" vim-airline displays some funny characters without setting these
set t_u7=
set t_RV=
