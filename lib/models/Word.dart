import 'package:hive/hive.dart';
part 'Word.g.dart';

@HiveType(typeId : 1)
class Word {
  @HiveField(0)
  String word;

  @HiveField(1)
  String meaning;

  @HiveField(2)
  var dayShown; // The day that the word was the word of the day

  Word({required this.word, required this.meaning, required this.dayShown});
}