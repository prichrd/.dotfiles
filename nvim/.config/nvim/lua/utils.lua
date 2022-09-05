local M = {}

M.preq = function(package)
  local exists, pak = pcall(require, package)
  return exists, pak
end

M.exists = function(...)
  for i = 1, select('#', ...) do
    local exists, _ = pcall(require, select(i, ...))
    if not exists then
      return false
    end
  end
  return true
end

M.append = function(a, b)
  for _, v in ipairs(b) do
    table.insert(a, v)
  end
end

M.merge_structs = function(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == 'table' then
      t1[k] = M.merge_structs(t1[k], t2[k])
    else
      t1[k] = v
    end
  end

  return t1
end

return M
