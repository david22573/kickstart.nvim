return {
  -- POINT THIS TO YOUR LOCAL FOLDER
  dir = '~/Github/codepicker-lua',

  -- Name is optional but good for the UI
  name = 'codepicker',

  -- Kickstart will load this config automatically
  config = function()
    -- Set your defaults here so you don't have to edit the plugin source code
    require('codepicker.config').setup {
      -- Ensure this matches your binary name
      cmd = 'codepicker',
      -- You can switch models here without touching the plugin code
      model = 'xiaomi/mimo-v2-flash:free',
      edit = {
        diff_view = true,
      },
    }
  end,
}
