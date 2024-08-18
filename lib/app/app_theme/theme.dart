import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff68548e),
      surfaceTint: Color(0xff68548e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffebddff),
      onPrimaryContainer: Color(0xff230f46),
      secondary: Color(0xff635b70),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe9def8),
      onSecondaryContainer: Color(0xff1f182b),
      tertiary: Color(0xff7e525d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd9e1),
      onTertiaryContainer: Color(0xff31101b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1b20),
      onSurfaceVariant: Color(0xff49454e),
      outline: Color(0xff7a757f),
      outlineVariant: Color(0xffcbc4cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd3bcfd),
      primaryFixed: Color(0xffebddff),
      onPrimaryFixed: Color(0xff230f46),
      primaryFixedDim: Color(0xffd3bcfd),
      onPrimaryFixedVariant: Color(0xff4f3d74),
      secondaryFixed: Color(0xffe9def8),
      onSecondaryFixed: Color(0xff1f182b),
      secondaryFixedDim: Color(0xffcdc2db),
      onSecondaryFixedVariant: Color(0xff4b4358),
      tertiaryFixed: Color(0xffffd9e1),
      onTertiaryFixed: Color(0xff31101b),
      tertiaryFixedDim: Color(0xfff0b7c5),
      onTertiaryFixedVariant: Color(0xff643b46),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1fa),
      surfaceContainer: Color(0xfff2ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4b3970),
      surfaceTint: Color(0xff68548e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff7f6aa5),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff473f54),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff797187),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5f3742),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff976774),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1b20),
      onSurfaceVariant: Color(0xff45414a),
      outline: Color(0xff625d67),
      outlineVariant: Color(0xff7e7983),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd3bcfd),
      primaryFixed: Color(0xff7f6aa5),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff65528b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff797187),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff60586e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff976774),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7c4f5b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1fa),
      surfaceContainer: Color(0xfff2ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2a164d),
      surfaceTint: Color(0xff68548e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4b3970),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff251f32),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff473f54),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff391722),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5f3742),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff26222b),
      outline: Color(0xff45414a),
      outlineVariant: Color(0xff45414a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xfff3e8ff),
      primaryFixed: Color(0xff4b3970),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff352258),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff473f54),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff30293d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5f3742),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff46212c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1fa),
      surfaceContainer: Color(0xfff2ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd3bcfd),
      surfaceTint: Color(0xffd3bcfd),
      onPrimary: Color(0xff38265c),
      primaryContainer: Color(0xff4f3d74),
      onPrimaryContainer: Color(0xffebddff),
      secondary: Color(0xffcdc2db),
      onSecondary: Color(0xff342d40),
      secondaryContainer: Color(0xff4b4358),
      onSecondaryContainer: Color(0xffe9def8),
      tertiary: Color(0xfff0b7c5),
      onTertiary: Color(0xff4a2530),
      tertiaryContainer: Color(0xff643b46),
      onTertiaryContainer: Color(0xffffd9e1),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff151218),
      onSurface: Color(0xffe7e0e8),
      onSurfaceVariant: Color(0xffcbc4cf),
      outline: Color(0xff948f99),
      outlineVariant: Color(0xff49454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff68548e),
      primaryFixed: Color(0xffebddff),
      onPrimaryFixed: Color(0xff230f46),
      primaryFixedDim: Color(0xffd3bcfd),
      onPrimaryFixedVariant: Color(0xff4f3d74),
      secondaryFixed: Color(0xffe9def8),
      onSecondaryFixed: Color(0xff1f182b),
      secondaryFixedDim: Color(0xffcdc2db),
      onSecondaryFixedVariant: Color(0xff4b4358),
      tertiaryFixed: Color(0xffffd9e1),
      onTertiaryFixed: Color(0xff31101b),
      tertiaryFixedDim: Color(0xfff0b7c5),
      onTertiaryFixedVariant: Color(0xff643b46),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d13),
      surfaceContainerLow: Color(0xff1d1b20),
      surfaceContainer: Color(0xff211f24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff36343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd7c0ff),
      surfaceTint: Color(0xffd3bcfd),
      onPrimary: Color(0xff1d0840),
      primaryContainer: Color(0xff9b86c4),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd1c6df),
      onSecondary: Color(0xff191325),
      secondaryContainer: Color(0xff968da4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff5bcc9),
      onTertiary: Color(0xff2b0b16),
      tertiaryContainer: Color(0xffb68390),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151218),
      onSurface: Color(0xfffff9ff),
      onSurfaceVariant: Color(0xffcfc8d3),
      outline: Color(0xffa7a1ab),
      outlineVariant: Color(0xff86818b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff513e75),
      primaryFixed: Color(0xffebddff),
      onPrimaryFixed: Color(0xff18023b),
      primaryFixedDim: Color(0xffd3bcfd),
      onPrimaryFixedVariant: Color(0xff3e2c62),
      secondaryFixed: Color(0xffe9def8),
      onSecondaryFixed: Color(0xff140e20),
      secondaryFixedDim: Color(0xffcdc2db),
      onSecondaryFixedVariant: Color(0xff3a3346),
      tertiaryFixed: Color(0xffffd9e1),
      onTertiaryFixed: Color(0xff250611),
      tertiaryFixedDim: Color(0xfff0b7c5),
      onTertiaryFixedVariant: Color(0xff512a36),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d13),
      surfaceContainerLow: Color(0xff1d1b20),
      surfaceContainer: Color(0xff211f24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff36343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9ff),
      surfaceTint: Color(0xffd3bcfd),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffd7c0ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd1c6df),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff5bcc9),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151218),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9ff),
      outline: Color(0xffcfc8d3),
      outlineVariant: Color(0xffcfc8d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff321f55),
      primaryFixed: Color(0xffeee2ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffd7c0ff),
      onPrimaryFixedVariant: Color(0xff1d0840),
      secondaryFixed: Color(0xffeee2fc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd1c6df),
      onSecondaryFixedVariant: Color(0xff191325),
      tertiaryFixed: Color(0xffffdfe5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff5bcc9),
      onTertiaryFixedVariant: Color(0xff2b0b16),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d13),
      surfaceContainerLow: Color(0xff1d1b20),
      surfaceContainer: Color(0xff211f24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff36343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
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
