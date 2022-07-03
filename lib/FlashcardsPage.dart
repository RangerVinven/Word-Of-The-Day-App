import 'package:flutter/material.dart';

import 'package:word_of_the_day/models/Word.dart';
import 'package:word_of_the_day/models/Flashcard.dart';

import 'package:word_of_the_day/services/FlashcardService.dart';

import 'package:word_of_the_day/widgets/FlashcardWidget.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  late FlashcardService flashcardService;
  late int flashcardIndex; // Which flashcard from the flashcards list in flashcardService is showing
  late Flashcard currentFlashcard;

  _FlashcardsPageState() {
    flashcardService = FlashcardService();
    flashcardIndex = 0;


    // if(flashcardService.flashcardsForToday.length < 3) {
    //   flashcardService.addTestFlashcards();
    // }

    currentFlashcard = flashcardService.flashcardsForToday.isNotEmpty ? flashcardService.flashcardsForToday[flashcardIndex] : Flashcard(word: Word(word: "No more words for today", meaning: "No more words for today", dayShown: 1), dateToReview: DateTime.now(), daysTillNextReview: 1);
  }

  // For when the thumbs up or down
  void submitAnswer(bool gotCorrect) {
    flashcardService.updateFlashcard(currentFlashcard.word, gotCorrect); // Updates the flashcard's reviewDate
    setState(() {
      flashcardIndex++;

      // Checks if there's any more flashcards left
      if(flashcardIndex < flashcardService.flashcardsForToday.length) {
        currentFlashcard = flashcardService.flashcardsForToday[flashcardIndex];
      } else {
        currentFlashcard = Flashcard(word: Word(word: "No more words for today", meaning: "No more words for today", dayShown: 1), dateToReview: DateTime.now(), daysTillNextReview: 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // Changes the text on the flashcard to the opposite when pressed (word -> meaning and vise versa)
                setState(() {
                  currentFlashcard.changeWordShowing();
                });
              },
              child: FlashcardWidget(flashcard: currentFlashcard)
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {submitAnswer(false);},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  child: const Icon(
                    Icons.thumb_down,
                    color: Colors.black,
                  )
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {submitAnswer(true);},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightGreen)
                  ),
                  child: const Icon(
                    Icons.thumb_up,
                    color: Colors.black,
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}