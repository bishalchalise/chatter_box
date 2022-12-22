import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData get lightPalette {
    return ThemeData(
        scaffoldBackgroundColor: const Color(0xfff1f2f2),
      brightness: Brightness.light,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      colorScheme: ThemeData(
        brightness: Brightness.light,
      ).colorScheme.copyWith(
      primary: Colors.deepPurple,
        background: Colors.white,
      ),
    );
  }

  ThemeData get darkPalette {
    return ThemeData(
    
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      colorScheme: ThemeData(
        brightness: Brightness.dark,
      ).colorScheme.copyWith(
         primary: const Color.fromARGB(255, 17, 17, 17),
         background: const Color(0xff212121),
      ),
    );
  }
}
