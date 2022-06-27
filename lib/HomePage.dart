import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:word_of_the_day/models/Word.dart';
import 'package:word_of_the_day/services/WordOfTheDayService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late WordOfTheDayService wotdService;
  late Word wordOfTheDay;

  _HomePageState() {
    wotdService = WordOfTheDayService();

    if(wotdService.wordSaved()) {
      wotdService.updateWord("Word not saved", "fdsa");
    } else {
      wotdService.updateWord("Ragmatical", "Wild; ill-behaved");
    }
    wordOfTheDay = wotdService.getWordAndMeaning();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Container(
              constraints: const BoxConstraints(
                minHeight: 65,
              ),
              width: 350,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wordOfTheDay.word,
                    style: TextStyle(

                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    wordOfTheDay.meaning,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              )
            ),
          ],
        );
  }
}