import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayAndPause extends StatefulWidget {
  const PlayAndPause({super.key});

  @override
  State<PlayAndPause> createState() => _PlayAndPauseState();
}

class _PlayAndPauseState extends State<PlayAndPause> {
  final player = AudioPlayer();
  bool isPlaying = false;

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
    return isPlaying
        ? IconButton(
            onPressed: () async {
              await player.pause();
              isPlaying = false;
              setState(() {});
            },
            icon: Icon(
              Icons.pause,
              color: Theme.of(context).colorScheme.primaryContainer,
              size: 60,
            ),
          )
        : IconButton(
            onPressed: () {
              isPlaying = true;
              player.play();
              setState(() {});
            },
            icon: Icon(
              Icons.play_arrow_rounded,
              color: Theme.of(context).colorScheme.primaryContainer,
              size: 60,
            ),
          );
  }
}
