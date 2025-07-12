import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getRoyalDarkTheme() {
    const Color primaryColor = Color(0xFF6A5ACD); // Slate Blue
    const Color accentColor = Color(0xFFB39DDB);  // Light Purple
    const Color royalPurple = Color(0xFF4B0082);  // Dark Purple

    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xFF1A1A2E), // Deep dark blue
      cardColor: const Color(0xFF282846), // Dark purple-blue
      
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: accentColor,
        tertiary: royalPurple,
        surface: const Color(0xFF2C2C44), // Dark slate blue
        background: const Color(0xFF1A1A2E),
        error: Colors.redAccent,
      ),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A1A2E),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: accentColor),
      ),
      
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: accentColor.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: accentColor.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accentColor, width: 2),
        ),
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        filled: true,
        fillColor: const Color(0xFF232338),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 4,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      
      cardTheme: CardTheme(
        elevation: 6,
        color: const Color(0xFF282846),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      
      dialogTheme: DialogTheme(
        backgroundColor: const Color(0xFF282846),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}