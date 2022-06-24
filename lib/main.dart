import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'FlashcardsPage.dart';
import 'HomePage.dart';

// https://random-words-api.vercel.app/word

void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    
  var navbarIndex = 0;
  var pages = const [HomePage(), FlashcardsPage()];

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
        body: pages[navbarIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: navbarIndex,
          onDestinationSelected: (newIndex) {
            setState(() {
              navbarIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: "Word of The Day"),
            NavigationDestination(icon: Icon(Icons.rectangle_outlined), selectedIcon: Icon(Icons.rectangle), label: "Flashcards"),
          ],
        ),
      )
    );
  }
}