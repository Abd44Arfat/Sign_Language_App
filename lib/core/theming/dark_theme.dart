import 'package:flutter/material.dart';
import 'package:sign_lang_app/core/theming/colors.dart';

ColorScheme colorScheme = const ColorScheme.dark(
    onPrimary: Colors.white,
    primaryContainer: Color(0xff5D5D5D),
    onPrimaryContainer: ColorsManager.lightGray,
    surface: Color(0xff19221D),
    onSecondary: Colors.black,
    secondary: Color(0xffaef593),
    secondaryContainer: Colors.grey,
    onSurface: Color(0xff141F23),
    primaryFixed: Color(0xff202F36),
    onPrimaryFixed: Color(0xff202F36), //backfround color
    onSecondaryFixed: Color(0xff39464E), // border color
    primaryFixedDim: Color(0xff141F23), // the color of the button
    surfaceContainer: Color(0xff232229),
    tertiary: Color(0xFFB5D585),
    onTertiary: Color(0xFF1FADFF));

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: colorScheme.primaryContainer,
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.green,
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(16.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xff5D5D5D), //ColorsManager.itembackground,
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(16.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.red,
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(16.0),
  ),
  //floatingLabelBehavior: FloatingLabelBehavior.never,

  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.red,
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(16.0),
  ),
  errorMaxLines: 2,
  hintStyle: TextStyle(
    color: colorScheme.onPrimaryContainer,
  ),
);

BottomNavigationBarThemeData bottomNavigationBarTheme =
    BottomNavigationBarThemeData(
  selectedItemColor: Colors.green[400], // Color for the selected item
  unselectedItemColor: Colors.grey, // Color for unselected items
  backgroundColor: Colors.black, // Background color of the navigation bar
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  inputDecorationTheme: inputDecorationTheme,
  brightness: Brightness.dark,
  colorScheme: colorScheme,
  fontFamily: 'Cairo',
  bottomNavigationBarTheme: bottomNavigationBarTheme,
);
