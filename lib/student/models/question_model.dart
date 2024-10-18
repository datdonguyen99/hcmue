class QuestionModel {
  QuestionModel({
    required this.id,
    required this.content,
    required this.courseId,
    required this.createdAt,
    required this.userId,
    required this.fullName,
    required this.imageUrl,
  });

  final String id;
  final String content;
  final String courseId;
  final DateTime createdAt;
  final int userId;
  final String fullName;
  final String imageUrl;

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      content: json['content'],
      courseId: json['course_id'],
      createdAt: json['created_at'] is DateTime
          ? json['created_at']
          : DateTime.parse(json['created_at']),
      userId:
          json['user_id'] is int ? json['user_id'] : int.parse(json['user_id']),
      fullName: json['full_name'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'course_id': courseId,
      'created_at':
          createdAt.toIso8601String(), // Chuyển DateTime thành chuỗi ISO 8601
      'user_id': userId,
      'full_name': fullName,
      'image_url': imageUrl,
    };
  }
}
