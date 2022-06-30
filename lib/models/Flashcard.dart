import 'package:hive/hive.dart';
import 'package:word_of_the_day/models/Word.dart';
part 'Flashcard.g.dart';

@HiveType(typeId: 2)
class Flashcard {
  @HiveField(0)
  Word word;

  @HiveField(1)
  DateTime dateToReview;

  @HiveField(2)
  int daysTillNextReview = 1;

  bool wordShowing = true;

  changeWordShowing() {
    wordShowing = !wordShowing;
  }

  Flashcard({required this.word, required this.dateToReview, required this.daysTillNextReview});
}