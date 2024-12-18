import 'package:flutter/material.dart';
import 'package:islamy/models/surah_model.dart';
import 'package:islamy/screens/surah_content_screen.dart';
import 'package:islamy/widgets/surah_widgets/surah_rows.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});
  static const String quranScreenName = 'quranscreen';

  final List<String> surahVerseCounts = const [
    "7", // الفاتحة
    "286", // البقرة
    "200", // آل عمران
    "176", // النساء
    "120", // المائدة
    "165", // الأنعام
    "206", // الأعراف
    "75", // الأنفال
    "129", // التوبة
    "109", // يونس
    "123", // هود
    "111", // يوسف
    "43", // الرعد
    "52", // إبراهيم
    "99", // الحجر
    "128", // النحل
    "111", // الإسراء
    "110", // الكهف
    "98", // مريم
    "135", // طه
    "112", // الأنبياء
    "78", // الحج
    "118", // المؤمنون
    "64", // النور
    "77", // الفرقان
    "227", // الشعراء
    "93", // النمل
    "88", // القصص
    "69", // العنكبوت
    "60", // الروم
    "34", // لقمان
    "30", // السجدة
    "73", // الأحزاب
    "54", // سبأ
    "45", // فاطر
    "83", // يس
    "182", // الصافات
    "88", // ص
    "75", // الزمر
    "85", // غافر
    "54", // فصلت
    "53", // الشورى
    "89", // الزخرف
    "59", // الدخان
    "37", // الجاثية
    "35", // الأحقاف
    "38", // محمد
    "29", // الفتح
    "18", // الحجرات
    "45", // ق
    "60", // الذاريات
    "49", // الطور
    "62", // النجم
    "55", // القمر
    "78", // الرحمن
    "96", // الواقعة
    "29", // الحديد
    "22", // المجادلة
    "24", // الحشر
    "13", // الممتحنة
    "14", // الصف
    "11", // الجمعة
    "11", // المنافقون
    "18", // التغابن
    "12", // الطلاق
    "12", // التحريم
    "30", // الملك
    "52", // القلم
    "44", // الحاقة
    "28", // المعارج
    "28", // نوح
    "20", // الجن
    "20", // المزمل
    "56", // المدثر
    "40", // القيامة
    "31", // الإنسان
    "50", // المرسلات
    "40", // النبأ
    "46", // النازعات
    "42", // عبس
    "29", // التكوير
    "19", // الإنفطار
    "36", // المطففين
    "25", // الإنشقاق
    "22", // البروج
    "17", // الطارق
    "19", // الأعلى
    "26", // الغاشية
    "30", // الفجر
    "20", // البلد
    "15", // الشمس
    "21", // الليل
    "11", // الضحى
    "8", // الشرح
    "8", // التين
    "19", // العلق
    "5", // القدر
    "8", // البينة
    "8", // الزلزلة
    "11", // العاديات
    "11", // القارعة
    "8", // التكاثر
    "3", // العصر
    "9", // الهمزة
    "5", // الفيل
    "4", // قريش
    "7", // الماعون
    "3", // الكوثر
    "6", // الكافرون
    "3", // النصر
    "5", // المسد
    "4", // الإخلاص
    "5", // الفلق
    "6" // الناس
  ];

  final List<String> surahs = const [
    "الفاتحة",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النور",
    "الفرقان",
    "الشعراء",
    "النمل",
    "القصص",
    "العنكبوت",
    "الروم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصلت",
    "الشورى",
    "الزخرف",
    "الدخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزمل",
    "المدثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطففين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/quran.png'),
            ),
            const SizedBox(height: 12),
            const Divider(
              height: 0,
              thickness: 3,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.verses_number,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 3,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                Expanded(
                  child: Text(
                      textAlign: TextAlign.center,
                      AppLocalizations.of(context)!.sura_name,
                      style: Theme.of(context).textTheme.labelMedium),
                ),
              ],
            ),
            const Divider(
              height: 0,
              thickness: 3,
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: surahs.length,
                itemBuilder: (context, index) {
                  return SurahRows(
                    surahModel: SurahModel(
                      surahNumber: index,
                      surahName: surahs[index],
                      surahVerses: surahVerseCounts[index],
                      onTextTap: () {
                        Navigator.pushNamed(
                          context,
                          SurahContentScreen.surahContentScreenName,
                          arguments: SurahModel(
                            surahName: surahs[index],
                            surahVerses: surahVerseCounts[index],
                            onTextTap: () {},
                            surahNumber: index,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
