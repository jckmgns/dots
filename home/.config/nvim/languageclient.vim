" ------------------------------------------------------------
" COMMANDS
" ------------------------------------------------------------

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }

" ------------------------------------------------------------
" SETTINGS
" ------------------------------------------------------------

" required for operations modifying multiple buffers
set hidden

" hide virtual text in insert mode
let g:LanguageClient_hideVirtualTextsOnInsert = 1

" ------------------------------------------------------------
" KEY MAPPINGS
" ------------------------------------------------------------

let g:LanguageClient_diagnosticsDisplay = {
            \    1: {
            \        "name": "Error",
            \        "texthl": "ALEError",
            \        "signText": ">>",
            \        "signTexthl": "ALEErrorSign",
            \        "virtualTexthl": "Error",
            \    },
            \    2: {
            \        "name": "Warning",
            \        "texthl": "ALEWarning",
            \        "signText": "--",
            \        "signTexthl": "ALEWarningSign",
            \        "virtualTexthl": "Todo",
            \    },
            \    3: {
            \        "name": "Information",
            \        "texthl": "ALEInfo",
            \        "signText": "--",
            \        "signTexthl": "ALEInfoSign",
            \        "virtualTexthl": "Todo",
            \    },
            \    4: {
            \        "name": "Hint",
            \        "texthl": "ALEInfo",
            \        "signText": "~~",
            \        "signTexthl": "ALEInfoSign",
            \        "virtualTexthl": "Todo",
            \    },
            \}


" ------------------------------------------------------------
" KEY MAPPINGS
" ------------------------------------------------------------

function LC_maps()
    " only apply mappings to buffers with supported filetypes
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
        nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
        nnoremap <silent> <leader>s :call LanguageClient#textDocument_documentSymbol()<CR>
    endif
endfunction

autocmd FileType * call LC_maps()
