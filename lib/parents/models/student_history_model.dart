class StudentHistoryModel {
  StudentHistoryModel({
    required this.title,
    required this.description,
    required this.startDate,
    required this.completionDate,
    required this.completionLevel,
  });

  String title;
  String description;
  DateTime startDate;
  DateTime completionDate;
  double completionLevel;

  factory StudentHistoryModel.fromJson(Map<String, dynamic> json) {
    return StudentHistoryModel(
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['start_date']),
      completionDate: DateTime.parse(json['completion_date']),
      completionLevel: double.parse(json['completion_level']),
    );
  }
}
