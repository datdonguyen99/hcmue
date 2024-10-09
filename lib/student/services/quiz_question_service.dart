class QuizQuestionService {
  Future<List<dynamic>> fetchQuestionsByQuizId(String quizId) async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': quizId == 'quiz_1'
            ? [
                {
                  "question_id": "question_1",
                  "question": "Flutter là gì?",
                  "option_id": "option_1",
                  "text": "Một framework phát triển ứng dụng di động."
                },
                {
                  "question_id": "question_1",
                  "question": "Flutter là gì?",
                  "option_id": "option_2",
                  "text": "Một ngôn ngữ lập trình mới."
                },
                {
                  "question_id": "question_1",
                  "question": "Flutter là gì?",
                  "option_id": "option_3",
                  "text": "Một hệ điều hành di động."
                },
                {
                  "question_id": "question_1",
                  "question": "Flutter là gì?",
                  "option_id": "option_4",
                  "text": "Một dịch vụ đám mây."
                },
                {
                  "question_id": "question_2",
                  "question":
                      "Flutter hỗ trợ phát triển ứng dụng trên nền tảng nào?",
                  "option_id": "option_1",
                  "text": "iOS và Android."
                },
                {
                  "question_id": "question_2",
                  "question":
                      "Flutter hỗ trợ phát triển ứng dụng trên nền tảng nào?",
                  "option_id": "option_2",
                  "text": "Chỉ Android."
                },
                {
                  "question_id": "question_2",
                  "question":
                      "Flutter hỗ trợ phát triển ứng dụng trên nền tảng nào?",
                  "option_id": "option_3",
                  "text": "Chỉ iOS."
                },
                {
                  "question_id": "question_2",
                  "question":
                      "Flutter hỗ trợ phát triển ứng dụng trên nền tảng nào?",
                  "option_id": "option_4",
                  "text": "Không hỗ trợ di động."
                },
                {
                  "question_id": "question_3",
                  "question": "Widget trong Flutter là gì?",
                  "option_id": "option_1",
                  "text": "Là thành phần cơ bản trong ứng dụng Flutter."
                },
                {
                  "question_id": "question_3",
                  "question": "Widget trong Flutter là gì?",
                  "option_id": "option_2",
                  "text": "Là một công cụ lập trình."
                },
                {
                  "question_id": "question_3",
                  "question": "Widget trong Flutter là gì?",
                  "option_id": "option_3",
                  "text": "Là một thư viện mạng."
                },
                {
                  "question_id": "question_3",
                  "question": "Widget trong Flutter là gì?",
                  "option_id": "option_4",
                  "text": "Là một phương pháp quản lý trạng thái."
                },
                {
                  "question_id": "question_4",
                  "question":
                      "StatelessWidget khác với StatefulWidget như thế nào?",
                  "option_id": "option_1",
                  "text":
                      "StatelessWidget không thay đổi trạng thái sau khi khởi tạo."
                },
                {
                  "question_id": "question_4",
                  "question":
                      "StatelessWidget khác với StatefulWidget như thế nào?",
                  "option_id": "option_2",
                  "text": "StatefulWidget không bao giờ thay đổi trạng thái."
                },
                {
                  "question_id": "question_4",
                  "question":
                      "StatelessWidget khác với StatefulWidget như thế nào?",
                  "option_id": "option_3",
                  "text": "StatelessWidget luôn thay đổi trạng thái."
                },
                {
                  "question_id": "question_4",
                  "question":
                      "StatelessWidget khác với StatefulWidget như thế nào?",
                  "option_id": "option_4",
                  "text": "StatefulWidget không hiển thị trên màn hình."
                },
                {
                  "question_id": "question_5",
                  "question": "Làm thế nào để chạy ứng dụng Flutter?",
                  "option_id": "option_1",
                  "text": "Sử dụng lệnh 'flutter run'."
                },
                {
                  "question_id": "question_5",
                  "question": "Làm thế nào để chạy ứng dụng Flutter?",
                  "option_id": "option_2",
                  "text": "Sử dụng lệnh 'flutter build'."
                },
                {
                  "question_id": "question_5",
                  "question": "Làm thế nào để chạy ứng dụng Flutter?",
                  "option_id": "option_3",
                  "text": "Sử dụng lệnh 'flutter test'."
                },
                {
                  "question_id": "question_5",
                  "question": "Làm thế nào để chạy ứng dụng Flutter?",
                  "option_id": "option_4",
                  "text": "Sử dụng lệnh 'flutter debug'."
                },
              ]
            : quizId == 'quiz_2'
                ? [
                    {
                      "question_id": "question_1",
                      "question": "Quản lý trạng thái trong Flutter là gì?",
                      "option_id": "option_1",
                      "text": "Lưu trữ và cập nhật trạng thái của ứng dụng."
                    },
                    {
                      "question_id": "question_1",
                      "question": "Quản lý trạng thái trong Flutter là gì?",
                      "option_id": "option_2",
                      "text": "Lưu trữ và cập nhật giao diện."
                    },
                    {
                      "question_id": "question_1",
                      "question": "Quản lý trạng thái trong Flutter là gì?",
                      "option_id": "option_3",
                      "text": "Lưu trữ dữ liệu tạm thời."
                    },
                    {
                      "question_id": "question_1",
                      "question": "Quản lý trạng thái trong Flutter là gì?",
                      "option_id": "option_4",
                      "text": "Cập nhật dữ liệu tĩnh."
                    },
                    {
                      "question_id": "question_2",
                      "question": "Provider là gì trong Flutter?",
                      "option_id": "option_1",
                      "text": "Một phương pháp quản lý trạng thái."
                    },
                    {
                      "question_id": "question_2",
                      "question": "Provider là gì trong Flutter?",
                      "option_id": "option_2",
                      "text": "Một công cụ xây dựng UI."
                    },
                    {
                      "question_id": "question_2",
                      "question": "Provider là gì trong Flutter?",
                      "option_id": "option_3",
                      "text": "Một thư viện kết nối mạng."
                    },
                    {
                      "question_id": "question_2",
                      "question": "Provider là gì trong Flutter?",
                      "option_id": "option_4",
                      "text": "Một thành phần để kiểm thử."
                    },
                    {
                      "question_id": "question_3",
                      "question": "Khi nào sử dụng setState()?",
                      "option_id": "option_1",
                      "text": "Khi cần cập nhật giao diện ngay lập tức."
                    },
                    {
                      "question_id": "question_3",
                      "question": "Khi nào sử dụng setState()?",
                      "option_id": "option_2",
                      "text": "Khi cần gửi dữ liệu lên server."
                    },
                    {
                      "question_id": "question_3",
                      "question": "Khi nào sử dụng setState()?",
                      "option_id": "option_3",
                      "text": "Khi cần thay đổi theme."
                    },
                    {
                      "question_id": "question_3",
                      "question": "Khi nào sử dụng setState()?",
                      "option_id": "option_4",
                      "text": "Khi cần lưu trữ dữ liệu cục bộ."
                    },
                    {
                      "question_id": "question_4",
                      "question": "BLoC là gì trong Flutter?",
                      "option_id": "option_1",
                      "text": "Một mô hình quản lý trạng thái."
                    },
                    {
                      "question_id": "question_4",
                      "question": "BLoC là gì trong Flutter?",
                      "option_id": "option_2",
                      "text": "Một thư viện kết nối mạng."
                    },
                    {
                      "question_id": "question_4",
                      "question": "BLoC là gì trong Flutter?",
                      "option_id": "option_3",
                      "text": "Một framework xây dựng UI."
                    },
                    {
                      "question_id": "question_4",
                      "question": "BLoC là gì trong Flutter?",
                      "option_id": "option_4",
                      "text": "Một phương pháp để thiết kế giao diện."
                    },
                    {
                      "question_id": "question_5",
                      "question":
                          "Làm thế nào để cập nhật trạng thái trong BLoC?",
                      "option_id": "option_1",
                      "text": "Sử dụng Streams và Sinks."
                    },
                    {
                      "question_id": "question_5",
                      "question":
                          "Làm thế nào để cập nhật trạng thái trong BLoC?",
                      "option_id": "option_2",
                      "text": "Sử dụng setState()."
                    },
                    {
                      "question_id": "question_5",
                      "question":
                          "Làm thế nào để cập nhật trạng thái trong BLoC?",
                      "option_id": "option_3",
                      "text": "Sử dụng Widgets."
                    },
                    {
                      "question_id": "question_5",
                      "question":
                          "Làm thế nào để cập nhật trạng thái trong BLoC?",
                      "option_id": "option_4",
                      "text": "Sử dụng Service Workers."
                    }
                  ]
                : quizId == 'quiz_3'
                    ? [
                        {
                          "question_id": "question_1",
                          "question": "Dart là gì?",
                          "option_id": "option_1",
                          "text": "Ngôn ngữ lập trình chính của Flutter."
                        },
                        {
                          "question_id": "question_1",
                          "question": "Dart là gì?",
                          "option_id": "option_2",
                          "text": "Một hệ điều hành."
                        },
                        {
                          "question_id": "question_1",
                          "question": "Dart là gì?",
                          "option_id": "option_3",
                          "text": "Một nền tảng phát triển ứng dụng web."
                        },
                        {
                          "question_id": "question_1",
                          "question": "Dart là gì?",
                          "option_id": "option_4",
                          "text": "Một trình duyệt web."
                        },
                        {
                          "question_id": "question_2",
                          "question": "Dart được phát triển bởi ai?",
                          "option_id": "option_1",
                          "text": "Google."
                        },
                        {
                          "question_id": "question_2",
                          "question": "Dart được phát triển bởi ai?",
                          "option_id": "option_2",
                          "text": "Facebook."
                        },
                        {
                          "question_id": "question_2",
                          "question": "Dart được phát triển bởi ai?",
                          "option_id": "option_3",
                          "text": "Microsoft."
                        },
                        {
                          "question_id": "question_2",
                          "question": "Dart được phát triển bởi ai?",
                          "option_id": "option_4",
                          "text": "Apple."
                        },
                        {
                          "question_id": "question_3",
                          "question":
                              "Cú pháp Dart gần giống với ngôn ngữ nào?",
                          "option_id": "option_1",
                          "text": "JavaScript."
                        },
                        {
                          "question_id": "question_3",
                          "question":
                              "Cú pháp Dart gần giống với ngôn ngữ nào?",
                          "option_id": "option_2",
                          "text": "Python."
                        },
                        {
                          "question_id": "question_3",
                          "question":
                              "Cú pháp Dart gần giống với ngôn ngữ nào?",
                          "option_id": "option_3",
                          "text": "Swift."
                        },
                        {
                          "question_id": "question_3",
                          "question":
                              "Cú pháp Dart gần giống với ngôn ngữ nào?",
                          "option_id": "option_4",
                          "text": "Ruby."
                        },
                        {
                          "question_id": "question_4",
                          "question": "Kiểu dữ liệu nào không có trong Dart?",
                          "option_id": "option_1",
                          "text": "List."
                        },
                        {
                          "question_id": "question_4",
                          "question": "Kiểu dữ liệu nào không có trong Dart?",
                          "option_id": "option_2",
                          "text": "Tuple."
                        },
                        {
                          "question_id": "question_4",
                          "question": "Kiểu dữ liệu nào không có trong Dart?",
                          "option_id": "option_3",
                          "text": "String."
                        },
                        {
                          "question_id": "question_4",
                          "question": "Kiểu dữ liệu nào không có trong Dart?",
                          "option_id": "option_4",
                          "text": "Map."
                        },
                        {
                          "question_id": "question_5",
                          "question": "Null safety trong Dart có tác dụng gì?",
                          "option_id": "option_1",
                          "text": "Ngăn ngừa lỗi do giá trị null."
                        },
                        {
                          "question_id": "question_5",
                          "question": "Null safety trong Dart có tác dụng gì?",
                          "option_id": "option_2",
                          "text": "Tăng tốc độ biên dịch."
                        },
                        {
                          "question_id": "question_5",
                          "question": "Null safety trong Dart có tác dụng gì?",
                          "option_id": "option_3",
                          "text": "Giảm kích thước file ứng dụng."
                        },
                        {
                          "question_id": "question_5",
                          "question": "Null safety trong Dart có tác dụng gì?",
                          "option_id": "option_4",
                          "text": "Tối ưu hóa giao diện người dùng."
                        }
                      ]
                    : [
                        {
                          "question_id": "question_1",
                          "question":
                              "Widget nào được sử dụng để hiển thị văn bản trong Flutter?",
                          "option_id": "option_1",
                          "text": "Text."
                        },
                        {
                          "question_id": "question_1",
                          "question":
                              "Widget nào được sử dụng để hiển thị văn bản trong Flutter?",
                          "option_id": "option_2",
                          "text": "Label."
                        },
                        {
                          "question_id": "question_1",
                          "question":
                              "Widget nào được sử dụng để hiển thị văn bản trong Flutter?",
                          "option_id": "option_3",
                          "text": "Message."
                        },
                        {
                          "question_id": "question_1",
                          "question":
                              "Widget nào được sử dụng để hiển thị văn bản trong Flutter?",
                          "option_id": "option_4",
                          "text": "Paragraph."
                        },
                        {
                          "question_id": "question_2",
                          "question":
                              "Container trong Flutter được sử dụng để làm gì?",
                          "option_id": "option_1",
                          "text": "Để định dạng và bố trí các widget con."
                        },
                        {
                          "question_id": "question_2",
                          "question":
                              "Container trong Flutter được sử dụng để làm gì?",
                          "option_id": "option_2",
                          "text": "Để tạo giao diện người dùng đơn giản."
                        },
                        {
                          "question_id": "question_2",
                          "question":
                              "Container trong Flutter được sử dụng để làm gì?",
                          "option_id": "option_3",
                          "text": "Để lưu trữ dữ liệu."
                        },
                        {
                          "question_id": "question_2",
                          "question":
                              "Container trong Flutter được sử dụng để làm gì?",
                          "option_id": "option_4",
                          "text": "Để xử lý sự kiện."
                        },
                        {
                          "question_id": "question_3",
                          "question": "Stack trong Flutter cho phép làm gì?",
                          "option_id": "option_1",
                          "text": "Chồng các widget lên nhau."
                        },
                        {
                          "question_id": "question_3",
                          "question": "Stack trong Flutter cho phép làm gì?",
                          "option_id": "option_2",
                          "text": "Định dạng các widget theo hàng."
                        },
                        {
                          "question_id": "question_3",
                          "question": "Stack trong Flutter cho phép làm gì?",
                          "option_id": "option_3",
                          "text": "Tạo các trang điều hướng."
                        },
                        {
                          "question_id": "question_3",
                          "question": "Stack trong Flutter cho phép làm gì?",
                          "option_id": "option_4",
                          "text": "Tạo animation."
                        },
                        {
                          "question_id": "question_4",
                          "question": "Column trong Flutter là gì?",
                          "option_id": "option_1",
                          "text":
                              "Một widget để sắp xếp các widget theo chiều dọc."
                        },
                        {
                          "question_id": "question_4",
                          "question": "Column trong Flutter là gì?",
                          "option_id": "option_2",
                          "text":
                              "Một widget để sắp xếp các widget theo chiều ngang."
                        },
                        {
                          "question_id": "question_4",
                          "question": "Column trong Flutter là gì?",
                          "option_id": "option_3",
                          "text": "Một widget để tạo lưới."
                        },
                        {
                          "question_id": "question_4",
                          "question": "Column trong Flutter là gì?",
                          "option_id": "option_4",
                          "text": "Một widget để tạo menu."
                        },
                        {
                          "question_id": "question_5",
                          "question": "Scaffold là gì trong Flutter?",
                          "option_id": "option_1",
                          "text": "Một cấu trúc cơ bản cho giao diện ứng dụng."
                        },
                        {
                          "question_id": "question_5",
                          "question": "Scaffold là gì trong Flutter?",
                          "option_id": "option_2",
                          "text": "Một widget để hiển thị danh sách."
                        },
                        {
                          "question_id": "question_5",
                          "question": "Scaffold là gì trong Flutter?",
                          "option_id": "option_3",
                          "text": "Một thư viện để xây dựng UI."
                        },
                        {
                          "question_id": "question_5",
                          "question": "Scaffold là gì trong Flutter?",
                          "option_id": "option_4",
                          "text": "Một thành phần để kiểm thử."
                        },
                      ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        return data;
      } else {
        throw Exception('Failed to load quiz questions');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
