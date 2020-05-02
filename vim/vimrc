""Set line numbering
set number
"Set line highlight
set cursorline
"Setting no vim compat
set nocp
"Setting no swapfile
set noswapfile
"set lazyredraw to scroll faster
set ttyfast
set lazyredraw
""Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
""Let netrw ignore hidden files
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
""""""""""""""""""""""""""""""""""""mouse
"allows mouse selection to go into visual mode and more
set mouse=a
""""""""""""""""""""""""""""""""""""vundle
"Vundle installs plugins configured in vimrc with :BundleInstall
call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""""""""""""""Plugins
"Bundles to install
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'chrisbra/Colorizer'
Plug 'altercation/vim-colors-solarized'
Plug 'terryma/vim-multiple-cursors'
Plug 'ekalinin/Dockerfile.vim'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'hashivim/vim-terraform'
Plug 'vim-scripts/bats.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"render man pages
runtime ftplugin/man.vim

""""""""""""""""""""""""""""""""""""Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
""""""""""""""""""""""""""""""""""""MAPPINGS
""Open tag under cursor in new tab
map <C-T> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"macro for copying filename to clipboard
nmap <silent> cp :let @+=expand("%")<CR>
"hlsearch disable with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"Search in command history without losing history filter
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
""""""""""""""""""""""""""""""""""""moving through splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
""""""""""""""""""""""""""""""""""""moving through splits
""""""""""""""""""""""""""""""""""""Open splits down and right
set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""Open splits down and right
""""""""""""""""""""""""""""""""""""change current working dir
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
""""""""""""""""""""""""""""""""""""Colors
set background=dark
set t_Co=16
colorscheme solarized
""""""""""""""""""""""""""""""""""""Colors
"allow to navigate unsaved buffers without prompting any error or warning
set hidden
""""""""""""""""""""""""""""""""""""Tabs
"Insert spaces instead of tabs it inserts (if defined) 'softtabstop' space chars
set expandtab
"Tab equivalent to n spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
"enable hlsearch
set hlsearch
"lines wont break screen
set nowrap
""""""""""""""""""""""""""""""""""""Terraform
let g:terraform_align=1
""""""""""""""""""""""""""""""""""""Tabularize
" tabularize by selection in visual mode
vmap <leader>t y:Tabularize /<C-R>"/<CR>
" tabularize =
nmap <leader>t= :Tabularize /^[^=]*\zs=/<CR>
nmap <leader>te :Tabularize /^[^=]*\zs=/<CR>
" tabularize =>
nmap <leader>th :Tabularize /^[^=>]*\zs=>/<CR>
" tabularize {
nmap <leader>t{ :Tabularize /^[^{]*\zs{/<CR>
nmap <leader>tB :Tabularize /^[^{]*\zs{/<CR>
" tabularize (
nmap <leader>t( :Tabularize /^[^(]*\zs(/<CR>
nmap <leader>tb :Tabularize /^[^(]*\zs(/<CR>
""""""""""""""""""""""""""""""""""""Tabularize
""""""""""""""""""""""""""""""""""""fzf
"maps \e to open fuzzy finding
nnoremap <Leader>e :Files<CR>
"maps \ag to open ag content fuzzy finding
nnoremap <Leader>ag :Rg<CR>
" Adds preview to ripgrep search
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"maps \b to navigate open buffers
nnoremap <Leader>b :Buffers<CR>
""""""""""""""""""""""""""""""""""""fzf
""""""""""""""""""""""""""""""""""""Fugitive
nmap <leader>g :G<CR>
" Open commits on file in quickfix with fzf
nmap <leader>gbc :BCommits<CR>
" Opens commits log
nmap <leader>gc :Commits<CR>
nmap <leader>gp :Gpush origin<CR>
""""""""""""""""""""""""""""""""""""Fugitive
nmap <leader>T :terminal<CR>
""""""""""""""""""""""""""""""""""""swaywm clipboard
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
""""""""""""""""""""""""""""""""""""END MAPPINGS
