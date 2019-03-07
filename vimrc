" vim: set foldmethod=marker :{{{
" vim: set foldlevel=0
" }}}

call pathogen#infect()
call pathogen#helptags()

"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

" Options {{{
set nocompatible
set nu
set expandtab
set shiftwidth=4
set tabstop=4
set ai
set noswapfile
set clipboard=unnamedplus
set encoding=utf-8

set list
set listchars=eol:¬
set listchars+=tab:\|›
set listchars+=extends:›
set listchars+=precedes:‹

set foldmethod=syntax
set wildmenu
set mouse=a

set laststatus=2
" set statusline=%!MyStatusLine()
let g:airline_theme='wombat'

autocmd VimEnter * NERDTree

filetype plugin indent on
syntax on
" }}}

" Functions {{{
function! ClangFormat()
    :w
    exe "!clang-format -i %"
    :e
endfunction

"function! MyStatusLine()
"    return "%F%m %y [%l:%c]"
"endfunction
" }}}

" Keybinds {{{
" quick save
imap <C-S> <Esc>:wa<CR>i
nmap <C-S> :wa<CR>

" close on X
" imap <C-X> <Esc>:x<CR>
nmap <C-X> :xa<CR>

" Auto-make
nmap <C-M> :!make<CR>

" auto format code
au FileType cc,cpp,c,h,hpp,hh nmap <silent> <C-K> :call<Space>ClangFormat()<CR>
au FileType cc,cpp,c,h,hpp,hh inoremap <silent> <C-K> <Esc>:call<Space>ClangFormat()<CR>i

" this would auto-generate an int main block when entering 'int main('
" au FileType c inoremap int<Space>main( int<Space>main(void)<Space>{<CR><Tab><CR>return<Space>0;<CR>}<Esc>4XkkA

" auto complete blocks
" imap { {}<Esc>i
" imap ( ()<Esc>i
" imap [ []<Esc>i
" imap < <><Esc>i

" }}}

" Colors {{{
" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

" vertical line
highlight ColorColumn ctermbg=lightgrey
" }}}
