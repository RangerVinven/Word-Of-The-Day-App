import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:word_of_the_day/models/Word.dart';
import 'package:word_of_the_day/models/Flashcard.dart';

class FlashcardService {
  late Box flashcardBox;
  late List<Flashcard> flashcardsForToday;

  FlashcardService() {
    flashcardBox = Hive.box("flashcardBox");
    flashcardsForToday = getFlashcardsToShow();
  }

  void addFlashcard(Word word, DateTime? reviewDate, int daysTillNextReview) {
    flashcardBox.add(Flashcard(word: word, dateToReview: reviewDate != null ? reviewDate.add(Duration(days: daysTillNextReview)) : DateTime.now().add(Duration(days: daysTillNextReview)), daysTillNextReview: daysTillNextReview));
  }

  // Changes the dateToReview variable
  void updateFlashcard(Word word, bool gotCorrect) {
    // Loops through the flashcards
    for (var i = 0; i < flashcardBox.length; i++) {
      Flashcard flashcard = flashcardBox.getAt(i);

      // If the flashcard is the one currently showing, change the reviewBy date
      if(flashcard.word.word == word.word) {
        if(gotCorrect) {
          addFlashcard(word, flashcard.dateToReview.add(Duration(days: flashcard.daysTillNextReview)), flashcard.daysTillNextReview*2);
        } else {
          addFlashcard(word, flashcard.dateToReview.add(Duration(days: flashcard.daysTillNextReview)), (flashcard.daysTillNextReview/2).floor());
        }

        flashcardBox.deleteAt(i);
        return;
      }
    }
  }

  List<Flashcard> getFlashcardsToShow() {
    List<Flashcard> flashcards = [];
    DateTime now = DateTime.now();

    // Loops through the flashcards, adding the ones to review to the flashcards list
    for (var i = 0; i < flashcardBox.length; i++) {
      Flashcard flashcard = flashcardBox.getAt(i);
      print(flashcard.word.word);
      if(flashcard.dateToReview.day <= now.day || (flashcard.dateToReview.month <= now.month && flashcard.dateToReview.year <= now.year)) {
        flashcards.add(flashcard);
        print(flashcard.word.word + " Added");
      }
    }

    return flashcards;
  }

  // For testing
  void addTestFlashcards() {
    addFlashcard(Word(word: "Zoetic", meaning: "Living; vital", dayShown: DateTime.now().day), DateTime.now(), 1);
    addFlashcard(Word(word: "Cacolet", meaning: "Military mule litter", dayShown: DateTime.now().day), DateTime.now(), 1);
    addFlashcard(Word(word: "Obeliscolychny", meaning: "Lighthouse", dayShown: DateTime.now().day), DateTime.now(), 1);
  }

  // For testing
  void printWords() {
    for (var i = 0; i < flashcardBox.length; i++) {
      print(flashcardBox.getAt(i).word.word);
    }
  }

  void clearFlashcards() {
    flashcardBox.clear();
  }

}