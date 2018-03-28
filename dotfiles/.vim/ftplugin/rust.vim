" open rust documentation
au FileType rust nmap <leader>d <Plug>(rust-doc) " open documentation
au FileType rust nmap <leader>D <Plug>(rust-def) " goto definition

" disable underlining of errors and warnings
highlight ALEError cterm=none
highlight ALEWarning cterm=none
