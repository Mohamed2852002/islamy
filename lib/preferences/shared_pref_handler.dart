import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHandler {
  static late SharedPreferences sharedPreferences;
  static initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static initSharedPrefValues() {
    if (SharedPrefHandler.sharedPreferences.getBool('isDark') == null) {
      SharedPrefHandler.sharedPreferences.setBool('isDark', false);
    }
    if (SharedPrefHandler.sharedPreferences.getBool('isSwitched') == null) {
      SharedPrefHandler.sharedPreferences.setBool('isSwitched', false);
    }
    if (SharedPrefHandler.sharedPreferences.getString('language') == null) {
      SharedPrefHandler.sharedPreferences.setString('language', 'en');
    }
    if (SharedPrefHandler.sharedPreferences.getString('activeLanguage') == null) {
      SharedPrefHandler.sharedPreferences.setString('activeLanguage', 'English');
    }
    if (SharedPrefHandler.sharedPreferences.getString('unActiveLanguage') == null) {
      SharedPrefHandler.sharedPreferences.setString('unActiveLanguage', 'Arabic');
    }
  }
}
