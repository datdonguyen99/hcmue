class StudentProfileModel {
  StudentProfileModel({
    this.firstName,
    this.lastName,
    this.grade,
    this.class_,
    this.email,
    this.phoneNumber,
    this.address,
  });

  String? firstName;
  String? lastName;
  String? grade;
  String? class_;
  String? email;
  String? phoneNumber;
  String? address;

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) {
    return StudentProfileModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      grade: json['grade'],
      class_: json['class_'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
    );
  }
}
