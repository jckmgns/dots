" open rust documentation
nmap <leader>d <Plug>(rust-doc) " open documentation
nmap <leader>D <Plug>(rust-def) " goto definition

" disable underlining of errors and warnings
" highlight ALEError cterm=none
highlight ALEWarning cterm=none

" set colorcolumn wider to accomondate officially encouraged text width
set colorcolumn=100

compiler cargo
