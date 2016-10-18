syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme desert
"colorscheme monokai
colorscheme molokai
set nu
set tabstop=4
set shiftwidth=4

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

" Settings for neocomplete
"let g:neocomplete#enable_at_startup = 1

" Settings for vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = "quickfix"
let g:deoplete#enable_at_startup = 1

" Settings for NERDTree
map <C-\> :NERDTreeToggle<CR>

" Settings for tagbat
nmap <F8> :TagbarToggle<CR>

" Settings for vim-airline
"let g:airline_powerline_fonts = 1
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
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Helper function
function! Cond(cond, ...)
	let opts = get(a:000, 0, {})
	return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" *** VIM-PLUG ***
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
"Plug 'Shougo/neocomplete', Cond(has('mac'))
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
"Plug 'valloric/youcompleteme'
"Plug 'rdnetto/YCM-Generator', {'branch' : 'stable'}
Plug 'sirver/ultisnips'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'marijnh/tern_for_vim'
Plug 'jistr/vim-nerdtree-tabs'

call plug#end()

"autocmd VimEnter * Tagbar
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
