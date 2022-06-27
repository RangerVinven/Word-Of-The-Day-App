import 'package:hive/hive.dart';

part 'Word.g.dart';

@HiveType(typeId : 1)
class Word {

  @HiveField(1)
  String word;

  @HiveField(2)
  String meaning;

  Word({required this.word, required this.meaning});

  static Word fromJSON(Map<dynamic, dynamic> json) {
    String word = json["word"];
    String meaning = json["meaning"];

    return Word(word: word, meaning: meaning);
  }

}