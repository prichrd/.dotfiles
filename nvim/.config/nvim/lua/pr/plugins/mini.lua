return {
  {
    "echasnovski/mini.completion",
    opts = {},
  },
  {
    "echasnovski/mini.cursorword",
    opts = {},
  },
  {
    "echasnovski/mini.trailspace",
    opts = {},
  },
  {
    "echasnovski/mini.align",
    opts = {},
  },
  {
    "echasnovski/mini.comment",
    opts = {},
  },
  {
    "echasnovski/mini.bracketed",
    opts = {},
  },
  {
    "echasnovski/mini.splitjoin",
    opts = {},
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 0,
        animation = function()
          return 0
        end,
      },
      symbol = "│",
    },
  },
  {
    "echasnovski/mini.clue",
    opts = {
      triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = '[' },
        { mode = 'x', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'x', keys = ']' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
      },
      window = {
        delay = 100,
      }
    },
  },
}
