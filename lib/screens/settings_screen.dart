import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/preferences/shared_pref_handler.dart';
import 'package:islamy/provider/settings_provider.dart';
import 'package:islamy/widgets/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return const LanguageBottomSheet();
              },
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.active_language,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Switch(
                value:
                    SharedPrefHandler.sharedPreferences.getBool('isSwitched') ??
                        false,
                onChanged: (value) {
                  settingsProvider.changeTheme();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
