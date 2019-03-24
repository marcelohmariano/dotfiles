Plug 'scrooloose/nerdtree'

let s:Explorer = {}

function! s:Explorer.Open()
  if argc() == 1 && isdirectory(argv()[0]) && !exists('s:stdin')
    silent! execute 'NERDTree' argv()[0]
    wincmd p
    enew
  endif
endfunction

function! s:Explorer.Close()
  if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
    quit
  endif
endfunction

function! s:Explorer.Init()
  let g:NERDTreeShowHidden = 1

  " Hide the string 'Press ? for help'
  let g:NERDTreeMinimalUI = 1
endfunction

augroup explorer
  autocmd!
  autocmd User VimLoaded call s:Explorer.Init()
  autocmd VimEnter * call s:Explorer.Open()
  autocmd BufEnter * call s:Explorer.Close()
  autocmd StdinReadPre * let s:stdin = 1
augroup END