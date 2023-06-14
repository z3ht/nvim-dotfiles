local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>z', builtin.treesitter, {})

vim.keymap.set('n', '<leader>sw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>se', builtin.find_files, {})
vim.keymap.set('n', '<leader>sr', builtin.git_files, {})
vim.keymap.set('n', '<leader>st', builtin.oldfiles, {})

vim.keymap.set('n', '<leader>/', builtin.help_tags, {})
vim.keymap.set('n', '<leader>.', builtin.man_pages, {})
vim.keymap.set('n', '<leader>,', builtin.commands, {})
vim.keymap.set('n', '<leader>m', builtin.keymaps, {})

vim.keymap.set('n', '<leader>sz', builtin.git_branches, {})
vim.keymap.set('n', '<leader>sx', builtin.git_commits, {})
vim.keymap.set('n', '<leader>sc', builtin.git_stash, {})

vim.keymap.set('n', '<leader>ad', builtin.git_status, {})

local telescope = require('telescope')

telescope.setup {
  pickers = {
    git_commits = {
      mappings = {
        n = { ["<C-r>d"] = telescope.extensions.diffviewer.diff },
        i = { ["<C-r>d"] = telescope.extensions.diffviewer.diff }
      }
    },
    git_bcommits = {
      mappings = {
        n = { ["<C-r>d"] = telescope.extensions.diffviewer.diff },
        i = { ["<C-r>d"] = telescope.extensions.diffviewer.diff }
      }
    },
    git_branches = {
      mappings = {
        n = { ["<C-r>d"] = telescope.extensions.diffviewer.diff },
        i = { ["<C-r>d"] = telescope.extensions.diffviewer.diff }
      }
    },
    git_stash = {
      mappings = {
        n = { ["<C-r>d"] = telescope.extensions.diffviewer.diff },
        i = { ["<C-r>d"] = telescope.extensions.diffviewer.diff }
      }
    }
  }
}
telescope.load_extension('diffviewer')

-- may require manual installation
-- Clone `https://github.com/nvim-telescope/telescope-dap.nvim
-- Copy `dap.lua` to `~/.local/share/<vim_install>/site/pack/packer/start/telescope/<path to _extensions>`
if require('dap').active then
    telescope.load_extension('dap')
    vim.keymap.set('n', '<leader>aa', telescope.extensions.dap.list_breakpoints())
    vim.keymap.set('n', '<leader>aii', telescope.exentsions.dap.frames())
end
