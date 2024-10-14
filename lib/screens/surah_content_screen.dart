import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/models/surah_model.dart';
import 'package:islamy/widgets/surah_widgets/surah_line_widget.dart';

class SurahContentScreen extends StatefulWidget {
  const SurahContentScreen({super.key});
  static const String surahContentScreenName = 'surahContentScreenName';

  @override
  State<SurahContentScreen> createState() => _SurahContentScreenState();
}

class _SurahContentScreenState extends State<SurahContentScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final SurahModel surahModel =
        ModalRoute.of(context)?.settings.arguments as SurahModel;
    if (surahLines.isEmpty) {
      loadSurah(surahModel.surahNumber);
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background_image.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'إسلامي',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                color: const Color(0xffF8F8F8).withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(
                            flex: 3,
                          ),
                          Text(
                            'سورة ${surahModel.surahName}',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 25,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Divider(
                        thickness: 2,
                        height: 0,
                        indent: 40,
                        endIndent: 30,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return SurahLineWidget(
                                    surahLine: surahLines[index],
                                    surahChapter: index);
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  thickness: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                );
                              },
                              itemCount: surahLines.length),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  List<String> surahLines = [];
  loadSurah(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/text_files/${index + 1}.txt');
    surahLines = fileContent.trim().split('\n');
    isLoading = false;
    setState(() {});
    return surahLines;
  }
}
