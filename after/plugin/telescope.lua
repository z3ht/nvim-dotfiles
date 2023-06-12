local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>se', builtin.find_files, {})
vim.keymap.set('n', '<leader>sr', builtin.git_files, {})
vim.keymap.set('n', '<leader>sd', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>/', builtin.help_tags, {})
vim.keymap.set('n', '<leader>.', builtin.man_pages, {})
vim.keymap.set('n', '<leader>,', builtin.commands, {})

local telescope = require('telescope')
telescope.setup {
  pickers = {
    git_commits = {
      mappings = {
        n = { ["<C-r>d"] = telescope.extensions.diffviewer.commits },
        i = { ["<C-r>d"] = telescope.extensions.diffviewer.commits }
      }
    },
    git_branches = {
      mappings = {
        n = { ["<C-r>d"] = telescope.extensions.diffviewer.branches },
        i = { ["<C-r>d"] = telescope.extensions.diffviewer.branches }
      }
    }
  }
}
telescope.load_extension('diffviewer')
