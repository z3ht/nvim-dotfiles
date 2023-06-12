vim.keymap.set("n", "<leader>azz", vim.cmd.DiffviewFileHistory)
 vim.keymap.set("n", "<leader>azg", function()
    local commit_key = vim.fn.input("Commit key > ")
    vim.cmd.DiffviewFileHistory{ '--base='..commit_key }
end)
vim.keymap.set("n", "<leader>azg", function()
    local branch_key = vim.fn.input("Branch key > ")
    vim.cmd.DiffviewFileHistory{ '--range=origin..HEAD' }
end)
vim.keymap.set("n", "<leader>azg", function()
    local branch_key = vim.fn.input("Branch key > ")
    vim.cmd.DiffviewFileHistory{ '--range='..range_key }
end)

vim.keymap.set("n", "<leader>;", vim.cmd.ToggleDiag)

vim.keymap.set('n', '<leader>sd', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- this should be erased
