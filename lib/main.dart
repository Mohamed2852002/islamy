import 'package:flutter/material.dart';
import 'package:islamy/navigation_menu.dart';
import 'package:islamy/preferences/shared_pref_handler.dart';
import 'package:islamy/provider/settings_provider.dart';
import 'package:islamy/screens/hadeth_content_screen.dart';
import 'package:islamy/screens/surah_content_screen.dart';
import 'package:islamy/themes/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHandler.initSharedPref();
  await SharedPrefHandler.initSharedPrefValues();
  runApp(
    const IslamyApp(),
  );
}

class IslamyApp extends StatelessWidget {
  const IslamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: Builder(builder: (context) {
        var settingsProvider = Provider.of<SettingsProvider>(context);
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          locale: Locale(settingsProvider.language),
          theme: AppTheme.lighTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settingsProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: NavigationMenu.navigationmenuName,
          routes: {
            NavigationMenu.navigationmenuName: (context) =>
                const NavigationMenu(),
            SurahContentScreen.surahContentScreenName: (context) =>
                const SurahContentScreen(),
            HadethContentScreen.hadethContentScreenName: (context) =>
                const HadethContentScreen(),
          },
        );
      }),
    );
  }
}
