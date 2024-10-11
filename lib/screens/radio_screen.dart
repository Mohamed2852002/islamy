import 'package:flutter/material.dart';
import 'package:islamy/widgets/radio_widgets/play_and_pause.dart';

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
            const Text(
              'إذاعة القرآن الكريم',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous_sharp,
                      color: Color(0xffb7935f),
                      size: 40,
                    ),
                  ),
                  const PlayAndPause(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_next_sharp,
                      color: Color(0xffb7935f),
                      size: 40,
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
