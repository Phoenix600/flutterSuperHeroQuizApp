import 'package:flutter/material.dart';
import 'package:myquiz/screens/question_screen.dart';
import 'package:myquiz/screens/result_screen.dart';
import 'package:myquiz/screens/start_screen.dart';
import './constants/constants.dart';
import './data/questions_data.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  /// Concrete Data Members :
  /// @brief :
  ///  used to change the screen of the app
  String activeScreen = "start-screen";

  /// List of Selected Answers By User
  List<String> selectedAnswerList = [];

  /// Function To Add the selected answer by user in List
  void selectedAnswer(String answer) {
    selectedAnswerList.add(answer);
    // print(selectedAnswerList);
    if (selectedAnswerList.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  /// Switch Screen Clousure
  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  /// Restart Screen Clousure
  void restartQuiz() {
    setState(() {
      selectedAnswerList.clear();
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: selectedAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      // #TODO: Pass The Real Data Here
      screenWidget = ResultScreen(
          chosenAnswer: selectedAnswerList, onRestart: restartQuiz);
    }

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[primaryColor, primaryAccentColor],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
