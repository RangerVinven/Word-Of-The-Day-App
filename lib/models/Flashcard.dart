import 'package:hive/hive.dart';
import 'package:word_of_the_day/models/Word.dart';
part 'Flashcard.g.dart';

@HiveType(typeId: 2)
class Flashcard {
  @HiveField(1)
  Word word;

  @HiveField(2)
  DateTime dateToReview;

  bool wordShowing;

  Flashcard({required this.word, required this.dateToReview, required this.wordShowing});
}