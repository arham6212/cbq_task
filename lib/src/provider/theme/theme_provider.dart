import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A provider that manages the app theme
final themeProvider =
    StateNotifierProvider<ThemeProvider, ThemeData>((ref) => ThemeProvider());

// A class that represents the app theme and provides methods to toggle it
class ThemeProvider extends StateNotifier<ThemeData> {
  // Constants for the colors used in the theme
  static const Color primaryLightColor = Colors.blue;
  static const Color accentLightColor = Colors.pink;
  static const Color scaffoldLightColor = Colors.white;
  static const Color textLightColor = Colors.black;

  static const Color primaryDarkColor = Colors.pink;
  static const Color accentDarkColor = Colors.blue;
  static const Color scaffoldDarkColor = Colors.black;
  static const Color textDarkColor = Colors.white;

  // The light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.pink,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        color: textLightColor,
      ),
      headline2: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        color: textLightColor,
      ),
      headline3: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
      headline4: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textLightColor,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
      button: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.blue,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
      overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: textLightColor,
      ),
    ),
  );

  // The dark theme
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryDarkColor,
    useMaterial3: true,
    accentColor: accentDarkColor,
    scaffoldBackgroundColor: scaffoldDarkColor,
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textDarkColor,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        color: textDarkColor,
      ),
    ),
  );

  // The current brightness of the app theme
  Brightness _brightness = Brightness.light;

  ThemeProvider() : super(lightTheme);

  // Toggles the app theme between light and dark
  void toggleTheme() {
    _brightness =
        _brightness == Brightness.light ? Brightness.dark : Brightness.light;
    state = _brightness == Brightness.light ? lightTheme : darkTheme;
  }
}
