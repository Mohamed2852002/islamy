import 'package:flutter/material.dart';
import 'package:islamy/widgets/content_card_widget.dart';

class SurahHadethScreen extends StatefulWidget {
  const SurahHadethScreen({super.key});
  static const String surahScreenName = 'surahScreenName';

  @override
  State<SurahHadethScreen> createState() => _SurahHadethScreenState();
}

class _SurahHadethScreenState extends State<SurahHadethScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamic model = ModalRoute.of(context)?.settings.arguments;
    return ContentCardWidget(model: model);
  }
}
