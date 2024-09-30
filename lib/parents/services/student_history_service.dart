import 'package:hcmue/parents/models/student_history_model.dart';

class StudentHistoryService {
  Future<List<StudentHistoryModel>> fetchStudentHistory() async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': [
          {
            'title': 'Khóa học Flutter cơ bản',
            'description':
                'Khóa học Flutter cơ bản cung cấp những kiến thức nền tảng về Flutter, một bộ công cụ phát triển giao diện di động của Google. Khóa học sẽ hướng dẫn học viên cách tạo các ứng dụng di động trên cả iOS và Android từ bước đầu tiên, bao gồm việc thiết lập môi trường phát triển, xây dựng giao diện người dùng cơ bản, quản lý trạng thái và tích hợp dữ liệu.',
            'start_date': '2024-09-01T10:00:00Z',
            'completion_date': '2024-11-01T10:00:00Z',
            'completion_level': '65',
          },
          {
            'title': 'Khóa học Lập trình React Native',
            'description':
                'Khóa học này giới thiệu cách xây dựng ứng dụng di động sử dụng React Native, giúp học viên nắm bắt cách tạo ra các ứng dụng đa nền tảng một cách dễ dàng và hiệu quả.',
            'start_date': '2024-09-15T10:00:00Z',
            'completion_date': '2024-12-15T10:00:00Z',
            'completion_level': '70',
          },
          {
            'title': 'Khóa học Node.js cơ bản',
            'description':
                'Khóa học này sẽ hướng dẫn bạn về Node.js, một môi trường chạy JavaScript trên server, từ các kiến thức cơ bản đến xây dựng các ứng dụng thực tế.',
            'start_date': '2024-10-01T10:00:00Z',
            'completion_date': '2024-12-30T10:00:00Z',
            'completion_level': '85',
          },
          {
            'title': 'Khóa học Vue.js cơ bản',
            'description':
                'Học cách xây dựng ứng dụng giao diện với Vue.js, một framework JavaScript nhẹ và linh hoạt. Khóa học bao gồm các kiến thức cơ bản như component, directive và quản lý trạng thái.',
            'start_date': '2024-09-05T10:00:00Z',
            'completion_date': '2024-11-05T10:00:00Z',
            'completion_level': '25',
          },
          {
            'title': 'Khóa học Lập trình Python',
            'description':
                'Khóa học Python cơ bản này giúp bạn làm quen với ngôn ngữ lập trình Python, từ cú pháp cơ bản đến các ứng dụng thực tế như phân tích dữ liệu và học máy.',
            'start_date': '2024-08-20T10:00:00Z',
            'completion_date': '2024-10-20T10:00:00Z',
            'completion_level': '90',
          },
          {
            'title': 'Khóa học Lập trình Java cơ bản',
            'description':
                'Khóa học giúp bạn nắm vững các khái niệm lập trình Java, một trong những ngôn ngữ phổ biến nhất hiện nay, từ các cấu trúc cơ bản đến lập trình hướng đối tượng.',
            'start_date': '2024-07-15T10:00:00Z',
            'completion_date': '2024-09-15T10:00:00Z',
            'completion_level': '75',
          },
          {
            'title': 'Khóa học Lập trình C#',
            'description':
                'Khóa học C# cơ bản này giới thiệu về lập trình với C#, ngôn ngữ chính trong môi trường .NET, với các bài học từ cơ bản đến nâng cao.',
            'start_date': '2024-09-10T10:00:00Z',
            'completion_date': '2024-11-10T10:00:00Z',
            'completion_level': '60',
          },
          {
            'title': 'Khóa học SQL cho người mới bắt đầu',
            'description':
                'Khóa học này sẽ hướng dẫn cách làm việc với cơ sở dữ liệu SQL, bao gồm việc viết các truy vấn, cập nhật và quản lý dữ liệu trong các hệ thống cơ sở dữ liệu.',
            'start_date': '2024-08-01T10:00:00Z',
            'completion_date': '2024-10-01T10:00:00Z',
            'completion_level': '100',
          },
          {
            'title': 'Khóa học HTML & CSS',
            'description':
                'Khóa học này sẽ dạy bạn cách xây dựng và thiết kế các trang web cơ bản bằng HTML và CSS, bao gồm cách sử dụng các công cụ thiết kế hiện đại.',
            'start_date': '2024-09-01T10:00:00Z',
            'completion_date': '2024-11-01T10:00:00Z',
            'completion_level': '95',
          },
          {
            'title': 'Khóa học JavaScript Nâng Cao',
            'description':
                'Khóa học này tập trung vào các kỹ thuật lập trình JavaScript nâng cao, bao gồm các chủ đề như async/await, closure và prototype.',
            'start_date': '2024-10-01T10:00:00Z',
            'completion_date': '2024-12-01T10:00:00Z',
            'completion_level': '55',
          },
          {
            'title': 'Khóa học Phát triển Web với Django',
            'description':
                'Khóa học này sẽ giúp bạn học cách xây dựng các ứng dụng web mạnh mẽ và bảo mật bằng cách sử dụng Django, một framework nổi tiếng của Python.',
            'start_date': '2024-08-15T10:00:00Z',
            'completion_date': '2024-10-15T10:00:00Z',
            'completion_level': '72',
          },
          {
            'title': 'Khóa học Lập trình Android với Kotlin',
            'description':
                'Khóa học này sẽ giới thiệu cách lập trình ứng dụng Android sử dụng Kotlin, ngôn ngữ chính thức cho lập trình Android, từ cơ bản đến ứng dụng thực tế.',
            'start_date': '2024-07-25T10:00:00Z',
            'completion_date': '2024-09-25T10:00:00Z',
            'completion_level': '65',
          },
          {
            'title': 'Khóa học DevOps cơ bản',
            'description':
                'Khóa học này giới thiệu về DevOps, một phương pháp giúp cải thiện quy trình phát triển phần mềm, bao gồm các công cụ như Docker, Kubernetes và CI/CD.',
            'start_date': '2024-09-20T10:00:00Z',
            'completion_date': '2024-11-20T10:00:00Z',
            'completion_level': '77',
          },
          {
            'title': 'Khóa học An ninh mạng cơ bản',
            'description':
                'Khóa học này sẽ hướng dẫn các khái niệm cơ bản về an ninh mạng, bảo vệ hệ thống khỏi các mối đe dọa, và các công cụ bảo mật phổ biến như tường lửa và mã hóa.',
            'start_date': '2024-10-01T10:00:00Z',
            'completion_date': '2024-12-01T10:00:00Z',
            'completion_level': '68',
          },
          {
            'title': 'Khóa học Machine Learning cơ bản',
            'description':
                'Khóa học này giới thiệu về các thuật toán học máy cơ bản, cách áp dụng chúng vào các dự án thực tế, và cách phân tích dữ liệu sử dụng Python và TensorFlow.',
            'start_date': '2024-09-10T10:00:00Z',
            'completion_date': '2024-11-10T10:00:00Z',
            'completion_level': '92',
          },
        ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        return data.map((json) => StudentHistoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load study history');
      }
    } catch (e) {
      return <StudentHistoryModel>[];
    }
  }
}
