"Syntax highlight
syntax enable
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
" Vue syntax highligting
autocmd BufNewFile,BufRead *.vue set ft=vue
""Let netrw ignore hidden files
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
""""""""""""""""""""""""""""""""""""mouse
"allows mouse selection to go into visual mode and more
set mouse=a
""""""""""""""""""""""""""""""""""""vundle
"Vundle installs plugins configured in vimrc with :BundleInstall
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"""""""""""""""""""""""""""""""""""""Plugins
"Required Bundle
Plugin 'gmarik/vundle'
"Bundles to install
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'posva/vim-vue'
Plugin 'chrisbra/Colorizer'
Plugin 'thoughtbot/vim-rspec'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/syntastic'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'rodjek/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/fzf.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/JSON.vim'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'hashivim/vim-terraform'
Plugin 'vim-scripts/bats.vim'

filetype plugin indent on
"Matchit is included in vimcore since vim 6.0 this activates it:
runtime macros/matchit.vim
"render man pages
runtime ftplugin/man.vim

""""""""""""""""""""""""""""""""""""Vue
"disable check pre_processors to fix slowlyness
let g:vue_disable_pre_processors=1
""""""""""""""""""""""""""""""""""""Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_auto_loc_list = 2
""""""""""""""""""""""""""""""""""""End syntastic
""""""""""""""""""""""""""""""""""""Youcompleteme
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
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
colorscheme solarized
""""""""""""""""""""""""""""""""""""Colors
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"display hidden chars (tab and eol)
"set list
"allow to navigate unsaved buffers without prompting any error or warning
set hidden
""""""""""""""""""""""""""""""""""""Tabs
"Insert spaces instead of tabs it inserts (if defined) 'softtabstop' space chars
set expandtab
"Tab equivalent to n spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set autoindent
set smarttab
"enable hlsearch
set hlsearch
set incsearch
"lines wont break screen
set nowrap
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
"maps \e to open unite fuzzy finding
nnoremap <Leader>e :Files<CR>
"maps \ag to open ag content fuzzy finding
nnoremap <Leader>ag :Ag<CR>
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

"maps \b to navigate open buffers
nnoremap <Leader>b :Buffers<CR>
""""""""""""""""""""""""""""""""""""fzf
""""""""""""""""""""""""""""""""""""Fugitive
nmap <leader>g :Gstatus<CR>
""""""""""""""""""""""""""""""""""""END MAPPINGS