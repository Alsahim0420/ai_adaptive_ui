import 'package:flutter/material.dart';
import '../core/adaptive_context.dart';

typedef LayoutBuilderFunction = Widget Function(BuildContext context);

class AdaptiveLayout extends StatelessWidget {
  final LayoutBuilderFunction? small;
  final LayoutBuilderFunction? medium;
  final LayoutBuilderFunction? large;

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

    // Fallback
    return Center(
      child: Text(
        'No layout defined for this screen size',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
