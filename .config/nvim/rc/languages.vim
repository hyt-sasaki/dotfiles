augroup Python
    autocmd!
    autocmd BufNewFile *.py execute "normal ggI# -*- config:utf-8 -*- \<CR>\<ESC>^"
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal nosmartindent
augroup END

lua << EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.tsserver.setup{}
nvim_lsp.html.setup{}
nvim_lsp.cssls.setup{}
nvim_lsp.pyls.setup{
    cmd = {'/home/sasaki/.pyenv/versions/neovim3/bin/pyls'}
}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
inoremap <silent> <c-j> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <c-j> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
