class SignUpModel {
  int? statusCode;
  bool? success;
  String? message;
  Result? result;

  SignUpModel({this.statusCode, this.success, this.message, this.result});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  String? mobileNo;
  String? emailId;
  bool? blocked;
  String? therapistId;
  String? sId;
  String? firstName;
  String? lastName;
  String? dob;
  String? gender;
  String? role;
  String? iniReg;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Result(
      {this.mobileNo, this.emailId, this.blocked, this.therapistId, this.sId, this.firstName, this.lastName, this.dob, this.gender, this.role, this.iniReg, this.createdAt, this.updatedAt, this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
    blocked = json['blocked'];
    therapistId = json['therapistId'];
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    gender = json['gender'];
    role = json['role'];
    iniReg = json['iniReg'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
