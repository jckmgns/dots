" Disable underlining of warnings
highlight ALEWarning cterm=none
" highlight ALEError cterm=none

" Disable language server diagnostics (currently broken)
let g:lsp_diagnostics_enabled = 0

" Use language server as omni completion provider
set omnifunc=lsp#omni#complete

" Set compiler to cargo
compiler cargo
