import 'package:flutter/material.dart';

class AdaptiveContext {
  final BuildContext context;
  late final MediaQueryData _mediaQuery;

  AdaptiveContext(this.context) {
    _mediaQuery = MediaQuery.of(context);
  }

  double get width => _mediaQuery.size.width;
  double get height => _mediaQuery.size.height;
  Orientation get orientation => _mediaQuery.orientation;
  Brightness get brightness => _mediaQuery.platformBrightness;
  double get pixelRatio => _mediaQuery.devicePixelRatio;
  bool get isDarkMode => brightness == Brightness.dark;
  Locale get locale => Localizations.localeOf(context);
  TextDirection get textDirection => Directionality.of(context);

  bool get isSmallScreen => width < 600;
  bool get isMediumScreen => width >= 600 && width < 1024;
  bool get isLargeScreen => width >= 1024;
}
