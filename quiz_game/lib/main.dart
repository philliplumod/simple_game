import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_game/Widget/question_answer.dart';

void main() => runApp(
      const MaterialApp(
        // title: "Mini Quiz Game",
        // theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Mini Logo Quiz Game',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        width: screenWidth,
        height: screenHeigth,
        child: const QuestionWidget(),
      ),
    );
  }
}
