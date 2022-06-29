import 'package:flutter/material.dart';

import 'package:word_of_the_day/models/Flashcard.dart';

class FlashcardWidget extends StatelessWidget {

  late Flashcard flashcard;

  FlashcardWidget({Key? key, required this.flashcard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.25
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              width: 300,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    flashcard.wordShowing ? flashcard.word : flashcard.meaning,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            );
  }
}