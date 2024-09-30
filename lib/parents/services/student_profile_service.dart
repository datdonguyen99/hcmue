import 'package:hcmue/parents/models/student_profile_model.dart';

class StudentProfileService {
  Future<StudentProfileModel> fetchStudentInfor(int prtId) async {
    try {
      final Map<String, dynamic> mockResponse = {
        'statusCode': 200,
        'data': {
          'firstName': 'Tech',
          'lastName': 'Dev',
          'grade': '8',
          'class_': '8A11',
          'email': 'info@techdev.vn',
          'phoneNumber': '0702 08 68 38',
          'address':
              'Số 10, Đường số 24, Bình Hưng, Bình Chánh, Hồ Chí Minh city.',
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
