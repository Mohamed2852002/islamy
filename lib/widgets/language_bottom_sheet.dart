import 'package:flutter/material.dart';
import 'package:islamy/provider/settings_provider.dart';
import 'package:islamy/widgets/selected_item.dart';
import 'package:islamy/widgets/unselected_item.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectedItem(settingsProvider.activeLang),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Provider.of<SettingsProvider>(context, listen: false)
                  .changeLanguage();
            },
            child: UnSelectedItem(settingsProvider.unActiveLang),
          )
        ],
      ),
    );
  }
}
