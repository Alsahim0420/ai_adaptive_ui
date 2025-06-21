# Changelog

Todas las notables mejoras y cambios en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
y este proyecto adhiere al [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-01-20

### Added
- 🎉 **Primera versión publicada** de `ai_adaptive_ui`
- 🎯 **AdaptiveLayout**: Widget inteligente que cambia automáticamente el layout según el tamaño de pantalla
  - Soporte para breakpoints: small (< 600px), medium (600px-1024px), large (> 1024px)
  - API simple con funciones builder para cada breakpoint
  - Fallback elegante cuando no se define un layout
- 🃏 **AdaptiveCard**: Widget de tarjeta reutilizable y responsivo
  - Diseño adaptativo que cambia entre layout vertical y horizontal
  - Soporte para título, subtítulo, ícono y callback de toque
  - Integración automática con el tema de Material Design 3
- 🔧 **AdaptiveContext**: Helper para acceder a información del contexto
  - Propiedades de pantalla (width, height, orientation)
  - Detección de tema (claro/oscuro)
  - Información de localización y dirección de texto
  - Helpers de breakpoint (isSmallScreen, isMediumScreen, isLargeScreen)
- 📦 **Estructura modular** preparada para futuras expansiones
  - Carpeta `ai_suggestions/` lista para integración con IA
  - Arquitectura escalable para nuevos widgets adaptativos
  - Exportaciones organizadas en el archivo principal

### Technical Details
- **Dependencias**: Flutter SDK >= 3.3.4
- **Compatibilidad**: Material Design 3, Flutter 1.17.0+
- **Rendimiento**: Widgets optimizados y ligeros
- **Documentación**: README completo con ejemplos y documentación técnica

### Breaking Changes
- Ninguna (primera versión)

### Deprecated
- Ninguna

### Removed
- Ninguna

### Fixed
- Ninguna

### Security
- Ninguna vulnerabilidad conocida

---

## [Unreleased]

### Planned
- 🤖 **AiLayoutSuggestor**: Módulo para generar layouts sugeridos por IA
- 🌍 **Soporte multiidioma mejorado**: Detección automática y adaptación de contenido
- 🎨 **Temas personalizables**: Sistema de temas adaptativos avanzado
- 📱 **Orientación dinámica**: Optimizaciones específicas para portrait/landscape
- ⚡ **Rendimiento mejorado**: Optimizaciones adicionales para widgets complejos

### In Progress
- Documentación de API completa
- Ejemplos adicionales para casos de uso específicos
- Tests unitarios y de integración

---

## Notas de Versión

### Convenciones de Versionado
- **MAJOR.MINOR.PATCH** (ej: 1.2.3)
- **MAJOR**: Cambios incompatibles con versiones anteriores
- **MINOR**: Nuevas funcionalidades compatibles hacia atrás
- **PATCH**: Correcciones de bugs compatibles hacia atrás

### Contribución
Para contribuir al changelog, sigue las convenciones de [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

### Enlaces
- [GitHub Repository](https://github.com/Alsahim0420/ai_adaptive_ui)
- [Pub.dev Package](https://pub.dev/packages/ai_adaptive_ui)
- [Documentation](https://pub.dev/documentation/ai_adaptive_ui)
