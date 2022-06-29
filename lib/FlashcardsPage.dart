import 'package:flutter/material.dart';

import 'package:word_of_the_day/models/Word.dart';
import 'package:word_of_the_day/models/Flashcard.dart';
import 'package:word_of_the_day/widgets/FlashcardWidget.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  bool isWordCurrentlyShown = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // Changes the text on the flashcard to the opposite when pressed (word -> meaning and vise versa)
                setState(() {
                  isWordCurrentlyShown = !isWordCurrentlyShown;
                });
              },
              child: FlashcardWidget(flashcard: Flashcard(word: Word(word: "Paraonomasia", meaning: "Play on words; punning"), dateToReview: DateTime.now(), wordShowing: isWordCurrentlyShown))
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  child: const Icon(
                    Icons.thumb_down,
                    color: Colors.black,
                  )
                ),
                SizedBox(width: 20),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightGreen)
                  ),
                  child: const Icon(
                    Icons.thumb_up,
                    color: Colors.black,
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}