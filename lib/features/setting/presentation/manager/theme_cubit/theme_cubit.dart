import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/theming/dark_theme.dart';
import 'package:sign_lang_app/core/theming/light_theme.dart';
/*
class ThemesCubit extends Cubit<ThemeData> {
  ThemesCubit() : super(AppThemes.lightTheme) {
    _getThemeFromPrefs();
  }

  Future<void> _saveThemeToPrefs({required Brightness brightness}) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setInt('theme', themeIndex);
  }

  Future<void> _getThemeFromPrefs() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final savedThemeIndex = sharedPreferences.getInt('theme') ?? 0;
    final savedTheme =
        savedThemeIndex == 0 ? AppThemes.lightTheme : AppThemes.darkTheme;
    emit(savedTheme);
  }

  void toggleTheme() {
    final newTheme = state.brightness == Brightness.light
        ? AppThemes.darkTheme
        : AppThemes.lightTheme;
    print(
        "newTheme : $newTheme ,state: $state ,  state.brightness: ${state.brightness}");
    emit(newTheme);
    _saveThemeToPrefs(brightness: newTheme.brightness);
  }
}
*/

class ThemesCubit extends Cubit<ThemeData> {
  ThemesCubit() : super(lightTheme) {
    _getThemeFromPrefs();
  }

  Future<void> _saveThemeToPrefs({required Brightness brightness}) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setInt('theme', themeIndex);
  }

  Future<void> _getThemeFromPrefs() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final savedThemeIndex = sharedPreferences.getInt('theme') ?? 0;
    final savedTheme = savedThemeIndex == 0 ? lightTheme : darkTheme;
    emit(savedTheme);
  }

  void toggleTheme() {
    final newTheme =
        state.brightness == Brightness.light ? darkTheme : lightTheme;
    print(
        "newTheme : $newTheme ,state: $state ,  state.brightness: ${state.brightness}");
    emit(newTheme);
    _saveThemeToPrefs(brightness: newTheme.brightness);
  }
}
