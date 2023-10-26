-- Данные маппинга со значением "desc" сохраняются напрямую с помощью vim.keymap.set().

-- Пожалуйста, используйте эту таблицу маппингов для настройки клавиш, так как она представляет собой более низкоуровневую конфигурацию и более надежную. (which-key автоматически получит данные, сохраненные с помощью этой настройки.)
return {
  -- Первый ключ - это режим
  n = {
    -- Второй ключ - это левая часть маппинга

    -- Навигация по вкладкам буфера с помощью `H` и `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Следующий буфер",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Предыдущий буфер",
    },

    -- Маппинги, видимые под именем группы "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Выбрать для закрытия",
    },

    R = { "<Esc>:!python3 %<CR>", desc = "Запустить Python" },
    -- Таблицы с ключом `name` будут зарегистрированы с помощью which-key, если он установлен
    -- Это полезно для названий меню
    ["<leader>b"] = { name = "Буферы" },
    -- Быстрое сохранение
    -- ["<C-s>"] = { ":w!<cr>", desc = "Сохранить файл" },  -- изменить описание, но оставить ту же команду
  },

  i = {
    -- Добавьте маппинг для входа в режим командной строки в режиме ввода
    ["<S-Enter>"] = { '<C-o>o', desc = "Shift+Enter для новой строки" },
  },

  t = {
    -- Установка маппинга в false отключит его
    -- ["<esc>"] = false,
  },
}
