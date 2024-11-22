import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF102542);
  static const Color secondaryColor = Color(0xFFcdd7d6);

  static ThemeData get theme => ThemeData(
        primaryColor: const Color.fromARGB(255, 152, 188, 238),
        scaffoldBackgroundColor: const Color.fromARGB(255, 202, 212, 224),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 128, 161, 207),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 25, 71, 134),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
        ),
      );
}