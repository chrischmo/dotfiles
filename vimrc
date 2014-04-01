" Pathogen setup
filetype off
execute pathogen#infect()
call pathogen#helptags()

" Remap <leader>
map <Space> <Leader>
" Workaround for showcmd
nnoremap <Leader>x i
set showcmd

" Code folding
set foldmethod=indent
set foldlevel=99

" Window Splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Task lists
map <leader>td <Plug>TaskList

" Revision history
map <leader>g :GundoToggle<CR>

" Syntax highlighting & validation
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

" Solarized
set background=dark
colorscheme solarized

" Validation
let g:pyflakes_use_quickfix = 0 " turn off quickfix window

" Pep8
let g:pep8_map='<leader>8' " key mapping for quickly jumping to each violation

" Tab completion
" Set it to context sensitive & enable omni code completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview " enable menu & pydoc preview

" Refactoring and Go to definition
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Searching via Ack plugin
nmap <leader>a <Esc>:Ack!

" Statusline
set laststatus=2
set statusline=
set statusline+=%<\ " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\ " buffer number, and flags
set statusline+=%-40f\ " relative path
set statusline+=%= " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\ " file type
set statusline+=%10(L(%l/%L)%)\ " line
set statusline+=%2(C(%v/125)%)\ " column
set statusline+=%P " percentage of file
set statusline+=%{fugitive#statusline()}  " git integration

" Test integration (nose)
" TODO: set up
" Example for django's manage.py: 
" map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Test integration (py.test)
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Virtualenv
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
