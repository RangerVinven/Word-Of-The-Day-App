import 'package:hive/hive.dart';
part 'Flashcard.g.dart';

@HiveType(typeId: 2)
class Flashcard {
  @HiveField(1)
  String word;

  @HiveField(2)
  String meaning;

  @HiveField(3)
  DateTime dateToReview;

  bool wordShowing;

  Flashcard({required this.word, required this.meaning, required this.dateToReview, required this.wordShowing});
}