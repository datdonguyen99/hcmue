import 'package:hcmue/parents/models/student_profile_model.dart';

class StudentProfileService {
  Future<StudentProfileModel> fetchStudentInfor(int prtId) async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': {
          'firstName': 'DAT',
          'lastName': 'DO',
          'grade': '8',
          'class_': '8A11',
          'email': 'datdonguyen99@hcmue.edu.vn',
          'phoneNumber': '0396240327',
          'address':
              '72/24 Phan Đăng Lưu, p.6, q.Bình Thạnh, Hồ Chí Minh city.',
        },
      };

      // Simulate a delay (optional, to mimic network latency)
      await Future.delayed(const Duration(seconds: 2));

      if (mockResponse['statusCode'] == 200) {
        return StudentProfileModel.fromJson(mockResponse['data']);
      } else {
        throw Exception('Failed to load study profile');
      }
    } catch (e) {
      return StudentProfileModel();
    }
  }
}
