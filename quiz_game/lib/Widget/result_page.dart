import 'package:flutter/material.dart';
import 'package:quiz_game/Question%20and%20Answer/data.dart';

import '../main.dart';

class ResultPage extends StatefulWidget {
  final int score;
  const ResultPage({super.key, required this.score});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('You got ${widget.score}/${question.length}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  for (var element in question) {
                    element.isLocked = false;
                    element.selectedAnswer = null;
                  }
                });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
              child: const Text('Play Again'),
            )
          ],
        ),
      ),
    );
  }
}
