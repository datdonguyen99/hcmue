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
}
