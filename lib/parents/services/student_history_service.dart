import 'package:hcmue/parents/models/student_history_model.dart';

class StudentHistoryService {
  Future<List<StudentHistoryModel>> fetchStudentHistory() async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': [
          {
            'subject': 'Mathematics: integration derivative calculus 1 caculus 2',
            'date': '2024-09-01T10:00:00Z',
            'status': 'Completed',
          },
          {
            'subject': 'Science',
            'date': '2024-09-02T10:00:00Z',
            'status': 'Pending',
          },
          {
            'subject': 'History',
            'date': '2024-09-03T10:00:00Z',
            'status': 'Incompleted',
          },
          {
            'subject': 'Fundamental Programming C++',
            'date': '2024-09-01T10:00:00Z',
            'status': 'Completed',
          },
          {
            'subject': 'Data Structure and Algorithm',
            'date': '2024-09-02T10:00:00Z',
            'status': 'Pending',
          },
          {
            'subject': 'Principle Programming Language',
            'date': '2024-09-03T10:00:00Z',
            'status': 'Incompleted',
          },
          {
            'subject': 'Basic Flutter app',
            'date': '2024-09-01T10:00:00Z',
            'status': 'Completed',
          },
          {
            'subject': 'Science',
            'date': '2024-09-02T10:00:00Z',
            'status': 'Pending',
          },
          {
            'subject': 'History',
            'date': '2024-09-03T10:00:00Z',
            'status': 'Incompleted',
          },
          {
            'subject': 'Mathematics',
            'date': '2024-09-01T10:00:00Z',
            'status': 'Completed',
          },
          {
            'subject': 'Science',
            'date': '2024-09-02T10:00:00Z',
            'status': 'Pending',
          },
          {
            'subject': 'History',
            'date': '2024-09-03T10:00:00Z',
            'status': 'Incompleted',
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
