import 'package:flutter/material.dart';
import 'package:islamy/preferences/shared_pref_handler.dart';

class SettingsProvider extends ChangeNotifier {
  String language =
      SharedPrefHandler.sharedPreferences.getString('language') ?? 'en';
  String activeLang =
      SharedPrefHandler.sharedPreferences.getString('activeLanguage') ??
          'English';
  String unActiveLang =
      SharedPrefHandler.sharedPreferences.getString('unActiveLanguage') ??
          'Arabic';
  changeLanguage() async {
    if (SharedPrefHandler.sharedPreferences.getString('language') == 'ar') {
      SharedPrefHandler.sharedPreferences.setString('language', 'en');
      SharedPrefHandler.sharedPreferences
          .setString('activeLanguage', 'English');
      SharedPrefHandler.sharedPreferences
          .setString('unActiveLanguage', 'Arabic');
      language = 'en';
      activeLang = 'English';
      unActiveLang = 'Arabic';
    } else {
      SharedPrefHandler.sharedPreferences.setString('language', 'ar');
      SharedPrefHandler.sharedPreferences.setString('activeLanguage', 'Arabic');
      SharedPrefHandler.sharedPreferences
          .setString('unActiveLanguage', 'English');
      language = 'ar';
      unActiveLang = 'English';
      activeLang = 'Arabic';
    }
    notifyListeners();
  }

  bool isDark = SharedPrefHandler.sharedPreferences.getBool('isDark') ?? false;
  changeTheme() async {
    if (SharedPrefHandler.sharedPreferences.getBool('isDark') == false) {
      SharedPrefHandler.sharedPreferences.setBool('isDark', true);
      SharedPrefHandler.sharedPreferences.setBool('isSwitched', true);
      isDark = true;
    } else {
      SharedPrefHandler.sharedPreferences.setBool('isDark', false);
      SharedPrefHandler.sharedPreferences.setBool('isSwitched', false);
      isDark = false;
    }
    notifyListeners();
  }
}
