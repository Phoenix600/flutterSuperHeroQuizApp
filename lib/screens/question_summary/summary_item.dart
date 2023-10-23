import 'package:flutter/material.dart';
import './question_indentifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.map});
  final Map<String, Object> map;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: map['user_answer'] == map['correct_answer'],
            questionIndex: map['question_index'] as int),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 228, 218, 218)),
                  map['question'] as String),
              Text(
                  style: const TextStyle(fontSize: 16, color: Colors.cyan),
                  map['user_answer'] as String),
              Text(
                  style: const TextStyle(fontSize: 16, color: Colors.pink),
                  map['correct_answer'] as String),
            ],
          ),
        ),
      ],
    );
  }
}
