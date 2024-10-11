import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/models/hadeth_model.dart';
import 'package:islamy/models/surah_model.dart';
import 'package:islamy/widgets/surah_widgets/surah_line_widget.dart';

class ContentCardWidget extends StatefulWidget {
  const ContentCardWidget({super.key, required this.model});
  final dynamic model;

  @override
  State<ContentCardWidget> createState() => _ContentCardWidgetState();
}

class _ContentCardWidgetState extends State<ContentCardWidget> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    if (surahLines.isEmpty && widget.model is SurahModel) {
      loadSurah((widget.model as SurahModel).surahNumber);
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
                            widget.model is SurahModel
                                ? 'سورة ${(widget.model as SurahModel).surahName}'
                                : (widget.model as HadethModel).hadethTitle,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          widget.model is SurahModel
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const Spacer(),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                        height: 0,
                        indent: 42,
                        endIndent: 42,
                        color: Color(0xffb7935f),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return widget.model is SurahModel
                                  ? SurahLineWidget(
                                      surahLine: surahLines[index],
                                      surahChapter: index)
                                  : Text(
                                      (widget.model as HadethModel)
                                          .hadethContent,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    );
                            },
                            separatorBuilder: (context, index) {
                              return widget.model is SurahModel
                                  ? const Divider(
                                      thickness: 2,
                                      color: Color(0xffb7935f),
                                    )
                                  : const SizedBox();
                            },
                            itemCount: widget.model is SurahModel
                                ? surahLines.length
                                : 1,
                          ),
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

  List<HadethModel> ahadeth = [];
  loadFile() async {
    String fileContent =
        await rootBundle.loadString('assets/text_files/ahadeth.txt');
    List<String> hadeth = fileContent.split('#');
    for (var i = 0; i < hadeth.length; i++) {
      List<String> hadethLines = hadeth[i].trim().split('\n');
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join(' ');
      ahadeth.add(
          HadethModel(hadethContent: hadethContent, hadethTitle: hadethTitle));
    }
    isLoading = false;
    setState(() {});
  }
}
