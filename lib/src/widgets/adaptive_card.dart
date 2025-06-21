import 'package:flutter/material.dart';
import '../core/adaptive_context.dart';

class AdaptiveCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

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
