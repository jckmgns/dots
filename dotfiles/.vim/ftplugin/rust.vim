" Open rust documentation
nmap <leader>d <Plug>(rust-doc) " open documentation
nmap <leader>D <Plug>(rust-def) " goto definition

" Set colorcolumn wider to accomondate officially encouraged text width
set colorcolumn=100

" Disable ale
let b:ale_linters = ['']
" let b:ale_linters = ['rls']
" let g:lsp_diagnostics_enabled = 0

" Use language server as omni completion provider
set omnifunc=lsp#omni#complete

" Set compiler to cargo
compiler cargo
