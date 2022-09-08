require("lsp_lines").setup({})

vim.keymap.set("", "<Leader>lL", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
