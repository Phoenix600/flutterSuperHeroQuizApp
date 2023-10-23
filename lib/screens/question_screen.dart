import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquiz/model/quiz_question.dart';
import 'package:myquiz/screens/answer_button.dart';
import 'package:myquiz/data/questions_data.dart';

class QuestionScreen extends StatefulWidget {
  // Data Member
  final void Function(String answer) onSelectAnswer;

  const QuestionScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion questionText = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.cyan,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                    ),
                    "${currentQuestionIndex + 1}"),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Text(
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              questionText.text,
            ),
            const SizedBox(
              height: 21,
            ),
            ...questionText.shuffleList().map((e) {
              return AnswerButton(
                optionText: e,
                onTap: () {
                  answerQuestion(e);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
