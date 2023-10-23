class QuizQuestion {
  // Data Members
  final String text;
  final List<String> answers;

  // Constructors
  const QuizQuestion({required this.text, required this.answers});

  List<String> shuffleList() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

// Every First Answer Option is Correct Option in the list  
