require('mini.ai').setup{}
require('mini.align').setup{}
require('mini.comment').setup{}
require('mini.completion').setup{}
require('mini.cursorword').setup{}
require('mini.jump').setup{}
require('mini.jump2d').setup{}
require('mini.pairs').setup{}
require('mini.statusline').setup{}
require('mini.surround').setup{
  mappings = {
    add = 'ca', -- Add surrounding in Normal and Visual modes
    delete = 'ds', -- Delete surrounding
    find = 'cf', -- Find surrounding (to the right)
    find_left = 'cF', -- Find surrounding (to the left)
    highlight = 'ch', -- Highlight surrounding
    replace = 'cs', -- Replace surrounding
    update_n_lines = 'cn', -- Update `n_lines`
    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  }
}
require('mini.trailspace').setup{}
require('mini.indentscope').setup{
  draw = {
    delay = 0,
    animation = function() return 0 end,
  }
}

