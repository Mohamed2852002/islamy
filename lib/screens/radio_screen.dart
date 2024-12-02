import 'package:flutter/material.dart';
import 'package:islamy/widgets/radio_widgets/play_and_pause.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});
  static const String radioScreenName = 'radioscreen';

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 412,
              height: 222,
              child: Image.asset('assets/images/radio.png'),
            ),
            const SizedBox(height: 57),
            Text(
              AppLocalizations.of(context)!.holy_quran_radio,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous_sharp,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        size: 40,
                      ),
                    ),
                  ),
                  const PlayAndPause(),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next_sharp,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
