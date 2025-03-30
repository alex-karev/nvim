vim.api.nvim_create_user_command('AddProject', function()
  local name = vim.fn.input {
    prompt = 'Project name > ',
  }
  if not name or name == '' then
    return
  end
  local path = vim.fn.input {
    prompt = 'Project path > ',
    completion = 'dir',
  }
  if not path or path == '' then
    return
  end
  vim.cmd('WorkspacesAdd ' .. name .. ' ' .. path)
end, { desc = 'Add Project' })

vim.api.nvim_create_user_command('DeleteProject', function()
  -- TODO: Autocomplete
  local name = vim.fn.input {
    prompt = 'Project name to delete > ',
  }
  if not name or name == '' then
    return
  end
  vim.cmd('WorkspacesRemove ' .. name)
end, { desc = 'Delete Project' })
