import 'package:flutter/material.dart';
import 'package:islamy/models/surah_model.dart';

class SurahRows extends StatelessWidget {
  const SurahRows({
    super.key,
    required this.surahModel,
  });
  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        surahModel.onTextTap();
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              surahModel.surahVerses,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 3,
            color: const Color(0xffb7935f),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              surahModel.surahName,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
