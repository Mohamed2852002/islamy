import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/models/hadeth_model.dart';
import 'package:islamy/screens/hadeth_content_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadethScreen extends StatefulWidget {
  const AhadethScreen({super.key});
  static const String ahadethScreenName = 'ahadethscreen';

  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 312,
                height: 219,
                child: Image.asset('assets/images/bsmalh.png'),
              ),
            ),
            Divider(
              height: 0,
              thickness: 3,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
             SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.ahadeth,
                  style: Theme.of(context).textTheme.labelMedium
                ),
              ),
            ),
            Divider(
              height: 0,
              thickness: 3,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            Expanded(
              flex: 2,
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 15),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: ahadeth.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, HadethContentScreen.hadethContentScreenName,
                        arguments: ahadeth[index]);
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    ahadeth[index].hadethTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
    setState(() {});
  }
}
