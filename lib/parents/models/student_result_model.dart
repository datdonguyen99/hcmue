class StudentResultModel {
  StudentResultModel({
    required this.subject,
    required this.score,
    required this.grade,
  });

  String subject;
  double score;
  String grade;

  factory StudentResultModel.fromJson(Map<String, dynamic> json) {
    return StudentResultModel(
      subject: json['subject'],
      score: json['score'],
      grade: json['grade'],
    );
  }
}

class SemesterModel {
  SemesterModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory SemesterModel.fromJson(Map<String, dynamic> json) {
    return SemesterModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
