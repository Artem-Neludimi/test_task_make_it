import 'package:flutter/material.dart';

final themeData = ThemeData(
  colorScheme: _getColorScheme(),
  textTheme: _getTextTheme(_getColorScheme()),
  appBarTheme: const AppBarTheme(
    elevation: 3,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromRGBO(106, 77, 186, 1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: Colors.grey, width: 0.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: Colors.grey, width: 0.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: Colors.grey, width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: Colors.grey, width: 0.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: Colors.grey, width: 0.5),
    ),
  ),
);

ColorScheme _getColorScheme() {
  return const ColorScheme.light(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.white,
    tertiary: Colors.grey,
    primaryContainer: Color.fromRGBO(243, 243, 243, 1),
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

    // Display
    displayLarge: TextStyle(),
    displayMedium: TextStyle(),
    displaySmall: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );

  return textTheme;
}
