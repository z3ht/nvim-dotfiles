local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'cmake',
  'clangd',
  'lua_ls',
  'pylsp'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-;>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  completion = {
    autocomplete = false
  },
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>l", function() vim.lsp.buf.code_action() end, opts)

  vim.keymap.set("n", "<leader>sq", function() vim.lsp.buf.workspace_symbol() end, opts)

  vim.keymap.set("n", "<leader>sh", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>sn", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>sN", function() vim.diagnostic.goto_next() end, opts)

  vim.keymap.set("n", "<leader>sj", function() vim.lsp.buf.type_definition() end, opts)

  vim.keymap.set("n", "<leader>si", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "<leader>sk", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>s,", function() vim.lsp.buf.declaration() end, opts)

  vim.keymap.set("n", "<leader>sl", function() vim.lsp.buf.references() end, opts)

  vim.keymap.set("n", "<leader>s;", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set({"n", "v"}, "<leader>s'", function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

require('toggle_lsp_diagnostics').init()
vim.keymap.set("n", "<leader>;", vim.cmd.ToggleDiag)
vim.keymap.set("n", "<leader>:", vim.cmd.ToggleDiagOn)

vim.keymap.set("n", "<leader>sd", vim.cmd.Ouroboros)

vim.keymap.set("n", "<leader>a/", vim.cmd.Mason)
