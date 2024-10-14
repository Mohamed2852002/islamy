import 'package:flutter/material.dart';
import 'package:islamy/navigation_menu.dart';
import 'package:islamy/screens/hadeth_content_screen.dart';
import 'package:islamy/screens/surah_content_screen.dart';
import 'package:islamy/themes/app_theme.dart';

class IslamyApp extends StatelessWidget {
  const IslamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lighTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationMenu.navigationmenuName,
      routes: {
        NavigationMenu.navigationmenuName: (context) => const NavigationMenu(),
        SurahContentScreen.surahContentScreenName: (context) =>
            const SurahContentScreen(),
        HadethContentScreen.hadethContentScreenName: (context) =>
            const HadethContentScreen(),
      },
    );
  }
}
