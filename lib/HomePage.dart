import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.openBox("wordOfTheDay");
  final box = Hive.box("wordOfTheDat");

  final wordOfTheDay = box.get("word");
  print(wordOfTheDay);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Container(
              constraints: const BoxConstraints(
                minHeight: 65,
              ),
              width: 350,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Membral",
                    style: TextStyle(

                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Of, like or pertaining to the limbs rather than the trunk",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              )
            ),
          ],
        );
  }
}