class StudentHistoryModel {
  StudentHistoryModel({
    required this.subject,
    required this.date,
    required this.status,
  });

  String subject;
  DateTime date;
  String status;

  factory StudentHistoryModel.fromJson(Map<String, dynamic> json) {
    return StudentHistoryModel(
      subject: json['subject'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }
}
