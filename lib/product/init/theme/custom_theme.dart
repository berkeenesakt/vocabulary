import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/product/init/theme/custom_color_scheme.dart';

final class CustomLightTheme {
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
        scaffoldBackgroundColor: const Color.fromRGBO(239, 235, 226, 1),
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );

  FloatingActionButtonThemeData get floatingActionButtonThemeData => const FloatingActionButtonThemeData();
}
