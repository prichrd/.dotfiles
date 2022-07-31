local M = {}
M._debug = false;

M.spotify = function()
  local data = {
    {
      action = 'Spotify: Next',
      script = "osascript -e 'tell application \"Spotify\" to next track'",
    },
    {
      action = 'Spotify: Prev',
      script = "osascript -e 'tell application \"Spotify\" to previous track'",
    },
    {
      action = 'Spotify: Pause',
      script = "osascript -e 'tell application \"Spotify\" to pause'",
    },
    {
      action = 'Spotify: Play',
      script = "osascript -e 'tell application \"Spotify\" to play'",
    },
  }

  require('prichrd.ui').picker({
    width_percent = 0.25,
    height_percent = 0.25,
    cursorline = true,
    select_callback = function(selected) os.execute(selected.script) end,
    data = data,
    format = function(data) return data.action end,
  })
end

return M
