import 'package:flutter/material.dart';
// https://random-words-api.vercel.app/word

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Word Of The Day",
            style: TextStyle(
              fontSize: 28
            ),
          ),
          backgroundColor: Colors.orange,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Container(
              constraints: const BoxConstraints(
                minHeight: 65,
              ),
              width: 350,
              color: Colors.orangeAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Membral",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Of, like or pertaining to the limbs rather than the trunk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Word of The Day"),
            NavigationDestination(icon: Icon(Icons.rectangle_outlined), label: "Flashcards"),
          ],
        ),
      ),
    );
  }
}