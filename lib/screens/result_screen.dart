import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:myquiz/data/questions_data.dart';
import 'package:myquiz/screens/question_summary/summary_item.dart';

class ResultScreen extends StatelessWidget {
  /// ResultScreenClass Constructor To Render The ResultScreen
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.onRestart});

  /// Closure to Re-Start The Quiz
  final void Function() onRestart;

  /// List Of Selected Answers By User
  final List<String> chosenAnswer;

  /// Function That Returns the Summary Of All Answers And Questions
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummary();
    final int totalNumberOfQuestions = questions.length;
    final int totalNumberOfCorrectQuestions = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return Stack(
      children: [
        // Image.asset(
        //   "assets/images/Thanos.jpg",
        //   fit: BoxFit.cover,
        //   height: double.infinity,
        // ),
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: Text(
                    style: const TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                    ),
                    "Solider You Answered $totalNumberOfCorrectQuestions of out $totalNumberOfQuestions",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: BlurryContainer(
                      color: const Color.fromARGB(66, 133, 133, 133),
                      padding: const EdgeInsets.all(28),
                      blur: 6,
                      child: Column(
                        children: summaryData.map((data) {
                          return SummaryItem(map: data);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                    onPressed: onRestart,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.restart_alt_rounded),
                    label: const Text(
                      "Restart Quiz",
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
