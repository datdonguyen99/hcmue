class QuestionService {
  Future<List<dynamic>> fetchQuestionsByCourseId() async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': [
          {
            "id": "q001",
            "content": "Làm thế nào để quản lý trạng thái trong Flutter?",
            "course_id": "c001",
            "created_at": "2024-10-10T14:30:00Z",
            "user_id": 1,
            "full_name": "TechDev 1",
            "image_url": "https://via.placeholder.com/150"
          },
          {
            "id": "q002",
            "content": "Widget là gì trong Flutter?",
            "course_id": "c001",
            "created_at": "2024-11-10T14:12:00Z",
            "user_id": 2,
            "full_name": "TechDev 2",
            "image_url": "https://via.placeholder.com/150"
          },
          {
            "id": "q003",
            "content":
                "Sự khác biệt giữa StatefulWidget và StatelessWidget là gì?",
            "course_id": "c001",
            "created_at": "2024-10-12T10:15:00Z",
            "user_id": 3,
            "full_name": "TechDev 3",
            "image_url": "https://via.placeholder.com/150"
          },
          {
            "id": "q004",
            "content":
                "Làm thế nào để tạo giao diện người dùng responsive trong Flutter?",
            "course_id": "c001",
            "created_at": "2024-10-14T09:30:00Z",
            "user_id": 4,
            "full_name": "TechDev 4",
            "image_url": "https://via.placeholder.com/150"
          },
          {
            "id": "q005",
            "content": "Provider là gì và cách sử dụng nó trong Flutter?",
            "course_id": "c001",
            "created_at": "2024-10-15T11:45:00Z",
            "user_id": 5,
            "full_name": "TechDev 5",
            "image_url": "https://via.placeholder.com/150"
          }
        ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        return data;
      } else {
        throw Exception('Failed to load questions by courseId');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
