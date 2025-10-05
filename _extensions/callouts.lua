-- callouts.lua (v2 - Corregido)

function Div(div)
  -- Manejar el bloque de ADVERTENCIA
  if div.classes:includes("callout-advertencia") then
    -- El título se define en el entorno de LaTeX, así que lo eliminamos del contenido.
    -- El título es el primer elemento del contenido del Div.
    table.remove(div.content, 1)

    -- Creamos una lista de Pandoc con el contenido restante del Div.
    local content_list = pandoc.List(div.content)
    -- Convertimos esa lista a texto LaTeX.
    local latex_content = pandoc.write(pandoc.Pandoc(content_list), 'latex')

    -- Devolvemos el bloque LaTeX crudo con nuestro entorno personalizado.
    return pandoc.RawBlock('latex', '\\begin{advertencia}\n' .. latex_content .. '\n\\end{advertencia}')
  end

  -- Manejar el bloque de CONCLUSIÓN
  if div.classes:includes("callout-conclusion") then
    -- En este caso, el bloque de conclusión no tiene un título explícito en el .qmd,
    -- por lo que simplemente procesamos todo su contenido.
    local content_list = pandoc.List(div.content)
    local latex_content = pandoc.write(pandoc.Pandoc(content_list), 'latex')

    -- Devolvemos el bloque LaTeX crudo.
    return pandoc.RawBlock('latex', '\\begin{conclusion}\n' .. latex_content .. '\n\\end{conclusion}')
  end

  -- Si no es ninguno de nuestros callouts personalizados, no hacemos nada.
  return div
end