class SurahModel {
  final String surahName;
  final String surahVerses;
  final int surahNumber;
  final void Function() onTextTap;

  SurahModel({
    required this.surahNumber, 
    required this.onTextTap,
    required this.surahName,
    required this.surahVerses,
  });
}
