import 'package:flutter/material.dart';

class AppTheme {
  static const lightPrimary = Color(0xffb7935f);
  static const darkPrimary = Color(0xff141A2E);
  static const darkSecondary = Color(0xffFACC1D);

  static final lighTheme = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: lightPrimary,
      secondary: lightPrimary.withOpacity(0.57),
      tertiary: Colors.black,
      primaryContainer: lightPrimary,
      secondaryContainer: Colors.white,
      tertiaryContainer: lightPrimary.withOpacity(0.57),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
      backgroundColor: Colors.transparent,
    ),
    dividerTheme: const DividerThemeData(color: lightPrimary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 45),
      unselectedIconTheme: IconThemeData(size: 35),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
    ),
    primaryColor: const Color(0xffB7935F),
  );

  static final darkTheme = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: darkPrimary,
      secondary: darkSecondary,
      tertiary: darkSecondary,
      primaryContainer: darkSecondary,
      secondaryContainer: Colors.black,
      tertiaryContainer: darkPrimary,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
      backgroundColor: Colors.transparent,
    ),
    dividerTheme: const DividerThemeData(color: darkSecondary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 45),
      unselectedIconTheme: IconThemeData(size: 35),
      unselectedItemColor: Colors.white,
      selectedItemColor: darkSecondary,
    ),
    primaryColor: const Color(0xffB7935F),
  );
}
