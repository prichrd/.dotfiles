local M = {}

M.spotify = function ()
  local action = function(selected) os.execute(selected.script) end
  local format = function(data) return data.action end
  local data = {
    {
      action = 'Spotify: Next',
      script = "osascript -e 'tell application \"Spotify\" to next track'",
    },
    {
      action = 'Spotify: Prev',
      script = "osascript -e 'tell application \"Spotify\" to previous track'",
    },
  }

  require('prichrd.ui').picker({
    width_percent = 0.25,
    height_percent = 0.25,
    cursorline = true,
    select_callback = action,
    data = data,
    format = format,
  })
end

return M
