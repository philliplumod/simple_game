import 'package:flutter/material.dart';
import 'package:quiz_game/Question%20and%20Answer/data.dart';

class AnswerWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Answer> onClickedOption;

  const AnswerWidget(
      {super.key, required this.question, required this.onClickedOption});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.answer
            .map((answer) => buildAnswer(context, answer))
            .toList(), // Cast the list to List<Widget>
      ),
    );
  }

  Widget buildAnswer(BuildContext context, Answer answer) {
    final color = getColorForAnswer(answer, question);
    return GestureDetector(
      onTap: () => onClickedOption(answer),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answer.text,
              style: const TextStyle(fontSize: 15),
            ),
            getIconForAnswer(answer, question)
          ],
        ),
      ),
    );
  }

  getColorForAnswer(Answer answer, Question question) {
    final isSelected = answer == question.selectedAnswer;
    if (question.isLocked) {
      if (isSelected) {
        return answer.isCorrect ? Colors.green : Colors.red;
      } else if (answer.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  getIconForAnswer(Answer answer, Question question) {
    final isSelected = answer == question.selectedAnswer;
    if (question.isLocked) {
      if (isSelected) {
        return answer.isCorrect
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(Icons.cancel, color: Colors.red);
      }
    }
    return const SizedBox.shrink();
  }
}
