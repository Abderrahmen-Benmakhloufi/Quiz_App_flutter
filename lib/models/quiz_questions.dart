class Qustionsofquiz {
  final String question;
  final List<String> answers;

  Qustionsofquiz(this.question, this.answers);

  List<String> getshuffledanswers() {
    final shuffuldList = List.of(answers);
    shuffuldList.shuffle();
    return shuffuldList;
  }
}
