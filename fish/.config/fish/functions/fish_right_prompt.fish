function fish_right_prompt --description 'Write the right prompt'
  set_color 666666
  printf '%s' (date +%H:%M:%S)
  set_color normal
end
