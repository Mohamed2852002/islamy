import 'package:flutter/material.dart';
import 'package:islamy/models/hadeth_model.dart';

class HadethContentScreen extends StatelessWidget {
  const HadethContentScreen({super.key});
  static const String hadethContentScreenName = 'hadethContentScreenName';

  @override
  Widget build(BuildContext context) {
    final HadethModel hadethModel =
        ModalRoute.of(context)?.settings.arguments as HadethModel;
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
        body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          color: const Color(0xffF8F8F8).withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Text(
                  hadethModel.hadethTitle,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Divider(
                  thickness: 2,
                  height: 0,
                  indent: 42,
                  endIndent: 42,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Text(
                          hadethModel.hadethContent,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount: 1,
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
}
