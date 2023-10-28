local function capitalise(text)
  text:gsub("(%a)(%w*)", function(a,b) return a:upper()..b:lower() end)
  return text
end

return { capitalise = capitalise }
