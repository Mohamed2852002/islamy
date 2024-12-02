import 'package:flutter/material.dart';
import 'package:islamy/preferences/shared_pref_handler.dart';
import 'package:islamy/screens/ahadeth_screen.dart';
import 'package:islamy/screens/quran_screen.dart';
import 'package:islamy/screens/radio_screen.dart';
import 'package:islamy/screens/settings_screen.dart';
import 'package:islamy/screens/tasbeh_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});
  static const String navigationmenuName = 'navigation';

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
              SharedPrefHandler.sharedPreferences.getBool('isDark') ?? false
                  ? 'assets/images/home_dark_background.png'
                  : 'assets/images/background_image.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.app_name),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(
              () {
                currentIndex = value;
                pageController.animateToPage(
                  value,
                  duration: const Duration(microseconds: 400),
                  curve: Curves.linear,
                );
              },
            );
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon:
                    const ImageIcon(AssetImage('assets/images/quran_icon.png')),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const ImageIcon(AssetImage('assets/images/hadeth.png')),
                label: AppLocalizations.of(context)!.ahadeth),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon:
                    const ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                label: AppLocalizations.of(context)!.tasbeeh),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon:
                    const ImageIcon(AssetImage('assets/images/radio_icon.png')),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          children: const [
            QuranScreen(),
            AhadethScreen(),
            TasbehScreen(),
            RadioScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
