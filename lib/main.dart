import 'package:flutter/material.dart';

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
          title: const Text("Word Of The Day"),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity, height: 50),
            Container(
              color: Colors.orangeAccent,
              height: 200,
              width: 350,
              child: const Text("fgh")
            )
          ],
        )
      ),
    );
  }
}