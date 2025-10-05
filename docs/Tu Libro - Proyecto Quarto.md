# 📚 Tu Libro - Proyecto Quarto

> Libro escrito en Quarto con tipografías personalizadas y sistema de diálogos entre Filus (humano) y Aisa (IA).

## 🎯 Objetivo

Este proyecto genera dos formatos de venta:
- **PDF** - Con tipografías profesionales Libertinus y Fira Code
- **EPUB** - Optimizado para lectores digitales

**NO se publica versión HTML online** - Solo preview interno para el autor.

## 🚀 Inicio Rápido

```bash
# 1. Clonar repositorio
git clone [tu-repo-url]
cd tu-libro

# 2. Instalar Quarto (si no lo tienes)
# https://quarto.org/docs/get-started/

# 3. Preview mientras escribes
quarto preview

# 4. Generar PDF y EPUB finales
.\scripts\build.ps1 -Action all
```

## 📁 Estructura

```
tu-libro/
├── chapters/           # Capítulos del libro (.qmd)
├── _fonts/            # Tipografías personalizadas
├── css/               # Estilos (HTML y EPUB)
├── tex/               # Configuración LaTeX (PDF)
├── _extensions/       # Filtro Lua para diálogos
├── scripts/           # Scripts de construcción
└── _quarto.yml        # Configuración principal
```

## ✍️ Escribir Diálogos

### Diálogos cortos (comandos LaTeX - solo PDF):

```markdown
\filustext{Pregunta breve de Filus}

\aisatext{Respuesta breve de Aisa}
```

### Diálogos largos (bloques Div - HTML y PDF):

```markdown
::: {.dialogofilus}
Diálogo extenso de Filus.
Múltiples párrafos aquí.
:::

::: {.dialogoaisa}
Respuesta de Aisa.
También con varios párrafos.
:::
```

## 🎨 Tipografías

| Personaje/Uso | Tipografía | Color |
|---------------|------------|-------|
| Filus (humano) | Libertinus Serif | Azul oscuro |
| Aisa (IA) | Libertinus Sans | Azul |
| Código | Fira Code | Negro |
| Títulos | Libertinus Sans Bold | Negro |
| Texto general | Libertinus Serif | Negro |

## 🔧 Comandos

```bash
# Preview HTML (interno)
quarto preview

# Solo PDF
.\scripts\build.ps1 -Action pdf

# Solo EPUB
.\scripts\build.ps1 -Action epub

# Ambos formatos
.\scripts\build.ps1 -Action all

# Limpiar temporales
.\scripts\build.ps1 -Action clean
```

## 📦 Archivos de Salida

Los archivos generados aparecen en `_output/`:

- `Tu-Libro.pdf` - PDF final
- `Tu-Libro.epub` - EPUB final
- `Tu-Libro_YYYY-MM-DD.*` - Versiones con fecha

## 🛠️ Requisitos

- [Quarto](https://quarto.org/) >= 1.2.0
- [LuaLaTeX](https://www.luatex.org/) (incluido en TeX Live o MiKTeX)
- PowerShell (para scripts de build)

## 📝 Workflow de Escritura

1. **Escribir** - Usa `quarto preview` para ver cambios
2. **Revisar** - Genera PDF periódicamente para verificar tipografías
3. **Probar EPUB** - Verifica en lectores digitales
4. **Publicar** - Genera versión final con `build.ps1 -Action all`

## 🔒 Control de Versiones

```bash
# Después de cada capítulo
git add chapters/capitulo-X.qmd
git commit -m "feat: Capítulo X completado"

# Al publicar una versión
git tag -a v1.0 -m "Primera edición"
git push origin v1.0
```

## 📖 Documentación

Ver `WORKFLOW_PROFESIONAL.md` para guía completa de:
- Preparación para venta
- Plataformas recomendadas
- Checklist de publicación
- Mejores prácticas

## 🐛 Solución de Problemas

### Error: "Font not found"
Verifica que las fuentes estén en `_fonts/` con nombres exactos.

### EPUB no válido
Ejecuta: `java -jar epubcheck.jar _output/Tu-Libro.epub`

### PDF con tipografías incorrectas
Asegúrate de usar `pdf-engine: lualatex` en `_quarto.yml`

## 📄 Licencia

© 2025 Tu Nombre. Todos los derechos reservados.

El código fuente del proyecto está bajo licencia MIT.
El contenido del libro tiene todos los derechos reservados.

## 🤝 Contribuir

Este es un proyecto personal. No se aceptan contribuciones externas.

## 📧 Contacto

- Email: tu@email.com
- Web: https://tuweb.com
- Twitter: @tuusuario

---

**Versión del proyecto:** 1.0.0  
**Última actualización:** 2025-01-15