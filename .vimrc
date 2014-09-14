"Syntax highlight
syntax enable
""Set line numbering
set number
"Set line highlight
set cursorline
"Setting no vim compat
set nocp
""Set nerdtree to be launched on start and cursor set to editing window
autocmd VimEnter * wincmd p
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
Plugin 'thoughtbot/vim-rspec'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'rodjek/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'tejr/vim-nagios'
"Plugin 'yuratomo/gmail.vim'
"Plugin 'pld-linux/vim-syntax-vcl'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/JSON.vim'
Plugin 'kchmck/vim-coffee-script'

filetype plugin indent on
"filetype plugin indent on
"Matchit is included in vimcore since vim 6.0 this activates it:
"(runtime == source+relative path to vim installation dir)
runtime macros/matchit.vim
""""""""""""""""""""""""""""""""""""Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_auto_loc_list = 2
let g:syntastic_mode_map = { 'mode': 'active',
                             \ 'active_filetypes': [],
                             \ 'passive_filetypes': ['puppet'] }
"set statusline+=%#warningmsg# 
"set statusline+=%{SyntasticStatuslineFlag()}
""""""""""""""""""""""""""""""""""""End syntastic
""""""""""""""""""""""""""""""""""""Youcompleteme
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
""""""""""""""""""""""""""""""""""""MAPPINGS
map <F5> :NERDTreeToggle .<CR>
map <F8> :SyntasticCheck<CR>
"make Y to perform like C or D
map Y y$
""Open tag under cursor in new tab
map <C-T> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"Switch between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"macro for pasting from clipboard (cp = clipboard paste)
nnoremap cp "*p
"hlsearch disable with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"Search in command history without losing history filter
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
""""""""""""""""""""""""""""""""""""moving through windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
""""""""""""""""""""""""""""""""""""moving through windows
""""""""""""""""""""""""""""""""""""Open splits down and right
set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""Open splits down and right
""""""""""""""""""""""""""""""""""""HARDWAY
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
""""""""""""""""""""""""""""""""""""END MAPPINGS
""""""""""""""""""""""""""""""""""""Colors
set background=dark 
colorscheme solarized
""""""""""""""""""""""""""""""""""""Colors
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬
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
"Export python path for powerline
let $PYTHONPATH="/usr/lib/python3.4/site-packages"
"always show powerline
set laststatus=2
"""""""""""""""""""""""""""""""""""""Powerline
"instant go to normal mode (powerline)
if ! has('gui_running')
        set ttimeoutlen=10
        augroup FastEscape
                autocmd!
                au InsertEnter * set timeoutlen=0
                au InsertLeave * set timeoutlen=1000
        augroup END
endif
""""""""""""""""""""""""""""""""""""Powerline
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
""""""""""""""""""""""""""""""""""""Unite
"Set ag as default finder
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
let g:unite_source_grep_recursive_opt = ''
"Set unite to open window in bottom right
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 1
let g:unite_winheight = 8
"Use fuzzy matcher
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"Set sort method
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_matcher_fuzzy_max_input_length = 60
" In window settings
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:SuperTabDisabled=1
  inoremap <silent><buffer><expr> <C-i> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-s> unite#do_action('vsplit')
  imap <buffer> <ESC> <Plug>(unite_exit)
endfunction
"maps \e to open unite fuzzy finding 
nnoremap <Leader>e :Unite -silent -buffer-name=files -auto-resize -start-insert file_rec/async:!<CR>
"maps \ag to open ag content fuzzy finding
nnoremap <Leader>ag :Unite -silent -start-insert grep:.<CR>
"maps \r to open recent buffers open
nnoremap <silent> <Leader>r :Unite -silent -buffer-name=recent -auto-resize file_mru<cr>
"maps \b to navigate open buffers
nnoremap <Leader>b :Unite -silent -buffer-name=buffers -auto-resize buffer<cr>
""""""""""""""""""""""""""""""""""""Unite
