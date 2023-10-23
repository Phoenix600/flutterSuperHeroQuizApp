import 'package:flutter/material.dart';
import 'package:myquiz/constants/constants.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.isCorrectAnswer, required this.questionIndex});

  final int questionIndex;
  final bool isCorrectAnswer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? correctAnswerColor
            : const Color.fromARGB(255, 240, 64, 131),
        // borderRadius:
        // BorderRadius.all(Radius.circular(100)),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "${questionIndex + 1}",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(195, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
