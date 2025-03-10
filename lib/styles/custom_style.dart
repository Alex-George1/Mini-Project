import 'package:flutter/material.dart';

mixin CustomStyle {
  // Gradient Background
  Gradient get backgroundGradient => LinearGradient(
        colors: [Color(0xFF200A4C), Color(0xFF551A8B)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  // Text Styles
  TextStyle get titleStyle => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  TextStyle get descriptionStyle => TextStyle(
        fontSize: 16,
        color: Colors.white,
      );

  TextStyle get buttonTextStyle => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  TextStyle get interestLabelStyle => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  // Interest Card Decoration
  BoxDecoration get interestCardDecoration => BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      );
  TextStyle get navButtonStyle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
  // Button Decoration (Gradient)
  BoxDecoration get buttonDecoration => BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4E1A78), Color(0xFF6D35A5)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
      );
}
