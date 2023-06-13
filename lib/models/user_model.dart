// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final Result? result;

  UserModel({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  UserModel copyWith({
    int? statusCode,
    bool? success,
    String? message,
    Result? result,
  }) =>
      UserModel(
        statusCode: statusCode ?? this.statusCode,
        success: success ?? this.success,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "result": result?.toJson(),
      };
}

class Result {
  final String? mobileNo;
  final String? emailId;
  final bool? blocked;
  final String? therapistId;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? dob;
  final String? gender;
  final String? role;
  final String? iniReg;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Result({
    this.mobileNo,
    this.emailId,
    this.blocked,
    this.therapistId,
    this.id,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.role,
    this.iniReg,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Result copyWith({
    String? mobileNo,
    String? emailId,
    bool? blocked,
    String? therapistId,
    String? id,
    String? firstName,
    String? lastName,
    String? dob,
    String? gender,
    String? role,
    String? iniReg,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      Result(
        mobileNo: mobileNo ?? this.mobileNo,
        emailId: emailId ?? this.emailId,
        blocked: blocked ?? this.blocked,
        therapistId: therapistId ?? this.therapistId,
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        role: role ?? this.role,
        iniReg: iniReg ?? this.iniReg,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        mobileNo: json["mobileNo"],
        emailId: json["emailId"],
        blocked: json["blocked"],
        therapistId: json["therapistId"],
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dob: json["dob"],
        gender: json["gender"],
        role: json["role"],
        iniReg: json["iniReg"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNo": mobileNo,
        "emailId": emailId,
        "blocked": blocked,
        "therapistId": therapistId,
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "dob": dob,
        "gender": gender,
        "role": role,
        "iniReg": iniReg,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
