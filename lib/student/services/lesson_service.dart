class LessonService {
  Future<List<dynamic>> fetchLessonsByCourseId() async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': [
          {
            "id": "lesson_1",
            "title": "Giới thiệu về Flutter",
            "duration": 30.5,
            "video_url": "https://www.youtube.com/watch?v=1ukSR1GRtMU",
            "completion_level": 43.2,
          },
          {
            "id": "lesson_2",
            "title": "Quản lý trạng thái trong Flutter",
            "duration": 45.0,
            "video_url": "https://www.youtube.com/watch?v=ek8ZPdWj4Qo",
            "completion_level": 53.6,
          },
          {
            "id": "lesson_3",
            "title": "Làm việc với API",
            "duration": 40.75,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 77.9,
          },
          {
            "id": "lesson_4",
            "title": "Xây dựng giao diện người dùng trong Flutter",
            "duration": 50.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 95.0,
          },
          {
            "id": "lesson_5",
            "title": "Sử dụng Widget trong Flutter",
            "duration": 35.5,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 60.0,
          },
          {
            "id": "lesson_6",
            "title": "Điều hướng giữa các màn hình",
            "duration": 42.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 68.5,
          },
          {
            "id": "lesson_7",
            "title": "Tạo Form và Xử lý Dữ liệu",
            "duration": 55.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 75.0,
          },
          {
            "id": "lesson_8",
            "title": "Tích hợp Firebase vào ứng dụng Flutter",
            "duration": 60.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 80.0,
          },
          {
            "id": "lesson_9",
            "title": "Xây dựng ứng dụng đa nền tảng",
            "duration": 70.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 85.0,
          },
          {
            "id": "lesson_10",
            "title": "Triển khai ứng dụng lên Play Store",
            "duration": 45.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 40.0,
          },
          {
            "id": "lesson_11",
            "title": "Kiểm thử và Debug trong Flutter",
            "duration": 48.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 92.0,
          },
          {
            "id": "lesson_12",
            "title": "Tối ưu hiệu suất ứng dụng",
            "duration": 40.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 68.0,
          },
          {
            "id": "lesson_13",
            "title": "Sử dụng Animation trong Flutter",
            "duration": 54.5,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 87.0,
          },
          {
            "id": "lesson_14",
            "title": "Thiết kế Responsive cho ứng dụng",
            "duration": 49.0,
            "video_url":
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "completion_level": 91.0,
          },
        ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        return data;
      } else {
        throw Exception('Failed to load my course');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
