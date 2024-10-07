class LessonModel {
  LessonModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.videoUrl,
    required this.completionLevel,
  });

  final String id;
  final String title;
  final double duration;
  final String videoUrl;
  final double completionLevel;

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      title: json['title'],
      duration: json['duration'] is double
          ? json['duration']
          : double.parse(json['duration']),
      videoUrl: json['video_url'],
      completionLevel: json['completion_level'] is double
          ? json['completion_level']
          : double.parse(json['completion_level']),
    );
  }
}
