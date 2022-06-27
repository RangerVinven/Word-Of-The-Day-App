import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:word_of_the_day/models/Word.dart';

class WordOfTheDayService {
  late Box wordBox;

  WordOfTheDayService() {
    wordBox = Hive.box("wordBox");
  }

  void addWordAndMeaning(String word, String meaning) {
    wordBox.put("word", Word(word: word, meaning: meaning));
  }

  void updateWord(String word, String meaning) {
    // Clears the box if there's too many words, then adds a new one
    if(wordBox.length > 1) {
      clearBox(); 
    }
    addWordAndMeaning(word, meaning);
  }

  bool wordSaved() {
    return wordBox.length == 1 ? true : false;
  }

  Word getWordAndMeaning() {
    var word = wordBox.get("word");
    return word;
  }

  bool clearBox() {
    try {
      wordBox.clear();
      return true;
    } catch(e) {
      return false;
    }
  }

}