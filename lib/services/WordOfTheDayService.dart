import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:word_of_the_day/models/Word.dart';

class WordOfTheDayService {
  late Box wordBox;

  WordOfTheDayService() {
    wordBox = Hive.box("wordBox");
  }

  void addWordAndMeaning(String word, String meaning) {
    wordBox.add(Word(word: word, meaning: meaning));
  }

  Word getWordAndMeaning() {
    var word = wordBox.getAt(0);
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