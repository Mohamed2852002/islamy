import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});
  static const String radioScreenName = 'radioscreen';

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final player = AudioPlayer();
  bool isPlaying = true;

  Future<void> playAudio() async {
    await player.setAsset('assets/Let It Happen.mp3');
  }

  @override
  void initState() {
    super.initState();
    playAudio();
  }

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
                  isPlaying
                      ? IconButton(
                          onPressed: () {
                            isPlaying = false;
                            player.play();
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: Color(0xffb7935f),
                            size: 60,
                          ),
                        )
                      : IconButton(
                          onPressed: () async {
                            await player.pause();
                            isPlaying = true;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.pause,
                            color: Color(0xffb7935f),
                            size: 60,
                          ),
                        ),
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
