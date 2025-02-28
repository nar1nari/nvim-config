return {
  'andweeb/presence.nvim',
  prioprity = 1000,
  config = function()
    require("presence").setup {
      -- editing_text        = "Редактирует %s",
      -- file_explorer_text  = "Ковыряется в файлах",
      -- git_commit_text     = "Коммитит в гит",
      -- plugin_manager_text = "Ебётся с конфигами",
      -- reading_text        = "Читает маны",
      -- workspace_text      = "Работает над %s",
      -- line_number_text    = "%s строка из %s",
    }
  end,
}
