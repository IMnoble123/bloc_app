// To parse this JSON data, do
//
//     final theripiestModel = theripiestModelFromJson(jsonString);

import 'dart:convert';

TheripiestModel theripiestModelFromJson(String str) => TheripiestModel.fromJson(json.decode(str));

String theripiestModelToJson(TheripiestModel data) => json.encode(data.toJson());

class TheripiestModel {
    final int? statusCode;
    final bool? success;
    final String? message;
    final List<Result>? result;

    TheripiestModel({
        this.statusCode,
        this.success,
        this.message,
        this.result,
    });

    TheripiestModel copyWith({
        int? statusCode,
        bool? success,
        String? message,
        List<Result>? result,
    }) => 
        TheripiestModel(
            statusCode: statusCode ?? this.statusCode,
            success: success ?? this.success,
            message: message ?? this.message,
            result: result ?? this.result,
        );

    factory TheripiestModel.fromJson(Map<String, dynamic> json) => TheripiestModel(
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
    final List<dynamic>? specialization;
    final List<String>? languages;
    final bool? blocked;
    final bool? passwordCreated;
    final bool? hidden;
    final String? name;
    final String? emailId;
    final int? mobileNo;
    final int? consultationFee;
    final String? profileImage;
    final String? description;
    final List<dynamic>? qualification;
    final List<dynamic>? council;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final List<dynamic>? bookingDetails;

    Result({
        this.id,
        this.specialization,
        this.languages,
        this.blocked,
        this.passwordCreated,
        this.hidden,
        this.name,
        this.emailId,
        this.mobileNo,
        this.consultationFee,
        this.profileImage,
        this.description,
        this.qualification,
        this.council,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.bookingDetails,
    });

    Result copyWith({
        String? id,
        List<dynamic>? specialization,
        List<String>? languages,
        bool? blocked,
        bool? passwordCreated,
        bool? hidden,
        String? name,
        String? emailId,
        int? mobileNo,
        int? consultationFee,
        String? profileImage,
        String? description,
        List<dynamic>? qualification,
        List<dynamic>? council,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
        List<dynamic>? bookingDetails,
    }) => 
        Result(
            id: id ?? this.id,
            specialization: specialization ?? this.specialization,
            languages: languages ?? this.languages,
            blocked: blocked ?? this.blocked,
            passwordCreated: passwordCreated ?? this.passwordCreated,
            hidden: hidden ?? this.hidden,
            name: name ?? this.name,
            emailId: emailId ?? this.emailId,
            mobileNo: mobileNo ?? this.mobileNo,
            consultationFee: consultationFee ?? this.consultationFee,
            profileImage: profileImage ?? this.profileImage,
            description: description ?? this.description,
            qualification: qualification ?? this.qualification,
            council: council ?? this.council,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
            bookingDetails: bookingDetails ?? this.bookingDetails,
        );

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        specialization: json["specialization"] == null ? [] : List<dynamic>.from(json["specialization"]!.map((x) => x)),
        languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
        blocked: json["blocked"],
        passwordCreated: json["password_created"],
        hidden: json["hidden"],
        name: json["name"],
        emailId: json["emailId"],
        mobileNo: json["mobileNo"],
        consultationFee: json["consultation_fee"],
        profileImage: json["profile_image"],
        description: json["description"],
        qualification: json["qualification"] == null ? [] : List<dynamic>.from(json["qualification"]!.map((x) => x)),
        council: json["council"] == null ? [] : List<dynamic>.from(json["council"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        bookingDetails: json["booking_details"] == null ? [] : List<dynamic>.from(json["booking_details"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "specialization": specialization == null ? [] : List<dynamic>.from(specialization!.map((x) => x)),
        "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
        "blocked": blocked,
        "password_created": passwordCreated,
        "hidden": hidden,
        "name": name,
        "emailId": emailId,
        "mobileNo": mobileNo,
        "consultation_fee": consultationFee,
        "profile_image": profileImage,
        "description": description,
        "qualification": qualification == null ? [] : List<dynamic>.from(qualification!.map((x) => x)),
        "council": council == null ? [] : List<dynamic>.from(council!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "booking_details": bookingDetails == null ? [] : List<dynamic>.from(bookingDetails!.map((x) => x)),
    };
}
