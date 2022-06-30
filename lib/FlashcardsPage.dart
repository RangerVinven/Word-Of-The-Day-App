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
  int flashcardIndex = 0; // Which flashcard from the flashcards list in flashcardService is showing
  late Flashcard currentFlashcard;

  _FlashcardsPageState() {
    flashcardService = FlashcardService();
    flashcardService.printWords();

    currentFlashcard = flashcardService.flashcardsForToday[flashcardIndex];
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
              child: flashcardIndex <= flashcardService.flashcardsForToday.length ? FlashcardWidget(flashcard: flashcardService.flashcardsForToday[flashcardIndex]) : FlashcardWidget(flashcard: Flashcard(word: Word(word: "No words to show,\n come back later!", meaning: "No words to show,\n come back later!", saveDate: DateTime.now()), dateToReview: DateTime.now()))
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      flashcardService.updateFlashcard(currentFlashcard.word, false);
                      flashcardIndex++;
                    });
                  },
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
                  onPressed: () {
                    flashcardService.updateFlashcard(currentFlashcard.word, true);
                    flashcardIndex++;
                  },
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