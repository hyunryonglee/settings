set background=dark             " Set background
set number                      " Set line number
set relativenumber              " Set relative numbering
set hlsearch                    " Highlight the search
set incsearch                   " Incremental search as you type the word
set smartcase                   " Supposed to search case smartly
set so=999                      " Cursor remains in middle of screen 
set virtualedit=onemore
"set wrapmargin=5
"set textwidth=80                " Number of characters per row
set showmatch                   " Show matching paranthesis
set autoread                    " Automatically read file changed on disk
set pastetoggle=<F2>            " Set paste/nopaste when pasting
set wildmode=longest,list       " Bash-like tab to completion 
set splitright                  " vsplit to the right

"80 line highlight
set colorcolumn=80

"Color scheme
"colorscheme solarized

" **************************************************************************** "
" Set indent rules
" **************************************************************************** "
set autoindent                  " Always set autoindenting on
set smartindent
set copyindent                  " Copy previous line indenting
set shiftwidth=4                " Number of spaces to use for autoindenting
set shiftround                  " Use multiple of shiftwidth for indenting > <


" **************************************************************************** "
" make backspaces more powerful
" **************************************************************************** "
set backspace=indent,eol,start
set ruler                       " show line and column number
set showcmd                     " show (partial) command in status line


" **************************************************************************** "
" configure editor with tabs and nice stuff...
" **************************************************************************** "
set expandtab                   " enter spaces when tab is pressed
set tabstop=4                   " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4                " number of spaces to use for auto indent
" added new, does the above over ride the below?
" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
" au BufRead,BufNewFile *.c* set noexpandtab
" au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


" **************************************************************************** "
" No trailing spaces 
" **************************************************************************** "
autocmd FileType c,cpp,java,python autocmd BufWritePre <buffer> :%s/\s\+$//e


" **************************************************************************** "
" Syntax highlighting
" **************************************************************************** "
syntax enable
filetype on
au BufNewFile,BufRead *.vl,*.vhd set filetype=verilog
au BufNewFile,BufRead SCons* set filetype=scons
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" **************************************************************************** "
" Cursor line (highlights the current row/column)
" **************************************************************************** "
set cursorline
hi CursorLine ctermbg=black cterm=none
" set cursorcolumn
" hi CursorColumn ctermbg=black cterm=none
" hi CursorLine term=bold cterm=bold ctermbg=darkblue


" **************************************************************************** "
" tab navigation like firefox
" **************************************************************************** "
:nmap <S-tab> :tabprevious<CR>
:nmap <tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>

" Remove highlighted search by hitting F3
nnoremap <F3> :noh<CR>                
" Toggle cursor to middle of screen and default behavior by hitting F4
nnoremap <F4> :let &scrolloff=999-&scrolloff<CR>
" Toggle line number by hitting ;;
nnoremap ;; :set number! \| :set relativenumber!<CR>

" **************************************************************************** "
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" **************************************************************************** "
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()


" **************************************************************************** "
" Quickly edit/reload the vimrc file
" **************************************************************************** "
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" The leader key is by default the \ key. So you can edit and reload vimrc by 
" hitting \ev and \sv respectively
" let mapleader=","

" Set the status line
" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" highlight Cursor guifg=blue guibg=black

" Remove trailing whitespace
autocmd FileType c,cpp,java,py,scons autocmd BufWritePre <buffer> :%s/\s\+$//e

" Use block cursor when ssh-ing in with Cygwin
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
