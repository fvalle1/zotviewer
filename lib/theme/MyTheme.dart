import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//https://material.io/design/typography/the-type-system.html#type-scale
TextTheme getMyTextTheme() => TextTheme(
      headline1: GoogleFonts.ubuntu(
          fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.ubuntu(
          fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.ubuntu(fontSize: 49, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.ubuntu(
          fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.ubuntu(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.ubuntu(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.ubuntu(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.openSans(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.openSans(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.openSans(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.openSans(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.openSans(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );

ThemeData getMyTheme() =>ThemeData(
  colorScheme: ColorScheme.dark(primary:Colors.red, secondary: Colors.orangeAccent),
  fontFamily: "ubuntu", 
  textTheme: getMyTextTheme()
  );
