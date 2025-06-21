import 'package:flutter/material.dart';
import '../core/adaptive_context.dart';

/// Un builder de layout que recibe el [BuildContext] y devuelve un [Widget].
typedef LayoutBuilderFunction = Widget Function(BuildContext context);

/// Un widget que construye un layout diferente según el tamaño de la pantalla.
///
/// Proporciona constructores para `small`, `medium` y `large`, y selecciona
/// automáticamente cuál usar basándose en los breakpoints definidos en [AdaptiveContext].
///
/// Ejemplo:
/// ```dart
/// AdaptiveLayout(
///   small: (context) => Text('Layout Pequeño'),
///   medium: (context) => Text('Layout Mediano'),
///   large: (-context) => Text('Layout Grande'),
/// )
/// ```
class AdaptiveLayout extends StatelessWidget {
  /// El builder para el layout de pantalla pequeña (< 600px).
  final LayoutBuilderFunction? small;

  /// El builder para el layout de pantalla mediana (600px - 1024px).
  final LayoutBuilderFunction? medium;

  /// El builder para el layout de pantalla grande (> 1024px).
  final LayoutBuilderFunction? large;

  /// Crea una instancia de [AdaptiveLayout].
  ///
  /// Debes proporcionar al menos un builder de layout (`small`, `medium` o `large`).
  const AdaptiveLayout({
    super.key,
    this.small,
    this.medium,
    this.large,
  });

  @override
  Widget build(BuildContext context) {
    final adaptive = AdaptiveContext(context);

    if (adaptive.isSmallScreen && small != null) {
      return small!(context);
    } else if (adaptive.isMediumScreen && medium != null) {
      return medium!(context);
    } else if (adaptive.isLargeScreen && large != null) {
      return large!(context);
    }

    // Fallback si no se proporciona un layout para el tamaño actual.
    // Intenta usar el más pequeño disponible como última opción.
    if (small != null) return small!(context);
    if (medium != null) return medium!(context);
    if (large != null) return large!(context);

    return const Center(
      child: Text('No layout defined for this screen size'),
    );
  }
}
