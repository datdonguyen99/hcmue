import 'package:hcmue/parents/models/student_result_model.dart';

class StudentResultService {
  Future<List<SemesterModel>> fetchSemester() async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': [
          {"id": "HK1", "name": "Học kì 1 "},
          {"id": "HK2", "name": "Học kì 2"},
        ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        return data.map((json) => SemesterModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load semester');
      }
    } catch (e) {
      return <SemesterModel>[];
    }
  }

  Future<List<StudentResultModel>> fetchStudentResultBySemester(
      String semesterId) async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': semesterId == "HK1"
            ? [
                {"subject": "Toán", "score": 8.0, "grade": "B"},
                {"subject": "Ngữ văn", "score": 5.5, "grade": "C"},
                {"subject": "Tiếng Anh", "score": 8.7, "grade": "A"},
                {"subject": "Vật lý", "score": 7.5, "grade": "B+"},
                {"subject": "Hóa học", "score": 9.0, "grade": "A"},
                {"subject": "Sinh học", "score": 7.8, "grade": "B"},
                {"subject": "Lịch sử", "score": 8.3, "grade": "A"},
                {"subject": "Địa lý", "score": 8.1, "grade": "A"},
                {"subject": "Giáo dục công dân", "score": 9.0, "grade": "A+"},
                {"subject": "Tin học", "score": 5.9, "grade": "C"},
                {"subject": "Công nghệ", "score": 7.4, "grade": "B+"},
                {"subject": "Thể dục", "score": 9.2, "grade": "A"},
                {"subject": "Âm nhạc", "score": 6.6, "grade": "C"},
                {"subject": "Mỹ thuật", "score": 7.9, "grade": "B"},
                {
                  "subject": "Giáo dục quốc phòng - An ninh",
                  "score": 8.5,
                  "grade": "A"
                },
              ]
            : [
                {"subject": "Toán", "score": 7.5, "grade": "B"},
                {"subject": "Ngữ văn", "score": 8.0, "grade": "A"},
                {"subject": "Tiếng Anh", "score": 9.1, "grade": "A"},
                {"subject": "Vật lý", "score": 8.3, "grade": "A"},
                {"subject": "Hóa học", "score": 7.9, "grade": "B"},
                {"subject": "Sinh học", "score": 8.5, "grade": "A"},
                {"subject": "Lịch sử", "score": 7.2, "grade": "B"},
                {"subject": "Địa lý", "score": 8.6, "grade": "A"},
                {"subject": "Giáo dục công dân", "score": 9.0, "grade": "A"},
                {"subject": "Tin học", "score": 8.4, "grade": "A"},
                {"subject": "Công nghệ", "score": 7.8, "grade": "B"},
                {"subject": "Thể dục", "score": 9.3, "grade": "A"},
                {"subject": "Âm nhạc", "score": 8.7, "grade": "A"},
                {"subject": "Mỹ thuật", "score": 7.6, "grade": "B"},
                {
                  "subject": "Giáo dục quốc phòng - An ninh",
                  "score": 8.2,
                  "grade": "A"
                }
              ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        return data.map((json) => StudentResultModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load results');
      }
    } catch (e) {
      return <StudentResultModel>[];
    }
  }

  Future<List<WeeklyResultModel>> fetchStudentResultByWeek() async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': [
          {
            "course_id": 1,
            "course_name": "Khóa học Flutter cơ bản",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": 90.0,
          },
          {
            "course_id": 1,
            "course_name": "Khóa học Flutter cơ bản",
            "week_number": 1,
            "weekly_test_name":
                "Bài kiểm tra tuần 1 Bài kiểm tra tuần 1 Bài kiểm tra tuần 1",
            "weekly_test_score": 85.0,
          },
          {
            "course_id": 1,
            "course_name": "Khóa học Flutter cơ bản",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 78.5,
          },
          {
            "course_id": 1,
            "course_name": "Khóa học Flutter cơ bản",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 92.0,
          },
          {
            "course_id": 2,
            "course_name": "Khóa học Lập trình React Native",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": 53.5,
          },
          {
            "course_id": 2,
            "course_name": "Khóa học Lập trình React Native",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": null,
          },
          {
            "course_id": 2,
            "course_name": "Khóa học Lập trình React Native",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 88.0,
          },
          {
            "course_id": 2,
            "course_name": "Khóa học Lập trình React Native",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 67.0,
          },
          {
            "course_id": 3,
            "course_name": "Khóa học Node.js cơ bản",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": 80.0,
          },
          {
            "course_id": 3,
            "course_name": "Khóa học Node.js cơ bản",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": 85.5,
          },
          {
            "course_id": 3,
            "course_name": "Khóa học Node.js cơ bản",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 90.0,
          },
          {
            "course_id": 3,
            "course_name": "Khóa học Node.js cơ bản",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 82.0,
          },
          {
            "course_id": 4,
            "course_name": "Khóa học Lập trình Python",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": 75.0,
          },
          {
            "course_id": 4,
            "course_name": "Khóa học Lập trình Python",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": 68.0,
          },
          {
            "course_id": 4,
            "course_name": "Khóa học Lập trình Python",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 90.0,
          },
          {
            "course_id": 4,
            "course_name": "Khóa học Lập trình Python",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 85.0,
          },
          {
            "course_id": 5,
            "course_name": "Khóa học Vue.js cơ bản",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": 82.5,
          },
          {
            "course_id": 5,
            "course_name": "Khóa học Vue.js cơ bản",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": null,
          },
          {
            "course_id": 5,
            "course_name": "Khóa học Vue.js cơ bản",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 91.5,
          },
          {
            "course_id": 5,
            "course_name": "Khóa học Vue.js cơ bản",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 94.0,
          },
          {
            "course_id": 6,
            "course_name": "Khóa học Lập trình C#",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": 78.0,
          },
          {
            "course_id": 6,
            "course_name": "Khóa học Lập trình C#",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": 83.0,
          },
          {
            "course_id": 6,
            "course_name": "Khóa học Lập trình C#",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 77.5,
          },
          {
            "course_id": 6,
            "course_name": "Khóa học Lập trình C#",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 90.5,
          },
          {
            "course_id": 7,
            "course_name": "Khóa học Lập trình Java cơ bản",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": null,
          },
          {
            "course_id": 7,
            "course_name": "Khóa học Lập trình Java cơ bản",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": 76.0,
          },
          {
            "course_id": 7,
            "course_name": "Khóa học Lập trình Java cơ bản",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 85.0,
          },
          {
            "course_id": 7,
            "course_name": "Khóa học Lập trình Java cơ bản",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 89.0,
          },
          {
            "course_id": 8,
            "course_name": "Khóa học Lập trình Android với Kotlin",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": 88.5,
          },
          {
            "course_id": 8,
            "course_name": "Khóa học Lập trình Android với Kotlin",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": 90.0,
          },
          {
            "course_id": 8,
            "course_name": "Khóa học Lập trình Android với Kotlin",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 92.0,
          },
          {
            "course_id": 8,
            "course_name": "Khóa học Lập trình Android với Kotlin",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 91.0,
          },
          {
            "course_id": 9,
            "course_name": "Khóa học DevOps cơ bản",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": 85.5,
          },
          {
            "course_id": 9,
            "course_name": "Khóa học DevOps cơ bản",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": null,
          },
          {
            "course_id": 9,
            "course_name": "Khóa học DevOps cơ bản",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 79.0,
          },
          {
            "course_id": 9,
            "course_name": "Khóa học DevOps cơ bản",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 91.0,
          },
          {
            "course_id": 10,
            "course_name": "Khóa học Machine Learning cơ bản",
            "week_number": 1,
            "weekly_test_name": "Bài kiểm tra tuần 1",
            "weekly_test_score": 90.0,
          },
          {
            "course_id": 10,
            "course_name": "Khóa học Machine Learning cơ bản",
            "week_number": 2,
            "weekly_test_name": "Bài kiểm tra tuần 2",
            "weekly_test_score": 82.5,
          },
          {
            "course_id": 10,
            "course_name": "Khóa học Machine Learning cơ bản",
            "week_number": 3,
            "weekly_test_name": "Bài kiểm tra tuần 3",
            "weekly_test_score": 75.0,
          },
          {
            "course_id": 10,
            "course_name": "Khóa học Machine Learning cơ bản",
            "week_number": 4,
            "weekly_test_name": "Bài kiểm tra tuần 4",
            "weekly_test_score": 88.0,
          },
        ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        Map<int, WeeklyResultModel> resultMap = {};

        for (var json in data) {
          int courseId = json['course_id'];

          if (!resultMap.containsKey(courseId)) {
            resultMap[courseId] = WeeklyResultModel(
              courseId: courseId,
              courseName: json['course_name'],
              weeklyTests: [],
            );
          }

          resultMap[courseId]!.weeklyTests.add(WeeklyTestModel.fromJson(json));
          // print(resultMap[courseId]!.weeklyTests.toList().toString());
        }

        return resultMap.values.toList();
      } else {
        throw Exception('Failed to load weekly results');
      }
    } catch (e) {
      return <WeeklyResultModel>[];
    }
  }

  Future<List<MonthlyResultModel>> fetchStudentResultByMonth() async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': [
          {
            "course_id": 1,
            "course_name": "Khóa học Flutter cơ bản",
            "month_number": 10,
            "monthly_test_name": "Bài kiểm tra tháng 10",
            "monthly_test_score": 90.0,
          },
          {
            "course_id": 1,
            "course_name": "Khóa học Flutter cơ bản",
            "month_number": 9,
            "monthly_test_name": "Bài kiểm tra tháng 9",
            "monthly_test_score": 85.0,
          },
          {
            "course_id": 1,
            "course_name": "Khóa học Flutter cơ bản",
            "month_number": 1,
            "monthly_test_name": "Bài kiểm tra tháng 1",
            "monthly_test_score": 78.5,
          },
          {
            "course_id": 1,
            "course_name": "Khóa học Flutter cơ bản",
            "month_number": 4,
            "monthly_test_name": "Bài kiểm tra tháng 4",
            "monthly_test_score": 92.0,
          },
          {
            "course_id": 2,
            "course_name": "Khóa học Lập trình React Native",
            "month_number": 7,
            "monthly_test_name": "Bài kiểm tra tháng 7",
            "monthly_test_score": 53.5,
          },
          {
            "course_id": 2,
            "course_name": "Khóa học Lập trình React Native",
            "month_number": 12,
            "monthly_test_name": "Bài kiểm tra tháng 12",
            "monthly_test_score": null,
          },
          {
            "course_id": 2,
            "course_name": "Khóa học Lập trình React Native",
            "month_number": 11,
            "monthly_test_name": "Bài kiểm tra tháng 11",
            "monthly_test_score": 88.0,
          },
          {
            "course_id": 2,
            "course_name": "Khóa học Lập trình React Native",
            "month_number": 8,
            "monthly_test_name": "Bài kiểm tra tháng 8",
            "monthly_test_score": 67.0,
          },
          {
            "course_id": 3,
            "course_name": "Khóa học Node.js cơ bản",
            "month_number": 4,
            "monthly_test_name": "Bài kiểm tra tháng 4",
            "monthly_test_score": 80.0,
          },
          {
            "course_id": 3,
            "course_name": "Khóa học Node.js cơ bản",
            "month_number": 1,
            "monthly_test_name": "Bài kiểm tra tháng 1",
            "monthly_test_score": 85.5,
          },
          {
            "course_id": 3,
            "course_name": "Khóa học Node.js cơ bản",
            "month_number": 3,
            "monthly_test_name": "Bài kiểm tra tháng 3",
            "monthly_test_score": 90.0,
          },
          {
            "course_id": 3,
            "course_name": "Khóa học Node.js cơ bản",
            "month_number": 2,
            "monthly_test_name": "Bài kiểm tra tháng 2",
            "monthly_test_score": 82.0,
          },
          {
            "course_id": 4,
            "course_name": "Khóa học Lập trình Python",
            "month_number": 5,
            "monthly_test_name": "Bài kiểm tra tháng 5",
            "monthly_test_score": 75.0,
          },
          {
            "course_id": 4,
            "course_name": "Khóa học Lập trình Python",
            "month_number": 3,
            "monthly_test_name": "Bài kiểm tra tháng 3",
            "monthly_test_score": 68.0,
          },
          {
            "course_id": 4,
            "course_name": "Khóa học Lập trình Python",
            "month_number": 6,
            "monthly_test_name": "Bài kiểm tra tháng 6",
            "monthly_test_score": 90.0,
          },
          {
            "course_id": 4,
            "course_name": "Khóa học Lập trình Python",
            "month_number": 9,
            "monthly_test_name": "Bài kiểm tra tháng 9",
            "monthly_test_score": 85.0,
          },
          {
            "course_id": 5,
            "course_name": "Khóa học Vue.js cơ bản",
            "month_number": 7,
            "monthly_test_name": "Bài kiểm tra tháng 7",
            "monthly_test_score": 82.5,
          },
          {
            "course_id": 5,
            "course_name": "Khóa học Vue.js cơ bản",
            "month_number": 8,
            "monthly_test_name": "Bài kiểm tra tháng 8",
            "monthly_test_score": null,
          },
          {
            "course_id": 5,
            "course_name": "Khóa học Vue.js cơ bản",
            "month_number": 2,
            "monthly_test_name": "Bài kiểm tra tháng 2",
            "monthly_test_score": 91.5,
          },
          {
            "course_id": 5,
            "course_name": "Khóa học Vue.js cơ bản",
            "month_number": 12,
            "monthly_test_name": "Bài kiểm tra tháng 12",
            "monthly_test_score": 94.0,
          },
          {
            "course_id": 6,
            "course_name": "Khóa học Lập trình C#",
            "month_number": 3,
            "monthly_test_name": "Bài kiểm tra tháng 3",
            "monthly_test_score": 78.0,
          },
          {
            "course_id": 6,
            "course_name": "Khóa học Lập trình C#",
            "month_number": 5,
            "monthly_test_name": "Bài kiểm tra tháng 5",
            "monthly_test_score": 83.0,
          },
          {
            "course_id": 6,
            "course_name": "Khóa học Lập trình C#",
            "month_number": 1,
            "monthly_test_name": "Bài kiểm tra tháng 1",
            "monthly_test_score": 77.5,
          },
          {
            "course_id": 6,
            "course_name": "Khóa học Lập trình C#",
            "month_number": 11,
            "monthly_test_name": "Bài kiểm tra tháng 11",
            "monthly_test_score": 90.5,
          },
          {
            "course_id": 7,
            "course_name": "Khóa học Lập trình Java cơ bản",
            "month_number": 6,
            "monthly_test_name": "Bài kiểm tra tháng 6",
            "monthly_test_score": null,
          },
          {
            "course_id": 7,
            "course_name": "Khóa học Lập trình Java cơ bản",
            "month_number": 10,
            "monthly_test_name": "Bài kiểm tra tháng 10",
            "monthly_test_score": 76.0,
          },
          {
            "course_id": 7,
            "course_name": "Khóa học Lập trình Java cơ bản",
            "month_number": 4,
            "monthly_test_name": "Bài kiểm tra tháng 4",
            "monthly_test_score": 85.0,
          },
          {
            "course_id": 7,
            "course_name": "Khóa học Lập trình Java cơ bản",
            "month_number": 9,
            "monthly_test_name": "Bài kiểm tra tháng 9",
            "monthly_test_score": 89.0,
          },
          {
            "course_id": 8,
            "course_name": "Khóa học Lập trình Android với Kotlin",
            "month_number": 12,
            "monthly_test_name": "Bài kiểm tra tháng 12",
            "monthly_test_score": 88.5,
          },
          {
            "course_id": 8,
            "course_name": "Khóa học Lập trình Android với Kotlin",
            "month_number": 1,
            "monthly_test_name": "Bài kiểm tra tháng 1",
            "monthly_test_score": 90.0,
          },
          {
            "course_id": 8,
            "course_name": "Khóa học Lập trình Android với Kotlin",
            "month_number": 5,
            "monthly_test_name": "Bài kiểm tra tháng 5",
            "monthly_test_score": 92.0,
          },
          {
            "course_id": 8,
            "course_name": "Khóa học Lập trình Android với Kotlin",
            "month_number": 3,
            "monthly_test_name": "Bài kiểm tra tháng 3",
            "monthly_test_score": 91.0,
          },
          {
            "course_id": 9,
            "course_name": "Khóa học DevOps cơ bản",
            "month_number": 11,
            "monthly_test_name": "Bài kiểm tra tháng 11",
            "monthly_test_score": 85.5,
          },
          {
            "course_id": 9,
            "course_name": "Khóa học DevOps cơ bản",
            "month_number": 7,
            "monthly_test_name": "Bài kiểm tra tháng 7",
            "monthly_test_score": 88.5,
          },
          {
            "course_id": 9,
            "course_name": "Khóa học DevOps cơ bản",
            "month_number": 2,
            "monthly_test_name": "Bài kiểm tra tháng 2",
            "monthly_test_score": null,
          },
          {
            "course_id": 9,
            "course_name": "Khóa học DevOps cơ bản",
            "month_number": 10,
            "monthly_test_name": "Bài kiểm tra tháng 10",
            "monthly_test_score": 84.0,
          }
        ]
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        List<dynamic> data = List<dynamic>.from(mockResponse['data'] as List);
        Map<int, MonthlyResultModel> resultMap = {};

        for (var json in data) {
          int courseId = json['course_id'];

          if (!resultMap.containsKey(courseId)) {
            resultMap[courseId] = MonthlyResultModel(
              courseId: courseId,
              courseName: json['course_name'],
              monthlyTests: [],
            );
          }

          resultMap[courseId]!
              .monthlyTests
              .add(MonthlyTestModel.fromJson(json));
        }

        return resultMap.values.toList();
      } else {
        throw Exception('Failed to load monthly results');
      }
    } catch (e) {
      return <MonthlyResultModel>[];
    }
  }
}
