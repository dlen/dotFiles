""Set line numbering
set number
"Set line highlight
set cursorline
"Setting no vim compat
set nocp
"Setting no swapfile
set noswapfile
"Setting encoding
set encoding=UTF-8
"set lazyredraw to scroll faster
set ttyfast
set lazyredraw
""""""""""""""""""""""""""""""""""""Open splits down and right
set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""Open splits down and right
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
set signcolumn=yes
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hashivim/vim-terraform'
Plug 'vim-scripts/bats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'tmsvg/pear-tree'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
Plug 'meain/vim-package-info'
Plug 'mhinz/vim-crates'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"render man pages
runtime ftplugin/man.vim

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
" Move around when in terminal mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
""""""""""""""""""""""""""""""""""""moving through splits
""""""""""""""""""""""""""""""""""""change current working dir
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
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
""""""""""""""""""""""""""""""""""""Colors
set background=dark
"colorscheme solarized8_flat
colorscheme gruvbox
"colorscheme base16-default-dark
""""""""""""""""""""""""""""""""""""Colors
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
nnoremap <Leader>l :BLines<CR>
""""""""""""""""""""""""""""""""""""fzf
""""""""""""""""""""""""""""""""""""Fugitive
set diffopt+=vertical
nmap <leader>g :G<CR>
" Open commits on file in quickfix with fzf
nmap <leader>gc :BCommits<CR>
" Opens commits log for all repo
nmap <leader>gac :Commits<CR>
nmap <leader>gP :G push origin<CR>
nmap <leader>gp :G pull origin<CR>
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
""""""""""""""""""""""""""""""""""""Fugitive
""""""""""""""""""""""""""""""""""""Terminal on horizontal spit
nmap <leader>T :sp +te <CR>
""""""""""""""""""""""""""""""""""""Terminal on horizontal spit
""""""""""""""""""""""""""""""""""""END MAPPINGS
""""""""""""""""""""""""""""""""""""Airline
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""End Airline
""""""""""""""""""""""""""""""""""""Python paths
" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif
""""""""""""""""""""""""""""""""""""Python paths
""""""""""""""""""""""""""""""""""""Bash Language server coc

let g:coc_global_extensions = [
      \'coc-markdownlint',
      \'coc-yaml',
      \'coc-sh',
      \'coc-pyright',
      \'coc-rust-analyzer',
      \'coc-json',
      \'coc-docker',
      \'coc-git',
      \'coc-diagnostic',
      \'coc-phpls',
      \]
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
""""""""""""""""""""""""""""""""""""End Bash Language server coc
""""""""""""""""""""""""""""""""""""VimWiki
" Disable - hotkey to remove header level
nmap <Leader>- <Plug>VimwikiRemoveHeaderLevel
""""""""""""""""""""""""""""""""""""Zettelkasten
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

" Use surfraw to search whatever is under the current visual selection
function SurfRaw(...) range
  if a:0 > 0
    let elvi = a:1
  else
    let elvi = 'duckduckgo'
  endif

  execute "!sr " . elvi . " " . shellescape(@", 1)
endfunction

" Open the list of elvis before making search
command! -bang -nargs=? SurfzRaw
  \ call fzf#run({'source': "sr -elvi | awk '{print $1}'", 'sink': function('SurfRaw'), 'down': '30%'})

vmap <leader>gS y :call SurfRaw()<CR>
vmap <leader>gF y :SurfzRaw<CR>
if has('nvim')
  tnoremap <a-a> <esc>a
  tnoremap <a-b> <esc>b
  tnoremap <a-d> <esc>d
  tnoremap <a-f> <esc>f
endif
" Automatically open CratesToggle when opening cargo.toml
if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif
