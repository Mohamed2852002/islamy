import 'package:flutter/material.dart';

class SurahLineWidget extends StatelessWidget {
  const SurahLineWidget(
      {super.key, required this.surahLine, required this.surahChapter});
  final String surahLine;
  final int surahChapter;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$surahLine(${surahChapter + 1})',
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
