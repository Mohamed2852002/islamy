import 'package:flutter/material.dart';

class AppTheme {
  static const lightPrimary = Colors.white;
  // mojihjk
  // asfl;askf
  static final lighTheme = ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 45),
        unselectedIconTheme: IconThemeData(size: 35),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        backgroundColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: const Color(0xffB7935F));
}
