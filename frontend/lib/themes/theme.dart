import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff5d5f5f),
      surfaceTint: Color(0xff5d5f5f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffffff),
      onPrimaryContainer: Color(0xff575859),
      secondary: Color(0xff8b500d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffcae66),
      onSecondaryContainer: Color(0xff4c2800),
      tertiary: Color(0xff6f5d00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffe890),
      onTertiaryContainer: Color(0xff594b00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffcf8f8),
      onBackground: Color(0xff1c1b1b),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      surfaceVariant: Color(0xffe0e3e3),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inverseOnSurface: Color(0xfff4f0ef),
      inversePrimary: Color(0xffc6c6c7),
      primaryFixed: Color(0xffe2e2e2),
      onPrimaryFixed: Color(0xff1a1c1c),
      primaryFixedDim: Color(0xffc6c6c7),
      onPrimaryFixedVariant: Color(0xff454747),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff2d1600),
      secondaryFixedDim: Color(0xffffb876),
      onSecondaryFixedVariant: Color(0xff6b3b00),
      tertiaryFixed: Color(0xfffde276),
      onTertiaryFixed: Color(0xff221b00),
      tertiaryFixedDim: Color(0xffdfc65d),
      onTertiaryFixedVariant: Color(0xff544600),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff414343),
      surfaceTint: Color(0xff5d5f5f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff737575),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff663700),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa56623),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4f4200),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff88730e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffcf8f8),
      onBackground: Color(0xff1c1b1b),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      surfaceVariant: Color(0xffe0e3e3),
      onSurfaceVariant: Color(0xff404344),
      outline: Color(0xff5c6060),
      outlineVariant: Color(0xff787b7c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inverseOnSurface: Color(0xfff4f0ef),
      inversePrimary: Color(0xffc6c6c7),
      primaryFixed: Color(0xff737575),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5a5c5c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffa56623),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff884e0a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff88730e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6c5b00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff202323),
      surfaceTint: Color(0xff5d5f5f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff414343),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff371b00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff663700),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2a2200),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4f4200),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffcf8f8),
      onBackground: Color(0xff1c1b1b),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe0e3e3),
      onSurfaceVariant: Color(0xff212525),
      outline: Color(0xff404344),
      outlineVariant: Color(0xff404344),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffececec),
      primaryFixed: Color(0xff414343),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2b2d2d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff663700),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff462400),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4f4200),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff362c00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc6c6c7),
      onPrimary: Color(0xff2f3131),
      primaryContainer: Color(0xffd4d4d4),
      onPrimaryContainer: Color(0xff3e4040),
      secondary: Color(0xffffd1ab),
      onSecondary: Color(0xff4b2700),
      secondaryContainer: Color(0xffeba059),
      onSecondaryContainer: Color(0xff3c1e00),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff3a3000),
      tertiaryContainer: Color(0xffeed46a),
      onTertiaryContainer: Color(0xff4b3e00),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff141313),
      onBackground: Color(0xffe5e2e1),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      surfaceVariant: Color(0xff444748),
      onSurfaceVariant: Color(0xffc4c7c8),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inverseOnSurface: Color(0xff313030),
      inversePrimary: Color(0xff5d5f5f),
      primaryFixed: Color(0xffe2e2e2),
      onPrimaryFixed: Color(0xff1a1c1c),
      primaryFixedDim: Color(0xffc6c6c7),
      onPrimaryFixedVariant: Color(0xff454747),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff2d1600),
      secondaryFixedDim: Color(0xffffb876),
      onSecondaryFixedVariant: Color(0xff6b3b00),
      tertiaryFixed: Color(0xfffde276),
      onTertiaryFixed: Color(0xff221b00),
      tertiaryFixedDim: Color(0xffdfc65d),
      onTertiaryFixedVariant: Color(0xff544600),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc6c6c7),
      onPrimary: Color(0xff2f3131),
      primaryContainer: Color(0xffd4d4d4),
      onPrimaryContainer: Color(0xff1e2020),
      secondary: Color(0xffffd1ab),
      onSecondary: Color(0xff391d00),
      secondaryContainer: Color(0xffeba059),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff3a3000),
      tertiaryContainer: Color(0xffeed46a),
      onTertiaryContainer: Color(0xff261f00),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff141313),
      onBackground: Color(0xffe5e2e1),
      surface: Color(0xff141313),
      onSurface: Color(0xfffefaf9),
      surfaceVariant: Color(0xff444748),
      onSurfaceVariant: Color(0xffc8cbcc),
      outline: Color(0xffa0a3a4),
      outlineVariant: Color(0xff808484),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inverseOnSurface: Color(0xff2a2a2a),
      inversePrimary: Color(0xff464849),
      primaryFixed: Color(0xffe2e2e2),
      onPrimaryFixed: Color(0xff0f1112),
      primaryFixedDim: Color(0xffc6c6c7),
      onPrimaryFixedVariant: Color(0xff343637),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff1e0d00),
      secondaryFixedDim: Color(0xffffb876),
      onSecondaryFixedVariant: Color(0xff542c00),
      tertiaryFixed: Color(0xfffde276),
      onTertiaryFixed: Color(0xff161100),
      tertiaryFixedDim: Color(0xffdfc65d),
      onTertiaryFixedVariant: Color(0xff413500),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc6c6c7),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffd4d4d4),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbd82),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeed46a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff141313),
      onBackground: Color(0xffe5e2e1),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff444748),
      onSurfaceVariant: Color(0xfff8fbfc),
      outline: Color(0xffc8cbcc),
      outlineVariant: Color(0xffc8cbcc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff282a2b),
      primaryFixed: Color(0xffe6e7e7),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffcacbcb),
      onPrimaryFixedVariant: Color(0xff141717),
      secondaryFixed: Color(0xffffe1cb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbd82),
      onSecondaryFixedVariant: Color(0xff261100),
      tertiaryFixed: Color(0xffffe685),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe3ca61),
      onTertiaryFixedVariant: Color(0xff1c1600),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
