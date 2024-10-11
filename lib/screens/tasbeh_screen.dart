import 'package:flutter/material.dart';

class TasbehScreen extends StatefulWidget {
  const TasbehScreen({super.key});

  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<TasbehScreen>
    with AutomaticKeepAliveClientMixin {
  int tasbehCounter = 0;
  List<String> tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'لا إله الا الله',
    'الله أكبر'
  ];
  int index = 0;
  double angle = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: Image.asset('assets/images/head_sebha_logo.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 78),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          tasbehCounter++;
                          if (tasbehCounter > 30) {
                            index++;
                            tasbehCounter = 0;
                          }
                          if (index == 4) {
                            index = 0;
                            tasbehCounter = 0;
                          }
                          angle += 50;
                        },
                      );
                    },
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        'assets/images/body_sebha_logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'عدد التسبيحات',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: const Color(0xffb7935f).withOpacity(0.57),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                '$tasbehCounter',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xffb7935f),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                tasbeh[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 265),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: const Color(0xffb7935f)),
                onPressed: () {
                  setState(() {
                    tasbehCounter = 0;
                    index = 0;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
