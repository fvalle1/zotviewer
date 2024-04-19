import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//https://material.io/design/typography/the-type-system.html#type-scale
TextTheme getMyTextTheme() => TextTheme(
      displayLarge: GoogleFonts.ubuntu(
          fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: GoogleFonts.ubuntu(
          fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: GoogleFonts.ubuntu(fontSize: 49, fontWeight: FontWeight.w400),
      headlineMedium: GoogleFonts.ubuntu(
          fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: GoogleFonts.ubuntu(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: GoogleFonts.ubuntu(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: GoogleFonts.ubuntu(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: GoogleFonts.openSans(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.openSans(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      labelLarge: GoogleFonts.openSans(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: GoogleFonts.openSans(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: GoogleFonts.openSans(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );

ThemeData getMyTheme() =>ThemeData(
  colorScheme: ColorScheme.dark(primary:Colors.red[400]!, secondary: Colors.orangeAccent),
  fontFamily: "ubuntu", 
  textTheme: getMyTextTheme()
  );
