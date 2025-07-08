import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeServices {
  final key = 'isDarkMode';

  bool loadThemeFromStorage() => Get.isDarkMode;
  void saveThemeToStorage(bool isDarkMode) =>
      Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);

  ThemeMode get theme =>
      loadThemeFromStorage() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    saveThemeToStorage(!Get.isDarkMode);
  }
}
