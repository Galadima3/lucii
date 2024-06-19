import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        surface: Colors.white,
        error: Colors.red,
        onTertiary: Colors.orange,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        elevation: 5,
        foregroundColor: Colors.white,
      ),
      fontFamily: GoogleFonts.openSans().fontFamily,
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleMedium: GoogleFonts.kanit(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleSmall: GoogleFonts.kanit(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: GoogleFonts.dmSans(color: Colors.white, fontSize: 15),
      ),
    );
  }

  static ThemeData darkThemeData(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
        surface: Colors.grey[850]!,
        error: Colors.red[400]!,
        onTertiary: Colors.orange[200]!,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.blue[800],
        elevation: 5,
        foregroundColor: Colors.white,
      ),
      fontFamily: GoogleFonts.openSans().fontFamily,
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleMedium: GoogleFonts.kanit(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleSmall: GoogleFonts.kanit(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.dmSans(color: Colors.white, fontSize: 15),
      ),
    );
  }
}


