import 'package:flutter/material.dart';
import 'package:myquiz/constants/constants.dart';

class AnswerButton extends StatelessWidget {
  // final void Function(String answer) onSelectAnswer;
  const AnswerButton(
      {super.key, required this.optionText, required this.onTap});

  final String optionText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 13),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(11)))),
        child: Text(
          optionText,
          style: TextStyle(
              color: primaryAccentColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
