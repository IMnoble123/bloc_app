import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final List<Result>? result;

  NotificationModel({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  NotificationModel copyWith({
    int? statusCode,
    bool? success,
    String? message,
    List<Result>? result,
  }) =>
      NotificationModel(
        statusCode: statusCode ?? this.statusCode,
        success: success ?? this.success,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  final String? id;
  final String? tag;
  final bool? iscompleted;
  final bool? unavailable;
  final String? updatedbyId;
  final String? createdbyId;
  final String? userId;
  final String? title;
  final String? username;
  final String? userphone;
  final String? emailId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final List<dynamic>? bookingDetails;

  Result({
    this.id,
    this.tag,
    this.iscompleted,
    this.unavailable,
    this.updatedbyId,
    this.createdbyId,
    this.userId,
    this.title,
    this.username,
    this.userphone,
    this.emailId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.bookingDetails,
  });

  Result copyWith({
    String? id,
    String? tag,
    bool? iscompleted,
    bool? unavailable,
    String? updatedbyId,
    String? createdbyId,
    String? userId,
    String? title,
    String? username,
    String? userphone,
    String? emailId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    List<dynamic>? bookingDetails,
  }) =>
      Result(
        id: id ?? this.id,
        tag: tag ?? this.tag,
        iscompleted: iscompleted ?? this.iscompleted,
        unavailable: unavailable ?? this.unavailable,
        updatedbyId: updatedbyId ?? this.updatedbyId,
        createdbyId: createdbyId ?? this.createdbyId,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        username: username ?? this.username,
        userphone: userphone ?? this.userphone,
        emailId: emailId ?? this.emailId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        bookingDetails: bookingDetails ?? this.bookingDetails,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        tag: json["tag"],
        iscompleted: json["iscompleted"],
        unavailable: json["unavailable"],
        updatedbyId: json["updatedbyId"],
        createdbyId: json["createdbyId"],
        userId: json["userId"],
        title: json["title"],
        username: json["username"],
        userphone: json["userphone"],
        emailId: json["emailId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        bookingDetails:
            json["booking_details"] == null ? [] : List<dynamic>.from(json["booking_details"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "tag": tag,
        "iscompleted": iscompleted,
        "unavailable": unavailable,
        "updatedbyId": updatedbyId,
        "createdbyId": createdbyId,
        "userId": userId,
        "title": title,
        "username": username,
        "userphone": userphone,
        "emailId": emailId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "booking_details": bookingDetails == null ? [] : List<dynamic>.from(bookingDetails!.map((x) => x)),
      };
}
