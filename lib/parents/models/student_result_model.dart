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

class WeeklyTestModel {
  WeeklyTestModel({
    required this.weekNumber,
    required this.testName,
    required this.testScore,
  });

  final int weekNumber;
  final String testName;
  final double? testScore;

  factory WeeklyTestModel.fromJson(Map<String, dynamic> json) {
    return WeeklyTestModel(
      weekNumber: json['week_number'],
      testName: json['weekly_test_name'],
      testScore: json['weekly_test_score'] ?? json['weekly_test_score'],
    );
  }
}

class WeeklyResultModel {
  WeeklyResultModel({
    required this.courseId,
    required this.courseName,
    required this.weeklyTests,
  });

  final int courseId;
  final String courseName;
  final List<WeeklyTestModel> weeklyTests;

  factory WeeklyResultModel.fromJson(Map<String, dynamic> json) {
    return WeeklyResultModel(
      courseId: int.parse(json['course_id']),
      courseName: json['course_name'],
      weeklyTests: [],
    );
  }
}

class MonthlyTestModel {
  MonthlyTestModel({
    required this.monthNumber,
    required this.testName,
    required this.testScore,
  });

  final int monthNumber;
  final String testName;
  final double? testScore;

  factory MonthlyTestModel.fromJson(Map<String, dynamic> json) {
    return MonthlyTestModel(
      monthNumber: json['month_number'],
      testName: json['monthly_test_name'],
      testScore: json['monthly_test_score'] ?? json['monthly_test_score'],
    );
  }
}

class MonthlyResultModel {
  MonthlyResultModel({
    required this.courseId,
    required this.courseName,
    required this.monthlyTests,
  });

  final int courseId;
  final String courseName;
  final List<MonthlyTestModel> monthlyTests;

  factory MonthlyResultModel.fromJson(Map<String, dynamic> json) {
    return MonthlyResultModel(
      courseId: int.parse(json['course_id']),
      courseName: json['course_name'],
      monthlyTests: [],
    );
  }
}
