import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'اللغة',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container();
              },
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer)),
              child: Text(
                'العربية',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'السمة',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container();
              },
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer)),
              child: Text(
                'data',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
