import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF0A1128); // Navy
  static const Color cardColor = Color(0xFF112240);
  static const Color borderStroke = Color(0xFF233554);
  static const Color textMain = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8892B0);
  static const Color accentNeonGreen = Color(0xFF00FF66);
  static const Color accentElectricBlue = Color(0xFF00E5FF);

  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: accentElectricBlue,
      cardColor: cardColor,
      dividerColor: borderStroke,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: textMain),
        bodyLarge: GoogleFonts.inter(fontSize: 16, color: textMain),
        bodyMedium: GoogleFonts.inter(fontSize: 14, color: textSecondary),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: background,
        selectedItemColor: accentElectricBlue,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
