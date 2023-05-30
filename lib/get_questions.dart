class GetQuestions {
  GetQuestions(this.answers, this.numberOfQuestions);

  final List<List<String>> answers;
  final int numberOfQuestions;
  List<List<String>> returnAnswers = [];

  List<List<String>> getShuffledAnswers() {
    for (int i = 0; i < numberOfQuestions; i++) {
      returnAnswers.add(answers[i]);
    }
    returnAnswers.shuffle();
    return returnAnswers;
  }
}