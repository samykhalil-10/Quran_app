import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color goldColor = Color(0xFFB7935F);
  static const Color darkColor = Color(0xFF141A2E);
  static const Color yellowColor = Color(0xFFFAcc1D);
  static ThemeData lightTheme = ThemeData(
    // fontFamily: GoogleFonts.elMessiri().fontFamily,
    primaryColor: goldColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffB7935F),
      primary: const Color(0xffB7935F),
      secondary: goldColor,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      )),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: const Color(0xffB7935F),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        size: 36,
      ),
      unselectedIconTheme: IconThemeData(
        size: 24,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        )),
    cardColor: Colors.white,
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    ),
    dividerColor: goldColor,
    textTheme: const TextTheme(
      //chapter name
      labelMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      //sura title
      titleMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      //content sura
      bodySmall: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      //theme setting
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    // fontFamily: GoogleFonts.elMessiri().fontFamily,
    primaryColor: darkColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkColor,
      primary: yellowColor,
      secondary: darkColor,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      )),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: const Color(0xffB7935F),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: yellowColor,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        size: 36,
      ),
      unselectedIconTheme: IconThemeData(
        size: 24,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        )),
    cardColor: darkColor,
    cardTheme: CardTheme(
      color: darkColor,
      elevation: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    ),
    dividerColor: yellowColor,
    textTheme: const TextTheme(
      //chapter name
      labelMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      //sura title
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      //content sura
      bodySmall: TextStyle(
        fontSize: 20,
        color: yellowColor,
      ),
      //theme setting
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
