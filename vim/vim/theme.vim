Plug 'vim-scripts/ScrollColors'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim', { 'as': 'dracula' }

let g:Theme = {'name': 'dracula'}

function! g:Theme.Change(theme)
  let g:Theme.name = a:theme
endfunction

augroup theme
  autocmd!
  autocmd User VimLoaded execute 'silent! colorscheme' g:Theme.name
augroup END