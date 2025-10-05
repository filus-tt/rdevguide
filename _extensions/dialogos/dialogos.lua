-- Filtro Lua para convertir bloques Div en entornos LaTeX
-- Archivo: _extensions/dialogos/dialogos.lua

function Div(el)
  -- Solo procesar para formato LaTeX/PDF
  if not FORMAT:match 'latex' then
    return el
  end
  
  -- Verificar si el Div tiene la clase 'dialogofilus'
  if el.classes:includes('dialogofilus') then
    -- Crear el comando LaTeX de inicio
    local latex_begin = '\\begin{dialogofilus}\n'
    local latex_end = '\n\\end{dialogofilus}'
    
    -- Convertir el contenido del Div a LaTeX
    local content = pandoc.write(pandoc.Pandoc(el.content), 'latex')
    
    -- Retornar como RawBlock de LaTeX
    return pandoc.RawBlock('latex', latex_begin .. content .. latex_end)
  end
  
  -- Verificar si el Div tiene la clase 'dialogoaisa'
  if el.classes:includes('dialogoaisa') then
    local latex_begin = '\\begin{dialogoaisa}\n'
    local latex_end = '\n\\end{dialogoaisa}'
    
    local content = pandoc.write(pandoc.Pandoc(el.content), 'latex')
    
    return pandoc.RawBlock('latex', latex_begin .. content .. latex_end)
  end
  
  -- Si no es ninguno de los anteriores, retornar sin cambios
  return el
end

-- Retornar la lista de filtros
return {
  { Div = Div }
}