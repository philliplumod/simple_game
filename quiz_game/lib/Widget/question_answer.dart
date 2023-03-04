import 'package:flutter/material.dart';
import 'package:quiz_game/Widget/answer_widget.dart';
import 'package:quiz_game/Widget/result_page.dart';

import '../Question and Answer/data.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController _controller;
  int _questionNumber = 1;
  final int currentQuestionIndex = 0;
  int _score = 0;
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      height: screenHeigth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text('Question $_questionNumber/${question.length}',
                style: const TextStyle(fontSize: 15)),
            Expanded(
                child: PageView.builder(
                    itemCount: question.length,
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // ignore: no_leading_underscores_for_local_identifiers
                      final _question = question[index];
                      return buildQuestion(_question);
                    })),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Center(
          child: Image(
            image: question.image,
            width: 200,
            height: 200,
          ),
        ),
        // Text(question.image, style: const TextStyle(fontSize: 20)),
        Expanded(
            child: AnswerWidget(
                question: question,
                onClickedOption: (answer) {
                  if (question.isLocked) {
                    return;
                  } else {
                    setState(() {
                      question.isLocked = true;
                      question.selectedAnswer = answer;
                    });
                    _isLocked = question.isLocked;
                    if (question.selectedAnswer!.isCorrect) {
                      _score++;
                    }
                  }
                })),
        _isLocked
            ? Center(child: buildElavatedButton())
            : const SizedBox.shrink(),
        const SizedBox(height: 50),
      ],
    );
  }

  ElevatedButton buildElavatedButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
        onPressed: () {
          if (_questionNumber < question.length) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInExpo,
            );
            setState(() {
              _questionNumber++;
              _isLocked = false;
            });
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(score: _score)));
          }
        },
        child: Text(_questionNumber < question.length
            ? 'Next Page'
            : 'See the result'));
  }
}
