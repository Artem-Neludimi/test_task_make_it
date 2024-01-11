import 'package:flutter/material.dart';

final themeData = ThemeData(
  colorScheme: _getColorScheme(),
  appBarTheme: const AppBarTheme(
    elevation: 3,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: _getTextTheme(_getColorScheme()),
);

ColorScheme _getColorScheme() {
  return const ColorScheme.light(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.white,
  );
}

TextTheme _getTextTheme(ColorScheme colorScheme) {
  const darker = Colors.black87;
  const darkest = Colors.black;
  const grey = Colors.grey;

  const headlineColor = darker;
  const headlineWeight = FontWeight.w900;

  const titleColor = darkest;
  const titleWeight = FontWeight.bold;

  const bodyColor = darker;

  const labelColor = grey;

  const textTheme = TextTheme(
    // Headline
    headlineLarge: TextStyle(
      fontSize: 24,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),

    // Title
    titleLarge: TextStyle(
      fontSize: 20,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      color: titleColor,
      fontWeight: titleWeight,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 16,
      color: bodyColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: bodyColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
    ),

    // Label
    labelLarge: TextStyle(
      fontSize: 16,
      color: labelColor,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      color: labelColor,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: labelColor,
    ),
  );

  return textTheme;
}
