set relativenumber nu
set tabstop=4
set shiftwidth=4
set ruler
set cursorline
set mouse=a
set termguicolors

syntax on

" Changed from 4000 for vim-gitgutter
set updatetime=250

" Settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_javascript_checkers = ['jshint']

" Settings for neocomplete
if !has('nvim')
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_smart_case = 1

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
  		return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  		" For no inserting <CR> key.
  		"return pumvisible() ? "\<C-y>" : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
endif

" Settings for vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" deoplete settings
let g:deoplete#enable_at_startup = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = '/home/chris/go/bin/gocode'

" deoplete-clang settings
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
" Other possible path locations:
"  '/usr/local/opt/llvm/lib/libclang.dylib'
"  '/usr/lib64/libclang.so.4'
"  '/usr/lib/libclang.so'

let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang/'
" Other possible path locations:
"  '/usr/local/opt/llvm/lib/clang/'
"  '/usr/lib64/clang/'

" Settings for NERDTree
map <C-\> :NERDTreeToggle<CR>

" Settings for tagbar
nmap <F8> :TagbarToggle<CR>

" Settings for vim-airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Settings for vim-javascript
let g:javascript_enable_domhtmlcss = 1

" Settings for ultisnips
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
"let g:SuperTabDefaultCompletionType    = '<C-n>'
"let g:SuperTabCrMapping                = 0
"let g:UltiSnipsExpandTrigger           = '<tab>'
"let g:UltiSnipsJumpForwardTrigger      = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

"javascript-libraries-syntax
let g:used_javascript_libs = 'angularjs'

" Helper function
function! Cond(cond, ...)
	let opts = get(a:000, 0, {})
	return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Python
let python_highlight_all=1

" CPP Enhanced Highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_concepts_highlight = 1

" Omnisharp
set completeopt-=preview

" *** VIM-PLUG ***
" Auto-install of Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !has('nvim')
	let $plug_string = '~/.vim/plugged' "For neovim
else 
	let $plug_string = '~/.local/share/nvim/plugged' "For vim
endif

call plug#begin($plug_string)

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete', Cond(!has('nvim'), {'do': ':NeoCompleteEnable'})
Plug 'Shougo/deoplete.nvim', Cond(has('nvim'), {'do': ':UpdateRemotePlugins'})
Plug 'zchee/deoplete-go', Cond(has('nvim'), {'for': 'go', 'do': 'make'})
Plug 'zchee/deoplete-clang', Cond(has('nvim'), {'for': ['c', 'cpp', 'h']})
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'terryma/vim-multiple-cursors'
Plug 'sirver/ultisnips'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'burnettk/vim-angular', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'elzr/vim-json', { 'for': ['javascript', 'json', 'typescript'] }
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }
Plug 'Slava/tern-meteor', { 'for': 'javascript' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-scripts/JavaScript-Indent', { 'for': 'javascript' }
Plug 'moll/vim-node', { 'for': ['javascript', 'json', 'typescript', 'node'] }
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'crusoexia/vim-monokai'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'uguu-org/vim-matrix-screensaver'
" Testing
Plug 'vim-scripts/c.vim'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
" --------------------------------
Plug 'Shougo/denite.nvim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'neomake/neomake'
Plug 'omnisharp/omnisharp-vim'
Plug 'morhetz/gruvbox'

call plug#end()

set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_termcolors=256
color gruvbox
"color dracula
"color monokai
"color desert

highlight Normal ctermbg=none
highlight NonText ctermbg=none

runtime! plugin/sensible.vim 
set scrolloff=0

"autocmd VimEnter * Tagbar
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"autocmd VimEnter * wincmd p

" Old Settings
"let g:solarized_termtrans=1
"colorscheme desert
"colorscheme monokai
"color dracula
"colorscheme molokai
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
""let g:solarized_termtrans=1
"set backspace=2"

" Old Plugins
"Plug 'fatih/molokai'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'valloric/youcompleteme'
"Plug 'rdnetto/YCM-Generator', {'branch' : 'stable'}
"Plug 'sickill/vim-monokai'
"Plug 'tomasr/molokai'
"Plug 'altercation/vim-colors-solarized'
