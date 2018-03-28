" vim: set foldmethod=marker :{{{
" vim: set foldlevel=0
" }}}

" Options {{{
set nocompatible
set nu
set expandtab
set shiftwidth=4
set tabstop=4
set ai
set clipboard=unnamedplus
set encoding=utf-8
set listchars=eol:¬
set list
set foldmethod=syntax

filetype plugin indent on
syntax on
" }}}

" Functions {{{
function! ClangFormat()
    :w
    exe "!clang-format -i %"
    :e
endfunction
" }}}

" Keybinds {{{
" quick save
imap <C-S> <Esc>:w<CR>i
nmap <C-S> :w<CR>

" close on X
" imap <C-X> <Esc>:x<CR>
nmap <C-X> :x<CR>

" auto format code
au FileType cc,cpp,c,h,hpp,hh nmap <silent> <C-K> :call<Space>ClangFormat()<CR>
au FileType cc,cpp,c,h,hpp,hh inoremap <silent> <C-K> <Esc>:call<Space>ClangFormat()<CR>i

" this would auto-generate an int main block when entering 'int main('
" au FileType c inoremap int<Space>main( int<Space>main(void)<Space>{<CR><Tab><CR>return<Space>0;<CR>}<Esc>4Xkk<End>i<Space>

" auto complete blocks
imap { {}<Esc>i
imap ( ()<Esc>i
imap [ []<Esc>i
imap < <><Esc>i

" }}}

" Colors {{{
" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
" }}}