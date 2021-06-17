-- LSP settings
-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])


require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}

local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

end

-- -- enables highlighting of hovered items where possible
-- local function documentHighlight(client, buffer)
-- 	-- enable highlighting only if the language server is capable of doing it
-- 	if client.resolved_capabilities.document_highlight then
-- 		vim.api.nvim_exec(
-- 			[[
-- 				hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
-- 				hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
-- 				hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
-- 				augroup lsp_document_highlight
-- 					autocmd! * <buffer>
-- 					autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
-- 					autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
-- 				augroup END
-- 			]],
-- 			false
-- 		)
-- 	end
-- end
--
--
-- local lsp_common = {}
--
-- function lsp_common.on_attach(client, buffer)
-- 	documentHighlight(client, buffer)
-- end
--
-- return lsp_common
