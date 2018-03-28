set nu
set expandtab
set shiftwidth=4
set tabstop=4
set ai
set clipboard=unnamedplus
syntax on

function! ClangFormat()
    :w
    exe "!clang-format -i %"
    :e
endfunction

" quick save
imap <C-S> <Esc>:w<CR>i
nmap <C-S> :w<CR>
" close on X
" imap <C-X> <Esc>:x<CR>
nmap <C-X> :x<CR>

" auto format code
au FileType cc,cpp,c,h,hpp,hh nmap <silent> <C-K> :call<Space>ClangFormat()<CR>
au FileType cc,cpp,c,h,hpp,hh inoremap <silent> <C-K> <Esc> :call<Space>ClangFormat()<CR>i

" auto complete blocks
imap { {}<Esc>i
imap ( ()<Esc>i
imap [ []<Esc>i
imap < <><Esc>i

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
