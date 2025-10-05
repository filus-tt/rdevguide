# 📚 Workflow Profesional para tu Libro

## 🎯 Objetivos del Workflow

1. **Escribir y revisar** con preview HTML interno
2. **Generar PDF** profesional para venta/impresión
3. **Generar EPUB** optimizado para venta digital
4. **NO publicar** versión HTML online (solo PDF y EPUB a la venta)

## 📁 Estructura del Proyecto

```
tu-libro/
├── _output/                      # Archivos generados (Git ignore)
│   ├── Tu-Libro.pdf             # PDF final
│   ├── Tu-Libro.epub            # EPUB final
│   └── Tu-Libro_YYYY-MM-DD.*    # Versiones con fecha
│
├── _extensions/                  # Extensiones Quarto
│   └── dialogos/
│       ├── _extension.yml
│       └── dialogos.lua
│
├── _fonts/                       # Tipografías
│   ├── LibertinusSerif-*.otf
│   ├── LibertinusSans-*.otf
│   └── FiraCode-*.ttf
│
├── chapters/                     # Capítulos del libro
│   ├── capitulo01.qmd
│   ├── capitulo02.qmd
│   └── ...
│
├── css/                          # Estilos
│   ├── dialogos.css             # Estilos base
│   ├── epub-custom.css          # Específico EPUB
│   ├── preview.css              # Marca de agua preview
│   └── theme-dark.scss          # Tema oscuro
│
├── html/                         # HTML includes
│   └── preview-watermark.html
│
├── img/                          # Imágenes
│   ├── cover.png                # Portada (1600x2400px)
│   └── favicon.png
│
├── scripts/                      # Scripts de construcción
│   ├── build.ps1                # Script principal
│   └── validate.ps1             # Validación de archivos
│
├── tex/                          # LaTeX
│   ├── fonts.tex
│   ├── preamble.tex
│   └── frontpage.tex
│
├── _quarto.yml                   # Configuración principal
├── index.qmd                     # Índice/Introducción
├── .gitignore
└── README.md
```

## 🔄 Workflow Diario

### 1. Escribir y Revisar (Modo Preview)

```bash
# Iniciar servidor de preview
quarto preview

# O usar el script
.\scripts\build.ps1 -Action preview
```

**Ventajas:**
- ✅ Ver cambios en tiempo real
- ✅ Preview rápido en el navegador
- ✅ Marca de agua "NO DISTRIBUIR"
- ✅ Los diálogos se ven estilizados
- ⚠️ Las tipografías son web fonts (no las finales)

### 2. Generar PDF para Revisar

```bash
# Generar solo PDF
quarto render --to pdf

# O usar el script (crea versión con fecha)
.\scripts\build.ps1 -Action pdf
```

**Uso:**
- Revisar tipografías finales
- Ver layout de impresión
- Compartir con correctores/editores
- Verificar saltos de página

### 3. Generar EPUB para Revisar

```bash
# Generar solo EPUB
quarto render --to epub

# O usar el script
.\scripts\build.ps1 -Action epub
```

**Uso:**
- Probar en lector de ebooks (Calibre, Apple Books)
- Verificar navegación por capítulos
- Revisar tipografías embebidas
- Comprobar imágenes y layout

### 4. Generar Versión Final (Venta)

```bash
# Generar PDF y EPUB finales
.\scripts\build.ps1 -Action all
```

**Resultado:**
- `_output/Tu-Libro.pdf` - Para venta/impresión
- `_output/Tu-Libro.epub` - Para venta digital
- `_output/Tu-Libro_2025-01-15.pdf` - Versión con fecha
- `_output/Tu-Libro_2025-01-15.epub` - Versión con fecha

## 🎨 Personalización de Formatos

### PDF (Impresión/Venta)
- **Tamaño:** A5 (común para libros)
- **Márgenes:** Asimétricos (más en interior)
- **Tipografías:** Libertinus personalizadas
- **Calidad:** Alta resolución

### EPUB (Digital/Venta)
- **Responsive:** Se adapta a pantalla
- **Tipografías:** Embebidas en el archivo
- **Navegación:** Índice interactivo
- **Compatible:** Con todos los lectores

### HTML (Solo Preview Interno)
- **NO se publica online**
- **Marca de agua:** "PREVIEW - NO DISTRIBUIR"
- **Advertencia:** Banner superior
- **Sin funciones sociales**

## 📋 Checklist Pre-Publicación

### Antes de Generar Versión Final:

- [ ] Todos los capítulos completados
- [ ] Revisión ortográfica completa
- [ ] Portada finalizada (1600x2400px, 300dpi)
- [ ] ISBN obtenido y añadido a `_quarto.yml`
- [ ] Metadatos actualizados (autor, descripción, keywords)
- [ ] Copyright y licencia especificados
- [ ] Índice generado correctamente
- [ ] Todos los enlaces funcionan
- [ ] Imágenes optimizadas
- [ ] Código probado y funcional

### Verificación de Formatos:

**PDF:**
- [ ] Todas las páginas se ven correctas
- [ ] Tipografías aplicadas correctamente
- [ ] No hay líneas viudas/huérfanas
- [ ] Saltos de página apropiados
- [ ] Índice con números de página correctos
- [ ] Metadatos del PDF completos

**EPUB:**
- [ ] Validado con EPUBCheck (sin errores)
- [ ] Probado en al menos 3 lectores diferentes
- [ ] Tipografías embebidas funcionan
- [ ] Navegación por capítulos correcta
- [ ] Imágenes se redimensionan bien
- [ ] Enlaces internos funcionan

## 🚀 Comandos Rápidos

```bash
# Preview mientras escribes
quarto preview

# Solo PDF
.\scripts\build.ps1 -Action pdf

# Solo EPUB
.\scripts\build.ps1 -Action epub

# Ambos formatos de venta
.\scripts\build.ps1 -Action all

# Limpiar temporales
.\scripts\build.ps1 -Action clean

# Verificar errores
quarto check
```

## 📦 Preparar para Venta

### 1. Archivos Finales

```
ventas/
├── Tu-Libro_v1.0.pdf          # PDF para Amazon KDP, Lulu, etc.
├── Tu-Libro_v1.0.epub         # EPUB para Apple Books, Google Play, etc.
├── cover.png                   # Portada individual (para tiendas)
├── preview.pdf                 # Primeras 20 páginas de muestra
└── metadata.txt                # Info para copiar/pegar en tiendas
```

### 2. Crear Archivos de Muestra

```bash
# Extraer primeras páginas del PDF (usando pdftk o similar)
pdftk _output/Tu-Libro.pdf cat 1-20 output ventas/preview.pdf
```

### 3. Metadatos para Tiendas

Crea `ventas/metadata.txt`:

```text
TÍTULO: Tu Libro
AUTOR: Tu Nombre
ISBN: 978-X-XXXX-XXXX-X

DESCRIPCIÓN:
[Copia la descripción de _quarto.yml aquí]

CATEGORÍAS:
- Categoría 1
- Categoría 2

PALABRAS CLAVE:
palabra1, palabra2, palabra3

IDIOMA: Español

PRECIO SUGERIDO:
- PDF: $X.XX USD
- EPUB: $X.XX USD

DERECHOS: © 2025 Tu Nombre. Todos los derechos reservados.
```

## 🛒 Plataformas de Venta Recomendadas

### Para PDF:

1. **Gumroad** (https://gumroad.com)
   - ✅ Fácil de usar
   - ✅ Acepta pagos internacionales
   - ✅ Entrega automática
   - ✅ Puedes vender directamente

2. **Lemon Squeezy** (https://lemonsqueezy.com)
   - ✅ Maneja impuestos automáticamente
   - ✅ Interfaz moderna
   - ✅ Buenos reportes

3. **Tu propio sitio web**
   - Stripe + descarga automática
   - Control total

### Para EPUB:

1. **Amazon Kindle Direct Publishing (KDP)**
   - Convertir EPUB a MOBI/KF8
   - Mayor audiencia

2. **Apple Books** (https://authors.apple.com)
   - Sube directamente el EPUB
   - Buena distribución

3. **Google Play Books** (https://play.google.com/books/publish)
   - EPUB nativo
   - Alcance global

4. **Kobo Writing Life** (https://www.kobo.com/us/en/p/writinglife)
   - EPUB directo
   - Alternativa a Amazon

## 🔒 Control de Versiones con Git

### .gitignore Recomendado

```gitignore
# Archivos generados
_output/
*.pdf
*.epub
*.html
_site/

# LaTeX temporales
*.aux
*.log
*.out
*.toc
*.lot
*.lof
*.bbl
*.blg
*.synctex.gz
*.fdb_latexmk
*.fls
*.tex

# Cache de Quarto
.quarto/
*_cache/
*_files/

# Sistema
.DS_Store
Thumbs.db
*.swp
*~

# Archivos personales
drafts/
notas_privadas.md

# MANTENER en Git:
# - .qmd files
# - _quarto.yml
# - css/
# - tex/
# - _fonts/
# - img/cover.png
# - scripts/
```

### Commits Sugeridos

```bash
# Después de completar un capítulo
git add chapters/capitulo01.qmd
git commit -m "feat: Capítulo 1 completado - Primera conversación"

# Después de revisar/editar
git commit -am "edit: Correcciones ortográficas capítulo 1"

# Al generar versión
git tag -a v1.0 -m "Versión 1.0 - Primera edición"
git push origin v1.0
```

## 📊 Workflow Visual

```
┌─────────────────┐
│  Escribir .qmd  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ quarto preview  │ ◄──── Preview HTML (interno)
│   (iterativo)   │       ⚠️ NO distribuir
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Revisión OK?  │──NO──► Seguir escribiendo
└────────┬────────┘
         │ SÍ
         ▼
┌─────────────────┐
│  build.ps1 pdf  │ ◄──── PDF para revisar
└────────┬────────┘       tipografías finales
         │
         ▼
┌─────────────────┐
│  Revisar PDF    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ build.ps1 epub  │ ◄──── EPUB para probar
└────────┬────────┘       en lectores
         │
         ▼
┌─────────────────┐
│  Probar EPUB    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Todo perfecto?  │──NO──► Hacer correcciones
└────────┬────────┘
         │ SÍ
         ▼
┌─────────────────┐
│  build.ps1 all  │ ◄──── Versión FINAL
└────────┬────────┘       PDF + EPUB
         │
         ▼
┌─────────────────┐
│  Subir a tienda │ ◄──── ¡A la venta! 💰
└─────────────────┘
```

## 🎓 Mejores Prácticas

### Durante la Escritura:

1. **Commits frecuentes** - Cada sesión de escritura
2. **Preview constante** - Ver cambios en tiempo real
3. **PDF semanal** - Verificar progreso y tipografías
4. **Backup externo** - GitHub/GitLab + backup local

### Antes de Publicar:

1. **Revisión completa** - Lee todo el libro en PDF
2. **Prueba EPUB** - En 3+ lectores diferentes
3. **Beta readers** - Pide feedback de 2-3 personas
4. **Validación técnica** - EPUBCheck sin errores
5. **Versión etiquetada** - Git tag para la versión

### Después de Publicar:

1. **Guarda los archivos fuente** - Todo el proyecto
2. **Archiva la versión vendida** - PDF/EPUB exactos
3. **Documenta errores** - Para segunda edición
4. **Track de ventas** - Qué versión está en cada tienda

## 🔧 Herramientas Adicionales Útiles

### Para Validación:

```bash
# Instalar EPUBCheck (validador oficial)
# https://github.com/w3c/epubcheck/releases

# Usar:
java -jar epubcheck.jar _output/Tu-Libro.epub
```

### Para Optimización:

```bash
# Comprimir PDF (si es muy grande)
# Usar herramientas como:
# - Adobe Acrobat
# - GhostScript
# - Online: smallpdf.com

# Optimizar EPUB
# Calibre: Edit Book > Tools > Check Book
```

### Para Conversión:

```bash
# Calibre (convertir entre formatos si necesario)
# https://calibre-ebook.com/

ebook-convert Tu-Libro.epub Tu-Libro.mobi
```

## 📈 Mejoras Futuras del Workflow

### Automatización Avanzada:

1. **GitHub Actions** - Build automático en cada push
2. **Pre-commit hooks** - Validación antes de commit
3. **Spell checker** - Integrar corrector ortográfico
4. **Auto-versionado** - Incrementar versión automáticamente

### Script de GitHub Actions (opcional):

```yaml
# .github/workflows/build-book.yml
name: Build Book

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Setup Quarto
        uses: quarto-dev/quarto-actions/setup@v2
      
      - name: Render Book
        run: |
          quarto render --to pdf
          quarto render --to epub
      
      - name: Upload Release
        uses: actions/upload-artifact@v2
        with:
          name: book-files
          path: |
            _output/*.pdf
            _output/*.epub
```

## 💡 Tips Pro

### Versionado Semántico:

```
v1.0.0 - Primera edición
v1.0.1 - Correcciones menores (typos)
v1.1.0 - Contenido nuevo (capítulo adicional)
v2.0.0 - Revisión mayor (reescritura)
```

### Pricing Strategy:

```
PDF:  $9.99 - $19.99  (valor por tipografías profesionales)
EPUB: $7.99 - $14.99  (ligeramente más barato)
Bundle: $14.99        (ambos con descuento)
```

### Marketing:

1. **Preview gratis** - Primeras 2-3 capítulos
2. **Landing page** - Con muestras visuales
3. **Email list** - Updates y descuentos
4. **Twitter/X** - Compartir progreso de escritura

## 🎯 Checklist Final

Antes de poner a la venta:

- [ ] Libro completo y revisado
- [ ] PDF generado y probado
- [ ] EPUB validado sin errores
- [ ] Portada profesional
- [ ] ISBN registrado
- [ ] Precio decidido
- [ ] Descripción atractiva escrita
- [ ] Preview/muestra generada
- [ ] Metadatos completos
- [ ] Archivos subidos a tiendas
- [ ] Landing page creada
- [ ] Plan de marketing básico
- [ ] Backup de todo guardado

---

## 🚀 Comando de Inicio Rápido

```bash
# Clonar estructura
git clone tu-repo
cd tu-libro

# Instalar dependencias (si usas)
# (Quarto ya incluye todo lo necesario)

# Comenzar a escribir
quarto preview

# Cuando termines un capítulo
git add .
git commit -m "feat: Capítulo X completado"

# Generar versión de venta
.\scripts\build.ps1 -Action all

# ¡Publicar y vender! 💰
```

---

**¡Tu workflow profesional está listo!** 🎉

Ahora puedes:
- ✅ Escribir con preview cómodo
- ✅ Generar PDF profesional
- ✅ Crear EPUB optimizado
- ✅ Vender ambos formatos
- ✅ NO publicar HTML online
- ✅ Mantener control de versiones

**¿Listo para empezar a escribir tu libro?** 📚✨