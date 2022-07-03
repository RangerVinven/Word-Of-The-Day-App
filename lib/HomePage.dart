import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:word_of_the_day/models/Word.dart';
import 'package:word_of_the_day/services/FlashcardService.dart';
import 'package:word_of_the_day/services/WordOfTheDayService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late WordOfTheDayService wotdService;
  late FlashcardService flashcardService;

  late Word wordOfTheDay;
  late bool loading;

  _HomePageState() {
    wotdService = WordOfTheDayService();
    flashcardService = FlashcardService();

    // Checks if the word is saved, if not, then gets a new word
    if(wotdService.wordSaved()) {
      // Checks if the WOTD needs to be changed (because it's a new day)
      Word word = wotdService.getWordAndMeaning();
      DateTime now = DateTime.now();

      if(word.dayShown != now.day) {
        loading = true;
        getNewWord();
      } else {
        wordOfTheDay = wotdService.getWordAndMeaning();
        loading = false;
      }
    } else {
      loading = true;
      getNewWord();
    }
  }

  // Makes the API call to https://random-words-api.vercel.app/word to get a word
  Future<void> getNewWord() async {
    var response = await get(Uri.parse("https://random-words-api.vercel.app/word"));
    List<dynamic> responseList = jsonDecode(response.body);

    Word newWord = Word(word: responseList[0]["word"], meaning: responseList[0]["definition"], dayShown: DateTime.now().day);

    wordOfTheDay = newWord;
    wotdService.updateWord(newWord); // Updates the word in the database to make it persistant
    setState(() {
      loading = false;
    });

    flashcardService.addNewFlashcard(newWord);
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const LoadingPage() : Column(
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
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    wordOfTheDay.meaning,
                    style: const TextStyle(
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

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(color: Colors.orange, size: 100),
    );
  }
}