import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:word_of_the_day/models/Word.dart';

class WordOfTheDayService {
  late Box wordBox;

  WordOfTheDayService() {
    wordBox = Hive.box("wordBox");
  }

  void addWordAndMeaning(Word word) {
    wordBox.put("word", word);
  }

  void updateWord(Word word) {
    // Clears the box if there's too many words, then adds a new one
    if(wordBox.length > 1) {
      clearBox(); 
    }
    addWordAndMeaning(word);
  }

  bool wordSaved() {
    return wordBox.length == 1 ? true : false;
  }

  // Gets the saved word
  Word getWordAndMeaning() {
    var word = wordBox.get("word");
    return word;
  }

  // Clears the box
  bool clearBox() {
    try {
      wordBox.clear();
      return true;
    } catch(e) {
      return false;
    }
  }

  // Deletes the current box and creates a new one
  void createNewBox() {
    wordBox.deleteFromDisk();
    wordBox = Hive.box("wordBox");
  }

}