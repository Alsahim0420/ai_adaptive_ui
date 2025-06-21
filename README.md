# 🎨 AI Adaptive UI

[![pub package](https://img.shields.io/pub/v/ai_adaptive_ui.svg)](https://pub.dev/packages/ai_adaptive_ui)
[![likes](https://img.shields.io/pub/likes/ai_adaptive_ui)](https://pub.dev/packages/ai_adaptive_ui/score)
[![popularity](https://img.shields.io/pub/popularity/ai_adaptive_ui)](https://pub.dev/packages/ai_adaptive_ui/score)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Una librería Flutter moderna para construir interfaces adaptativas que responden automáticamente a diferentes tamaños de pantalla, orientaciones, idiomas y densidades de píxeles. Incluye widgets inteligentes como `AdaptiveLayout`, `AdaptiveCard`, y un módulo opcional para generar layouts sugeridos por IA.

## ✨ Características

- 🎯 **Diseño Responsivo Automático**: Se adapta a móviles, tablets y desktop
- 🌍 **Soporte Multiidioma**: Detecta automáticamente el idioma del dispositivo
- 🌙 **Tema Adaptativo**: Soporte nativo para modo claro/oscuro
- 📱 **Orientación Dinámica**: Optimizado para portrait y landscape
- 🤖 **Sugerencias de IA**: Módulo opcional para layouts generados por IA
- ⚡ **Rendimiento Optimizado**: Widgets ligeros y eficientes
- 🎨 **Material Design 3**: Compatible con la última versión de Material

## 🚀 Instalación

Agrega la dependencia a tu `pubspec.yaml`:

```yaml
dependencies:
  ai_adaptive_ui: ^1.0.0
```

O instala directamente desde la línea de comandos:

```bash
flutter pub add ai_adaptive_ui
```

## 📱 Captura de Pantalla

![AI Adaptive UI Demo](https://via.placeholder.com/800x400/6366f1/ffffff?text=AI+Adaptive+UI+Demo)

*La aplicación se adapta automáticamente: ListView en móviles, Row en tablets, y GridView en desktop*

## 💻 Ejemplo de Uso

```dart
import 'package:flutter/material.dart';
import 'package:ai_adaptive_ui/ai_adaptive_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Adaptive UI Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎨 AI Adaptive UI Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AdaptiveLayout(
          // Layout para pantallas pequeñas (móviles)
          small: (context) => Column(
            children: [
              AdaptiveCard(
                title: '🌟 Características Principales',
                subtitle: 'Diseño adaptativo inteligente',
                icon: Icons.auto_awesome,
                onTap: () => print('¡Tocado!'),
              ),
              AdaptiveCard(
                title: '⚡ Rendimiento Optimizado',
                subtitle: 'Widgets ligeros y eficientes',
                icon: Icons.speed,
                onTap: () => print('¡Tocado!'),
              ),
            ],
          ),
          // Layout para pantallas medianas (tablets)
          medium: (context) => Row(
            children: [
              Expanded(child: AdaptiveCard(
                title: '🌟 Características Principales',
                subtitle: 'Diseño adaptativo inteligente',
                icon: Icons.auto_awesome,
                onTap: () => print('¡Tocado!'),
              )),
              Expanded(child: AdaptiveCard(
                title: '⚡ Rendimiento Optimizado',
                subtitle: 'Widgets ligeros y eficientes',
                icon: Icons.speed,
                onTap: () => print('¡Tocado!'),
              )),
            ],
          ),
          // Layout para pantallas grandes (desktop)
          large: (context) => GridView.count(
            crossAxisCount: 3,
            children: [
              AdaptiveCard(
                title: '🌟 Características Principales',
                subtitle: 'Diseño adaptativo inteligente',
                icon: Icons.auto_awesome,
                onTap: () => print('¡Tocado!'),
              ),
              AdaptiveCard(
                title: '⚡ Rendimiento Optimizado',
                subtitle: 'Widgets ligeros y eficientes',
                icon: Icons.speed,
                onTap: () => print('¡Tocado!'),
              ),
              AdaptiveCard(
                title: '📊 Estadísticas',
                subtitle: 'Análisis en tiempo real',
                icon: Icons.analytics,
                onTap: () => print('¡Tocado!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## 🔧 Widgets Principales

### AdaptiveLayout
Widget inteligente que cambia automáticamente el layout según el tamaño de pantalla:

```dart
AdaptiveLayout(
  small: (context) => Column(...),    // < 600px
  medium: (context) => Row(...),      // 600px - 1024px
  large: (context) => GridView(...),  // > 1024px
)
```

### AdaptiveCard
Tarjeta que se adapta automáticamente al tamaño de pantalla:

```dart
AdaptiveCard(
  title: 'Título de la Tarjeta',
  subtitle: 'Descripción de la tarjeta',
  icon: Icons.star,
  onTap: () => print('¡Tocado!'),
)
```

### AdaptiveContext
Helper para acceder a información del contexto de manera fácil:

```dart
final adaptive = AdaptiveContext(context);
print('Ancho: ${adaptive.width}');
print('Es pantalla pequeña: ${adaptive.isSmallScreen}');
print('Modo oscuro: ${adaptive.isDarkMode}');
```

## 📚 Documentación Técnica

### Breakpoints
- **Small**: < 600px (móviles)
- **Medium**: 600px - 1024px (tablets)
- **Large**: > 1024px (desktop)

### Propiedades de AdaptiveContext
- `width`, `height`: Dimensiones de pantalla
- `orientation`: Orientación del dispositivo
- `brightness`: Tema claro/oscuro
- `locale`: Idioma del dispositivo
- `isSmallScreen`, `isMediumScreen`, `isLargeScreen`: Helpers de breakpoint

### Parámetros de AdaptiveCard
- `title` (String, requerido): Título de la tarjeta
- `subtitle` (String, requerido): Subtítulo de la tarjeta
- `icon` (IconData, opcional): Ícono de la tarjeta
- `onTap` (VoidCallback, opcional): Callback al tocar

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Para contribuir:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 🙏 Créditos

- **Material Design**: Google Material Design 3
- **Flutter**: Framework de desarrollo de Google

## 🔗 Enlaces Útiles

- 📖 [Documentación completa](https://pub.dev/documentation/ai_adaptive_ui)
- 🐛 [Reportar un bug](https://github.com/tu-usuario/ai_adaptive_ui/issues)
- 💡 [Solicitar feature](https://github.com/tu-usuario/ai_adaptive_ui/issues)


---

⭐ **¿Te gusta este proyecto? ¡Dale una estrella en GitHub!**
