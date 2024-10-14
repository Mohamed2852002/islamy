import 'package:flutter/material.dart';
import 'package:islamy/screens/ahadeth_screen.dart';
import 'package:islamy/screens/quran_screen.dart';
import 'package:islamy/screens/radio_screen.dart';
import 'package:islamy/screens/settings_screen.dart';
import 'package:islamy/screens/tasbeh_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});
  static const String navigationmenuName = 'navigation';

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 4;
  PageController pageController = PageController(initialPage: 4);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background_image.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('إسلامي'),
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
                icon: const Icon(Icons.settings),
                label: 'الإعدادات'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon:
                    const ImageIcon(AssetImage('assets/images/radio_icon.png')),
                label: 'الراديو'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon:
                    const ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                label: 'التسبيح'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const ImageIcon(AssetImage('assets/images/hadeth.png')),
                label: 'الأحاديث'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon:
                    const ImageIcon(AssetImage('assets/images/quran_icon.png')),
                label: 'القرآن'),
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
            SettingsScreen(),
            RadioScreen(),
            TasbehScreen(),
            AhadethScreen(),
            QuranScreen(),
          ],
        ),
      ),
    );
  }
}
