import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
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
                    "Paronomasia",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            ),
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