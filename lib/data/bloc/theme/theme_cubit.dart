import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_loadInitialTheme());

  static ThemeMode _loadInitialTheme() {
    final box = Hive.box('settings');
    return box.get('isDarkMode', defaultValue: false) ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final newTheme = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    Hive.box('settings').put('isDarkMode', newTheme == ThemeMode.dark);
    emit(newTheme);
  }
}
