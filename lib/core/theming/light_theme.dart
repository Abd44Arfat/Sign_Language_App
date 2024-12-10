import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ColorScheme colorScheme = ColorScheme.light(
    //primary: Color(0xffA1F598),
    onPrimary: Colors.black,
    onPrimaryContainer: Colors.black38,
    primaryContainer: Color(0xfff5f9fe),
    surface: Color(0xffececec),
    onSecondary: Colors.white,
    secondary: Colors.green[400]!,
    secondaryContainer: Colors.grey[700],
    primaryFixed: Colors.white,
    onSurface: Colors.grey[100]!

    //secondary: Colors.grey
    //secondary: Color.fromARGB(255, 8, 40, 48),
    //surface: Colors.white,
    //onSurface: Colors.black,
    //error: Colors.red,
    //onError: Colors.white,
    //onSecondary: Color(0xFFf5f5f5),
    );

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: colorScheme.primaryContainer,
  /*contentPadding: const EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 15.0,
  ),*/
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0),
    borderSide: BorderSide(
      color: colorScheme.primary,
      //color: Colors.transparent,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      color: Colors.transparent,
      //color: colorScheme.onPrimaryContainer,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      color: colorScheme.error.withOpacity(0.5),
    ),
  ),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      color: colorScheme.error,
    ),
  ),
  errorMaxLines: 2,
  hintStyle: TextStyle(
    color: colorScheme.onPrimaryContainer,
  ),
);

AppBarTheme appBarTheme = const AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle(
    systemNavigationBarDividerColor: Colors.white,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
  ),
  backgroundColor: Colors.white,
  foregroundColor: Color(0xFF181d31),
  scrolledUnderElevation: 0.0,
  elevation: 0.0,
);

//NavigationBarTheme navigationBarTheme = NavigationBarTheme(data: data, child: child)

BottomNavigationBarThemeData bottomNavigationBarTheme =
    BottomNavigationBarThemeData(
  selectedItemColor: Colors.green[700], // Color for the selected item
  unselectedItemColor: Colors.grey, // Color for unselected items
  backgroundColor: Colors.white, // Background color of the navigation bar
);

final ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  colorScheme: colorScheme,
  appBarTheme: appBarTheme,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  fontFamily: 'Cairo',
);
