// To parse this JSON data, do
//
//     final therapiestCalendarModel = therapiestCalendarModelFromJson(jsonString);

import 'dart:convert';

TherapiestCalendarModel therapiestCalendarModelFromJson(String str) =>
    TherapiestCalendarModel.fromJson(json.decode(str));

String therapiestCalendarModelToJson(TherapiestCalendarModel data) => json.encode(data.toJson());

class TherapiestCalendarModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final List<Result>? result;

  TherapiestCalendarModel({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  TherapiestCalendarModel copyWith({
    int? statusCode,
    bool? success,
    String? message,
    List<Result>? result,
  }) =>
      TherapiestCalendarModel(
        statusCode: statusCode ?? this.statusCode,
        success: success ?? this.success,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory TherapiestCalendarModel.fromJson(Map<String, dynamic> json) => TherapiestCalendarModel(
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
  final String? therapistId;
  final Slots? slots;
  final List<dynamic>? slotTimestamp;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final DateTime? fromDate;
  final DateTime? toDate;

  Result({
    this.id,
    this.therapistId,
    this.slots,
    this.slotTimestamp,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.fromDate,
    this.toDate,
  });

  Result copyWith({
    String? id,
    String? therapistId,
    Slots? slots,
    List<dynamic>? slotTimestamp,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    DateTime? fromDate,
    DateTime? toDate,
  }) =>
      Result(
        id: id ?? this.id,
        therapistId: therapistId ?? this.therapistId,
        slots: slots ?? this.slots,
        slotTimestamp: slotTimestamp ?? this.slotTimestamp,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        therapistId: json["therapistId"],
        slots: json["slots"] == null ? null : Slots.fromJson(json["slots"]),
        slotTimestamp: json["slot_timestamp"] == null ? [] : List<dynamic>.from(json["slot_timestamp"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "therapistId": therapistId,
        "slots": slots?.toJson(),
        "slot_timestamp": slotTimestamp == null ? [] : List<dynamic>.from(slotTimestamp!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "fromDate": fromDate?.toIso8601String(),
        "toDate": toDate?.toIso8601String(),
      };
}

class Slots {
  final List<Day>? monday;
  final List<Day>? tuesday;
  final List<Day>? wednesday;
  final List<Day>? thursday;
  final List<Day>? friday;
  final List<Day>? saturday;
  final List<Day>? sunday;

  Slots({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  Slots copyWith({
    List<Day>? monday,
    List<Day>? tuesday,
    List<Day>? wednesday,
    List<Day>? thursday,
    List<Day>? friday,
    List<Day>? saturday,
    List<Day>? sunday,
  }) =>
      Slots(
        monday: monday ?? this.monday,
        tuesday: tuesday ?? this.tuesday,
        wednesday: wednesday ?? this.wednesday,
        thursday: thursday ?? this.thursday,
        friday: friday ?? this.friday,
        saturday: saturday ?? this.saturday,
        sunday: sunday ?? this.sunday,
      );

  factory Slots.fromJson(Map<String, dynamic> json) => Slots(
        monday: json["Monday"] == null ? [] : List<Day>.from(json["Monday"]!.map((x) => Day.fromJson(x))),
        tuesday: json["Tuesday"] == null ? [] : List<Day>.from(json["Tuesday"]!.map((x) => Day.fromJson(x))),
        wednesday: json["Wednesday"] == null ? [] : List<Day>.from(json["Wednesday"]!.map((x) => Day.fromJson(x))),
        thursday: json["Thursday"] == null ? [] : List<Day>.from(json["Thursday"]!.map((x) => Day.fromJson(x))),
        friday: json["Friday"] == null ? [] : List<Day>.from(json["Friday"]!.map((x) => Day.fromJson(x))),
        saturday: json["Saturday"] == null ? [] : List<Day>.from(json["Saturday"]!.map((x) => Day.fromJson(x))),
        sunday: json["Sunday"] == null ? [] : List<Day>.from(json["Sunday"]!.map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Monday": monday == null ? [] : List<dynamic>.from(monday!.map((x) => x.toJson())),
        "Tuesday": tuesday == null ? [] : List<dynamic>.from(tuesday!.map((x) => x.toJson())),
        "Wednesday": wednesday == null ? [] : List<dynamic>.from(wednesday!.map((x) => x.toJson())),
        "Thursday": thursday == null ? [] : List<dynamic>.from(thursday!.map((x) => x.toJson())),
        "Friday": friday == null ? [] : List<dynamic>.from(friday!.map((x) => x.toJson())),
        "Saturday": saturday == null ? [] : List<dynamic>.from(saturday!.map((x) => x.toJson())),
        "Sunday": sunday == null ? [] : List<dynamic>.from(sunday!.map((x) => x.toJson())),
      };
}

class Day {
  final String? from;
  final String? to;

  Day({
    this.from,
    this.to,
  });

  Day copyWith({
    String? from,
    String? to,
  }) =>
      Day(
        from: from ?? this.from,
        to: to ?? this.to,
      );

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
      };
}

// enum From { THE_1000_AM, THE_1100_AM, THE_1200_PM }

// final fromValues = EnumValues({
//     "10:00:AM": From.THE_1000_AM,
//     "11:00:AM": From.THE_1100_AM,
//     "12:00:PM": From.THE_1200_PM
// });

// enum To { THE_1030_AM, THE_1130_PM, THE_1230_PM }

// final toValues = EnumValues({
//     "10:30:AM": To.THE_1030_AM,
//     "11:30:PM": To.THE_1130_PM,
//     "12:30:PM": To.THE_1230_PM
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
