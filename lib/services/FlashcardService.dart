import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:word_of_the_day/models/Word.dart';
import 'package:word_of_the_day/models/Flashcard.dart';

class FlashcardService {
  late Box flashcardBox;
  late List<Flashcard> flashcards;

  FlashcardService() {
    flashcardBox = Hive.box("flashcardBox");
    flashcards = getFlashcardsToShow();
  }

  void addFlashcard(Word word, DateTime? reviewDate) {
    flashcardBox.add(Flashcard(word: word, dateToReview: reviewDate ?? DateTime.now()));
  }

  // Changes the dateToReview variable
  void updateFlashcard(Word word, bool gotCorrect) {
    // Loops through the flashcards
    for (var i = 0; i < flashcards.length; i++) {
      Flashcard flashcard = flashcardBox.getAt(1);

      // If the flashcard is the one currently showing, change the reviewBy date
      if(flashcard.word.word == word.word) {
        if(gotCorrect) {
          addFlashcard(word, flashcard.dateToReview.add(Duration(days: flashcard.dateToReview.day*2)));
        } else {
          addFlashcard(word, flashcard.dateToReview.add(Duration(days: (flashcard.dateToReview.day/2).floor())));
        }

        flashcardBox.deleteAt(i);
        print(flashcard.word.word);
      }
    }
  }

  List<Flashcard> getFlashcardsToShow() {
    List<Flashcard> flashcards = [];
    DateTime now = DateTime.now();

    for (var i = 0; i < flashcardBox.length; i++) {
      Flashcard flashcard = flashcardBox.getAt(i);

      if(flashcard.dateToReview.day == now.day && flashcard.dateToReview.month == now.month && flashcard.dateToReview.year == now.year) {
        flashcards.add(flashcard);
      }
    }

    return flashcards;
  }

}