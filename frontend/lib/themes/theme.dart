import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff6e5d0e),
      surfaceTint: Color(0xff6e5d0e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfffae287),
      onPrimaryContainer: Color(0xff221b00),
      secondary: Color(0xff675e40),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffefe2bc),
      onSecondaryContainer: Color(0xff211b04),
      tertiary: Color(0xff44664e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc5eccd),
      onTertiaryContainer: Color(0xff00210f),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff9ee),
      onBackground: Color(0xff1e1b13),
      surface: Color(0xfffff9ee),
      onSurface: Color(0xff1e1b13),
      surfaceVariant: Color(0xffeae2cf),
      onSurfaceVariant: Color(0xff4b4739),
      outline: Color(0xff7c7767),
      outlineVariant: Color(0xffcdc6b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inverseOnSurface: Color(0xfff7f0e2),
      inversePrimary: Color(0xffddc66e),
      primaryFixed: Color(0xfffae287),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffddc66e),
      onPrimaryFixedVariant: Color(0xff544600),
      secondaryFixed: Color(0xffefe2bc),
      onSecondaryFixed: Color(0xff211b04),
      secondaryFixedDim: Color(0xffd2c6a1),
      onSecondaryFixedVariant: Color(0xff4e462a),
      tertiaryFixed: Color(0xffc5eccd),
      onTertiaryFixed: Color(0xff00210f),
      tertiaryFixedDim: Color(0xffaad0b2),
      onTertiaryFixedVariant: Color(0xff2c4e37),
      surfaceDim: Color(0xffe0d9cc),
      surfaceBright: Color(0xfffff9ee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf3e5),
      surfaceContainer: Color(0xfff4eddf),
      surfaceContainerHigh: Color(0xffeee7da),
      surfaceContainerHighest: Color(0xffe9e2d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff4f4200),
      surfaceTint: Color(0xff6e5d0e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff867425),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a4327),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7e7454),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff284a33),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5a7d63),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff9ee),
      onBackground: Color(0xff1e1b13),
      surface: Color(0xfffff9ee),
      onSurface: Color(0xff1e1b13),
      surfaceVariant: Color(0xffeae2cf),
      onSurfaceVariant: Color(0xff474335),
      outline: Color(0xff645f50),
      outlineVariant: Color(0xff807a6b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inverseOnSurface: Color(0xfff7f0e2),
      inversePrimary: Color(0xffddc66e),
      primaryFixed: Color(0xff867425),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6c5b0b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7e7454),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff645c3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5a7d63),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff41634b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe0d9cc),
      surfaceBright: Color(0xfffff9ee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf3e5),
      surfaceContainer: Color(0xfff4eddf),
      surfaceContainerHigh: Color(0xffeee7da),
      surfaceContainerHighest: Color(0xffe9e2d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff2a2200),
      surfaceTint: Color(0xff6e5d0e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4f4200),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff282209),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4a4327),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff052815),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff284a33),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff9ee),
      onBackground: Color(0xff1e1b13),
      surface: Color(0xfffff9ee),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffeae2cf),
      onSurfaceVariant: Color(0xff272418),
      outline: Color(0xff474335),
      outlineVariant: Color(0xff474335),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffeca7),
      primaryFixed: Color(0xff4f4200),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff362c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4a4327),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff332c13),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff284a33),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff11331e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe0d9cc),
      surfaceBright: Color(0xfffff9ee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf3e5),
      surfaceContainer: Color(0xfff4eddf),
      surfaceContainerHigh: Color(0xffeee7da),
      surfaceContainerHighest: Color(0xffe9e2d4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffddc66e),
      surfaceTint: Color(0xffddc66e),
      onPrimary: Color(0xff3a3000),
      primaryContainer: Color(0xff544600),
      onPrimaryContainer: Color(0xfffae287),
      secondary: Color(0xffd2c6a1),
      onSecondary: Color(0xff373016),
      secondaryContainer: Color(0xff4e462a),
      onSecondaryContainer: Color(0xffefe2bc),
      tertiary: Color(0xffaad0b2),
      onTertiary: Color(0xff153722),
      tertiaryContainer: Color(0xff2c4e37),
      onTertiaryContainer: Color(0xffc5eccd),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff16130b),
      onBackground: Color(0xffe9e2d4),
      surface: Color(0xff16130b),
      onSurface: Color(0xffe9e2d4),
      surfaceVariant: Color(0xff4b4739),
      onSurfaceVariant: Color(0xffcdc6b4),
      outline: Color(0xff969080),
      outlineVariant: Color(0xff4b4739),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d4),
      inverseOnSurface: Color(0xff333027),
      inversePrimary: Color(0xff6e5d0e),
      primaryFixed: Color(0xfffae287),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffddc66e),
      onPrimaryFixedVariant: Color(0xff544600),
      secondaryFixed: Color(0xffefe2bc),
      onSecondaryFixed: Color(0xff211b04),
      secondaryFixedDim: Color(0xffd2c6a1),
      onSecondaryFixedVariant: Color(0xff4e462a),
      tertiaryFixed: Color(0xffc5eccd),
      onTertiaryFixed: Color(0xff00210f),
      tertiaryFixedDim: Color(0xffaad0b2),
      onTertiaryFixedVariant: Color(0xff2c4e37),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff3c392f),
      surfaceContainerLowest: Color(0xff100e07),
      surfaceContainerLow: Color(0xff1e1b13),
      surfaceContainer: Color(0xff221f17),
      surfaceContainerHigh: Color(0xff2d2a21),
      surfaceContainerHighest: Color(0xff38352b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe1ca72),
      surfaceTint: Color(0xffddc66e),
      onPrimary: Color(0xff1c1600),
      primaryContainer: Color(0xffa4903e),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd6caa5),
      onSecondary: Color(0xff1b1602),
      secondaryContainer: Color(0xff9b906f),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffaed4b6),
      onTertiary: Color(0xff001b0b),
      tertiaryContainer: Color(0xff75997e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff16130b),
      onBackground: Color(0xffe9e2d4),
      surface: Color(0xff16130b),
      onSurface: Color(0xfffffaf5),
      surfaceVariant: Color(0xff4b4739),
      onSurfaceVariant: Color(0xffd2cab8),
      outline: Color(0xffa9a292),
      outlineVariant: Color(0xff898373),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d4),
      inverseOnSurface: Color(0xff2d2a21),
      inversePrimary: Color(0xff554700),
      primaryFixed: Color(0xfffae287),
      onPrimaryFixed: Color(0xff161100),
      primaryFixedDim: Color(0xffddc66e),
      onPrimaryFixedVariant: Color(0xff413500),
      secondaryFixed: Color(0xffefe2bc),
      onSecondaryFixed: Color(0xff161100),
      secondaryFixedDim: Color(0xffd2c6a1),
      onSecondaryFixedVariant: Color(0xff3d361b),
      tertiaryFixed: Color(0xffc5eccd),
      onTertiaryFixed: Color(0xff001508),
      tertiaryFixedDim: Color(0xffaad0b2),
      onTertiaryFixedVariant: Color(0xff1b3d27),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff3c392f),
      surfaceContainerLowest: Color(0xff100e07),
      surfaceContainerLow: Color(0xff1e1b13),
      surfaceContainer: Color(0xff221f17),
      surfaceContainerHigh: Color(0xff2d2a21),
      surfaceContainerHighest: Color(0xff38352b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf5),
      surfaceTint: Color(0xffddc66e),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe1ca72),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf5),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd6caa5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffefffef),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffaed4b6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff16130b),
      onBackground: Color(0xffe9e2d4),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff4b4739),
      onSurfaceVariant: Color(0xfffffaf5),
      outline: Color(0xffd2cab8),
      outlineVariant: Color(0xffd2cab8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d4),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff332900),
      primaryFixed: Color(0xfffee68b),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe1ca72),
      onPrimaryFixedVariant: Color(0xff1c1600),
      secondaryFixed: Color(0xfff3e6c0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd6caa5),
      onSecondaryFixedVariant: Color(0xff1b1602),
      tertiaryFixed: Color(0xffcaf0d1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffaed4b6),
      onTertiaryFixedVariant: Color(0xff001b0b),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff3c392f),
      surfaceContainerLowest: Color(0xff100e07),
      surfaceContainerLow: Color(0xff1e1b13),
      surfaceContainer: Color(0xff221f17),
      surfaceContainerHigh: Color(0xff2d2a21),
      surfaceContainerHighest: Color(0xff38352b),
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

  List<ExtendedColor> get extendedColors => [];
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
