import 'package:flutter/material.dart';
import '../core/adaptive_context.dart';

/// Una tarjeta que adapta su layout según el tamaño de la pantalla.
///
/// En pantallas pequeñas (`isSmallScreen`), muestra un layout de [Column].
/// En pantallas más grandes, muestra un layout de [Row].
///
/// Ejemplo:
/// ```dart
/// AdaptiveCard(
///   title: 'Título de la Tarjeta',
///   subtitle: 'Este es el subtítulo de la tarjeta.',
///   icon: Icons.star,
///   onTap: () => print('Tarjeta presionada!'),
/// )
/// ```
class AdaptiveCard extends StatelessWidget {
  /// El título principal de la tarjeta.
  final String title;

  /// El subtítulo o texto descriptivo de la tarjeta.
  final String subtitle;

  /// El ícono que se muestra en la tarjeta.
  final IconData icon;

  /// La función a ejecutar cuando se presiona la tarjeta.
  final VoidCallback? onTap;

  /// Crea una instancia de [AdaptiveCard].
  const AdaptiveCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.more_horiz,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final adaptive = AdaptiveContext(context);

    final isCompact = adaptive.isSmallScreen;

    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: isCompact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, size: 32),
                    const SizedBox(height: 8),
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    Text(subtitle,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                )
              : Row(
                  children: [
                    Icon(icon, size: 48),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(subtitle,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
