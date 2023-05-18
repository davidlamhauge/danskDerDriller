class GetQuestions {
  GetQuestions(this.text, this.answers, this.numberOfQuestions);

  final String text;
  final List<String> answers;
  final int numberOfQuestions;
  List<String> returnAnswers = [];

  List<String> getShuffledAnswers() {
    for (int i = 0; i < numberOfQuestions; i++) {
      returnAnswers.add(answers[i]);
    }
    returnAnswers.shuffle();
    return returnAnswers;
  }
}