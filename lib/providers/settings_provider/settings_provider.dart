import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLang = const Locale("ar");

  void changeThemeMode(ThemeMode theme) {
    currentTheme = theme;
    saveTheme(theme);
    notifyListeners();
  }

  void saveTheme(ThemeMode currentTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (currentTheme == ThemeMode.light) {
      await prefs.setString("theme", "light");
    } else {
      await prefs.setString("theme", "dark");
    }
  }

  void changeLanguage(String newLanguage) {
    if (currentLang == newLanguage) return;
    currentLang = Locale(newLanguage);
    saveLanguage(newLanguage);
    notifyListeners();
  }

  void saveLanguage(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", lang);
  }

  void getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString("theme") ?? "light";
    if (theme == "light") {
      currentTheme = ThemeMode.light;
    } else {
      currentTheme = ThemeMode.dark;
    }
    notifyListeners();
  }

  void getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "ar";
    currentLang = Locale(lang);
    notifyListeners();
  }
}