class QuizService {
  Future<List<dynamic>> fetchQuizzesByCourseId() async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': [
          {
            'id': 'quiz_1',
            'title': 'Quiz Cơ Bản về Flutter',
            'course_id': 'course_1',
            'duration': 30,
            'description':
                'Kiểm tra kiến thức của bạn về những điều cơ bản của Flutter.',
          },
          {
            'id': 'quiz_2',
            'title': 'Quiz Quản Lý Trạng Thái',
            'course_id': 'course_1',
            'duration': 45,
            'description':
                'Đánh giá hiểu biết của bạn về quản lý trạng thái trong Flutter.',
          },
          {
            'id': 'quiz_3',
            'title': 'Quiz về Widget trong Flutter',
            'course_id': 'course_2',
            'duration': 35,
            'description':
                'Đánh giá kiến thức của bạn về các widget trong Flutter.',
          },
          {
            'id': 'quiz_4',
            'title': 'Quiz Kết Nối Mạng trong Flutter',
            'course_id': 'course_2',
            'duration': 50,
            'description':
                'Kiểm tra kỹ năng của bạn trong việc thực hiện các cuộc gọi API trong Flutter.',
          },
          {
            'id': 'quiz_5',
            'title': 'Quiz Điều Hướng trong Flutter',
            'course_id': 'course_3',
            'duration': 40,
            'description':
                'Kiểm tra sự hiểu biết của bạn về điều hướng và định tuyến trong Flutter.',
          },
          {
            'id': 'quiz_6',
            'title': 'Quiz về Animation trong Flutter',
            'course_id': 'course_3',
            'duration': 55,
            'description':
                'Kiểm tra kiến thức của bạn về các animation trong ứng dụng Flutter.',
          },
          {
            'id': 'quiz_7',
            'title': 'Quiz Kiểm Thử trong Flutter',
            'course_id': 'course_4',
            'duration': 60,
            'description':
                'Đánh giá hiểu biết của bạn về kiểm thử trong Flutter.',
          },
          {
            'id': 'quiz_8',
            'title': 'Quiz Tích Hợp Firebase',
            'course_id': 'course_4',
            'duration': 70,
            'description':
                'Kiểm tra kỹ năng của bạn trong việc tích hợp Firebase với ứng dụng Flutter.',
          },
          {
            'id': 'quiz_9',
            'title': 'Quiz Thiết Kế Giao Diện trong Flutter',
            'course_id': 'course_5',
            'duration': 45,
            'description':
                'Đánh giá kiến thức của bạn về các nguyên tắc thiết kế giao diện trong Flutter.',
          },
          {
            'id': 'quiz_10',
            'title': 'Quiz Triển Khai và Phát Hành',
            'course_id': 'course_5',
            'duration': 50,
            'description':
                'Kiểm tra sự hiểu biết của bạn về việc triển khai ứng dụng Flutter lên các cửa hàng ứng dụng.',
          },
        ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        return data;
      } else {
        throw Exception('Failed to load quiz');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
