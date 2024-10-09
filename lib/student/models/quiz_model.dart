class QuizModel {
  QuizModel({
    required this.id,
    required this.title,
    required this.courseId,
    required this.duration,
    required this.description,
  });

  final String id;
  final String title;
  final String courseId;
  final int duration;
  final String description;

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'],
      title: json['title'],
      courseId: json['course_id'],
      duration: json['duration'] is int
          ? json['duration']
          : int.parse(json['duration']),
      description: json['description'],
    );
  }
}
