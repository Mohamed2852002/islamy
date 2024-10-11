import 'package:flutter/material.dart';
import 'package:islamy/navigation_menu.dart';
import 'package:islamy/screens/surah_hadeth_screen.dart';
import 'package:islamy/themes/app_theme.dart';

class IslamyApp extends StatelessWidget {
  const IslamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lighTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationMenu.navigationmenuName,
      routes: {
        NavigationMenu.navigationmenuName: (context) => const NavigationMenu(),
        SurahHadethScreen.surahScreenName: (context) =>
            const SurahHadethScreen()
      },
    );
  }
}
