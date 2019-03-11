Plug 'scrooloose/nerdtree'

function! s:OpenExplorer()
  if argc() == 1 && isdirectory(argv()[0]) && !exists('s:stdin')
    silent! execute 'NERDTree' argv()[0]
    wincmd p
    enew
  endif
endfunction

function! s:CloseExplorer()
  if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
    quit
  endif
endfunction

augroup explorer
  autocmd!
  autocmd User VimLoaded let g:NERDTreeShowHidden = 1
  autocmd VimEnter * call s:OpenExplorer()
  autocmd BufEnter * call s:CloseExplorer()
  autocmd StdinReadPre * let s:stdin = 1
augroup END