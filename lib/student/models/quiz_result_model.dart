class QuizResultModel {
  QuizResultModel({
    required this.id,
    required this.title,
    required this.totalQuestions,
    required this.totalCorrectAnswers,
    required this.score,
    required this.questionResults,
  });

  final String id;
  final String title;
  final int totalQuestions;
  final int totalCorrectAnswers;
  final double score;
  final List<QuestionResult> questionResults;

  factory QuizResultModel.fromJson(Map<String, dynamic> json) {
    return QuizResultModel(
      id: json['quiz_id'],
      title: json['title'],
      totalQuestions: json['total_questions'] is int
          ? json['total_questions']
          : int.parse(json['total_questions']),
      totalCorrectAnswers: json['total_correct_answers'] is int
          ? json['total_correct_answers']
          : int.parse(json['total_correct_answers']),
      score:
          json['score'] is double ? json['score'] : double.parse(json['score']),
      questionResults: [],
    );
  }
}

class QuestionResult {
  QuestionResult({
    required this.id,
    required this.isCorrect,
  });

  final int id;
  final bool isCorrect;

  factory QuestionResult.fromJson(Map<String, dynamic> json) {
    return QuestionResult(
      id: json['question_id'] is int
          ? json['question_id']
          : int.parse(json['question_id']),
      isCorrect: json['is_correct'] is bool
          ? json['is_correct']
          : bool.parse(json['is_correct']),
    );
  }
}
