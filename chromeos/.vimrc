set nocompatible

" autoload Plug if needed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" Plugins
Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Themes
Plug 'nlknguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" UI stuff
syntax on
set number
set background=dark
set noshowmode
set backspace=indent,eol,start
colorscheme PaperColor

" vim options that make plugins better
set updatetime=100
set laststatus=2

" indentation stuff
set autoindent
set smartindent
set pastetoggle=<F2>

" enable folding and stuff
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab

" mouse support
set mouse=a

" shortcuts for tabs and splits
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vs <C-R>=expand("%:p:h") . "/" <CR>

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" NERDTree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Lightline theme
" let g:lightline = {
"      \ 'colorscheme': 'PaperColor',
"      \ }

" Emmet only enabled for HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" vim-multiple-cursors
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-S-D>'
let g:multi_cursor_skip_key='<C-A-d>'
let g:multi_cursor_quit_key='<Esc>'