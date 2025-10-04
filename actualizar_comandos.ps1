# Script para actualizar comandos de diálogos en archivos .qmd
# Ejecutar desde la raíz del proyecto

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "Actualizando comandos de diálogos..." -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Buscar todos los archivos .qmd
$archivos = Get-ChildItem -Path . -Filter *.qmd -Recurse

if ($archivos.Count -eq 0) {
    Write-Host "No se encontraron archivos .qmd" -ForegroundColor Red
    exit
}

Write-Host "Archivos encontrados: $($archivos.Count)" -ForegroundColor Green
Write-Host ""

foreach ($archivo in $archivos) {
    Write-Host "Procesando: $($archivo.Name)" -ForegroundColor Yellow
    
    # Leer contenido
    $contenido = Get-Content $archivo.FullName -Raw -Encoding UTF8
    $original = $contenido
    
    # Hacer reemplazos
    $contenido = $contenido -replace '\\filus\{', '\filustext{'
    $contenido = $contenido -replace '\\aisa\{', '\aisatext{'
    $contenido = $contenido -replace '\\begin\{filus\}', '\begin{dialogofilus}'
    $contenido = $contenido -replace '\\end\{filus\}', '\end{dialogofilus}'
    $contenido = $contenido -replace '\\begin\{aisa\}', '\begin{dialogoaisa}'
    $contenido = $contenido -replace '\\end\{aisa\}', '\end{dialogoaisa}'
    
    # Solo guardar si hubo cambios
    if ($contenido -ne $original) {
        # Crear backup
        $backup = $archivo.FullName + ".backup"
        Copy-Item $archivo.FullName $backup
        Write-Host "  ✓ Backup creado: $($archivo.Name).backup" -ForegroundColor Gray
        
        # Guardar cambios
        Set-Content $archivo.FullName -Value $contenido -Encoding UTF8
        Write-Host "  ✓ Actualizado exitosamente" -ForegroundColor Green
    } else {
        Write-Host "  - Sin cambios necesarios" -ForegroundColor Gray
    }
    Write-Host ""
}

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "Proceso completado!" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Próximo paso: quarto render --to pdf" -ForegroundColor Yellow