part of 'theme.dart';

final lightColorPalette = generatePaletteForBrightness(Brightness.light);
final darkColorPalette = generatePaletteForBrightness(Brightness.dark);

final AppTypography defaultTypography = AppTypography(
  displayLarge: _material2021.displayLarge!,
  displayMedium: _material2021.displayMedium!,
  displaySmall: _material2021.displaySmall!,
  headlineLarge: _material2021.headlineLarge!,
  headlineMedium: _material2021.headlineMedium!,
  headlineSmall: _material2021.headlineSmall!,
  titleLarge: _material2021.titleLarge!,
  titleMedium: _material2021.titleMedium!,
  titleSmall: _material2021.titleSmall!,
  bodyLarge: _material2021.bodyLarge!,
  bodyMedium: _material2021.bodyMedium!,
  bodySmall: _material2021.bodySmall!,
  labelLarge: _material2021.labelLarge!,
  labelMedium: _material2021.labelMedium!,
  labelSmall: _material2021.labelSmall!,
);

/// Creates a [ThemeData] object based on the provided [ColorPalette] and [AppTypography].
///
/// The [brightness] parameter is used to determine the brightness of the theme.
ThemeData createThemeData({
  required ColorPalette palette,
  required AppTypography typography,
  required Brightness brightness,
}) =>
    ThemeData(
      brightness: brightness,
      extensions: {palette, typography},
    );

ColorPalette generatePaletteForBrightness(Brightness brightness) {
  final materialPalette = ColorScheme.fromSeed(
    seedColor: Colors.transparent,
    dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
    brightness: brightness,
  );
  if (brightness == Brightness.dark) {
    return ColorPalette(
      background: const Color(0xFF323437),
      foreground: const Color(0xFF2C2E31),
      muted: const Color(0xFF646669),
      primary: const Color(0xFFE2B712),
      secondary: const Color(0xFFD1D0C5),
      primaryForeground: const Color(0xFF323437),
      destructive: const Color(0xFFCA4754),
      mutedForeground: const Color(0xFFA8A7A0),
      border: materialPalette.onSurface.withOpacity(.24),
      secondaryForeground: materialPalette.onSecondary,
      accent: materialPalette.tertiary,
      accentForeground: materialPalette.onTertiary,
      destructiveForeground: materialPalette.onError,
      ring: const Color.fromARGB(255, 60, 139, 250),
    );
  } else {
    return ColorPalette(
      background: const Color(0xFF323437),
      foreground: const Color(0xFF2C2E31),
      muted: const Color(0xFF646669),
      primary: const Color(0xFFE2B712),
      secondary: const Color(0xFFD1D0C5),
      primaryForeground: const Color(0xFF323437),
      destructive: const Color(0xFFCA4754),
      mutedForeground: const Color(0xFFA8A7A0),
      border: materialPalette.onSurface.withOpacity(.24),
      secondaryForeground: materialPalette.onSecondary,
      accent: materialPalette.tertiary,
      accentForeground: materialPalette.onTertiary,
      destructiveForeground: materialPalette.onError,
      ring: const Color.fromARGB(255, 60, 139, 250),
    );
  }
}

// use default styles from material2021
final _material2021 = Typography.material2021().tall;
