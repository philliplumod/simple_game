// Question and Answer Class
import 'package:flutter/material.dart';

class Question {
  final AssetImage image;
  List<Answer> answer;
  bool isLocked;

  Answer? selectedAnswer;

  Question({
    required this.image,
    required this.answer,
    this.isLocked = false,
    this.selectedAnswer,
  });

  get options => null;
}

// Answer class
class Answer {
  final String text;
  final bool isCorrect;
  const Answer({required this.text, required this.isCorrect});
}

//Array of Questions and answers

final question = [
  //Question 1
  Question(
    image: const AssetImage('assets/logo/1.png'),
    answer: const [
      Answer(text: 'Facebook', isCorrect: false),
      Answer(text: 'LinkedIn', isCorrect: false),
      Answer(text: 'Twitter', isCorrect: true),
      Answer(text: 'Instagram', isCorrect: false),
    ],
  ),
  //Question 2
  Question(
    image: const AssetImage('assets/logo/2.png'),
    answer: const [
      Answer(text: 'Subway', isCorrect: false),
      Answer(text: "McDonald's", isCorrect: true),
      Answer(text: 'Burger King', isCorrect: false),
      Answer(text: 'KFC', isCorrect: false),
    ],
  ),
  //Question 3
  Question(
    image: const AssetImage('assets/logo/3.png'),
    answer: const [
      Answer(text: 'Apple', isCorrect: true),
      Answer(text: 'Orange', isCorrect: false),
      Answer(text: 'Grapes', isCorrect: false),
      Answer(text: 'Mango', isCorrect: false),
    ],
  ),
  //Question 4
  Question(
    image: const AssetImage('assets/logo/4.png'),
    answer: const [
      Answer(text: "Dunkin' Donuts", isCorrect: false),
      Answer(text: 'Starbucks', isCorrect: true),
      Answer(text: 'Krispy Kreme', isCorrect: false),
      Answer(text: 'Tim Hortons', isCorrect: false),
    ],
  ),
  //Question 5
  Question(
    image: const AssetImage('assets/logo/5.png'),
    answer: const [
      Answer(text: 'Ford', isCorrect: false),
      Answer(text: 'FedEx', isCorrect: false),
      Answer(text: 'Facebook', isCorrect: true),
      Answer(text: 'Ferrari', isCorrect: false),
    ],
  ),
];
