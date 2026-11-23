-- Convert ```mermaid code blocks into <pre class="mermaid"> so the
-- mermaid.js script loaded via mermaid-header.html renders them.
local function is_mermaid(el)
  for _, cls in ipairs(el.classes) do
    if cls == "mermaid" then
      return true
    end
  end
  return false
end

function CodeBlock(el)
  if is_mermaid(el) then
    return pandoc.RawBlock("html",
      "<pre class=\"mermaid\">\n" .. el.text .. "\n</pre>\n")
  end
end
