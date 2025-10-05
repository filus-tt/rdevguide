# Scripts de construcción para el libro
# Guardar como: scripts/build.ps1

param(
    [ValidateSet('preview', 'pdf', 'epub', 'all', 'clean')]
    [string]$Action = 'preview'
)

$ErrorActionPreference = "Stop"

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  Workflow del Libro - $Action" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

function Show-Menu {
    Write-Host "Opciones disponibles:" -ForegroundColor Yellow
    Write-Host "  1. preview  - Ver preview HTML (solo para ti)" -ForegroundColor White
    Write-Host "  2. pdf      - Generar PDF para venta" -ForegroundColor White
    Write-Host "  3. epub     - Generar EPUB para venta" -ForegroundColor White
    Write-Host "  4. all      - Generar PDF y EPUB" -ForegroundColor White
    Write-Host "  5. clean    - Limpiar archivos temporales" -ForegroundColor White
    Write-Host ""
}

function Build-Preview {
    Write-Host "🔍 Iniciando preview HTML..." -ForegroundColor Green
    Write-Host "   (Solo para revisión interna - NO distribuir)" -ForegroundColor Yellow
    Write-Host ""
    
    quarto preview
}

function Build-PDF {
    Write-Host "📄 Generando PDF para venta..." -ForegroundColor Green
    Write-Host ""
    
    # Renderizar PDF
    quarto render --to pdf
    
    if ($LASTEXITCODE -eq 0) {
        $pdfPath = "_output\Tu-Libro.pdf"
        if (Test-Path $pdfPath) {
            $fileSize = (Get-Item $pdfPath).Length / 1MB
            Write-Host ""
            Write-Host "✅ PDF generado exitosamente!" -ForegroundColor Green
            Write-Host "   Ubicación: $pdfPath" -ForegroundColor White
            Write-Host "   Tamaño: $([math]::Round($fileSize, 2)) MB" -ForegroundColor White
            Write-Host ""
            
            # Agregar fecha al nombre
            $timestamp = Get-Date -Format "yyyy-MM-dd"
            $versionedPath = "_output\Tu-Libro_$timestamp.pdf"
            Copy-Item $pdfPath $versionedPath
            Write-Host "   Copia versionada: $versionedPath" -ForegroundColor Cyan
        }
    } else {
        Write-Host "❌ Error al generar PDF" -ForegroundColor Red
        exit 1
    }
}

function Build-EPUB {
    Write-Host "📱 Generando EPUB para venta..." -ForegroundColor Green
    Write-Host ""
    
    # Renderizar EPUB
    quarto render --to epub
    
    if ($LASTEXITCODE -eq 0) {
        $epubPath = "_output\Tu-Libro.epub"
        if (Test-Path $epubPath) {
            $fileSize = (Get-Item $epubPath).Length / 1MB
            Write-Host ""
            Write-Host "✅ EPUB generado exitosamente!" -ForegroundColor Green
            Write-Host "   Ubicación: $epubPath" -ForegroundColor White
            Write-Host "   Tamaño: $([math]::Round($fileSize, 2)) MB" -ForegroundColor White
            Write-Host ""
            
            # Validar EPUB (si tienes epubcheck instalado)
            if (Get-Command "epubcheck" -ErrorAction SilentlyContinue) {
                Write-Host "🔍 Validando EPUB..." -ForegroundColor Yellow
                epubcheck $epubPath
            }
            
            # Agregar fecha al nombre
            $timestamp = Get-Date -Format "yyyy-MM-dd"
            $versionedPath = "_output\Tu-Libro_$timestamp.epub"
            Copy-Item $epubPath $versionedPath
            Write-Host "   Copia versionada: $versionedPath" -ForegroundColor Cyan
        }
    } else {
        Write-Host "❌ Error al generar EPUB" -ForegroundColor Red
        exit 1
    }
}

function Build-All {
    Write-Host "🚀 Generando TODOS los formatos de venta..." -ForegroundColor Green
    Write-Host ""
    
    Build-PDF
    Write-Host ""
    Build-EPUB
    
    Write-Host ""
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host "✅ Todos los formatos generados!" -ForegroundColor Green
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "📦 Archivos listos para venta:" -ForegroundColor Yellow
    Get-ChildItem "_output\*.pdf", "_output\*.epub" | ForEach-Object {
        $size = $_.Length / 1MB
        Write-Host "   - $($_.Name) ($([math]::Round($size, 2)) MB)" -ForegroundColor White
    }
}

function Clean-Files {
    Write-Host "🧹 Limpiando archivos temporales..." -ForegroundColor Yellow
    Write-Host ""
    
    # Limpiar archivos LaTeX temporales
    $tempFiles = @("*.aux", "*.log", "*.out", "*.toc", "*.lot", "*.lof", "*.bbl", "*.blg")
    foreach ($pattern in $tempFiles) {
        Get-ChildItem -Filter $pattern -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Write-Host "   Eliminados: $pattern" -ForegroundColor Gray
    }
    
    # Limpiar cache de Quarto
    if (Test-Path ".quarto") {
        Remove-Item ".quarto" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "   Eliminado: .quarto/" -ForegroundColor Gray
    }
    
    Write-Host ""
    Write-Host "✅ Limpieza completada!" -ForegroundColor Green
}

# Ejecutar acción
switch ($Action) {
    'preview' { Build-Preview }
    'pdf' { Build-PDF }
    'epub' { Build-EPUB }
    'all' { Build-All }
    'clean' { Clean-Files }
    default { 
        Show-Menu
        Write-Host "Uso: .\build.ps1 -Action <opción>" -ForegroundColor Yellow
    }
}

Write-Host ""