local has_ftconf, ftconf = pcall(require, "ftconf")
if not has_ftconf then
  return
end

local cfg = {}
require('lang.all').config_ftconf(cfg)
ftconf.setup(cfg)
