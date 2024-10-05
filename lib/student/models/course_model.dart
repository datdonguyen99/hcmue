class CourseModel {
  CourseModel({
    required this.title,
    required this.description,
    required this.author,
    required this.imageUrl,
    required this.rating,
    required this.totalHours,
    required this.lectures,
    required this.quizzes,
  });

  final String title;
  final String description;
  final String author;
  final String imageUrl;
  final double rating;
  final double totalHours;
  final int lectures;
  final int quizzes;

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      title: json['title'],
      description: json['description'],
      author: json['author'],
      imageUrl: json['image_url'],
      rating: json['rating'] is double
          ? json['rating']
          : double.parse(json['rating']),
      totalHours: json['total_hours'] is double
          ? json['total_hours']
          : double.parse(json['total_hours']),
      lectures: json['lectures'] is int
          ? json['lectures']
          : int.parse(json['lectures']),
      quizzes:
          json['quizzes'] is int ? json['quizzes'] : int.parse(json['quizzes']),
    );
  }
}
