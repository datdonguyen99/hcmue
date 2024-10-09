class QuestionModel {
  QuestionModel({
    required this.questionId,
    required this.question,
    required this.options,
    required this.correctAnswerIds,
  });

  final String questionId;
  final String question;
  final List<OptionModel> options;
  final List<String> correctAnswerIds;

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionId: json['question_id'],
      question: json['question'],
      options: [],
      correctAnswerIds: [],
    );
  }
}

class OptionModel {
  OptionModel({
    required this.id,
    required this.text,
  });

  final String id;
  final String text;

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['option_id'],
      text: json['text'],
    );
  }
}
