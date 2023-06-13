// To parse this JSON data, do
//
//     final bookingApiModel = bookingApiModelFromJson(jsonString);

import 'dart:convert';

BookingApiModel bookingApiModelFromJson(String str) => BookingApiModel.fromJson(json.decode(str));

String bookingApiModelToJson(BookingApiModel data) => json.encode(data.toJson());

class BookingApiModel {
    final int? statusCode;
    final bool? success;
    final String? message;
    final Result? result;

    BookingApiModel({
        this.statusCode,
        this.success,
        this.message,
        this.result,
    });

    BookingApiModel copyWith({
        int? statusCode,
        bool? success,
        String? message,
        Result? result,
    }) => 
        BookingApiModel(
            statusCode: statusCode ?? this.statusCode,
            success: success ?? this.success,
            message: message ?? this.message,
            result: result ?? this.result,
        );

    factory BookingApiModel.fromJson(Map<String, dynamic> json) => BookingApiModel(
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
    final int? rescheduledCount;
    final String? payoutStatus;
    final String? id;
    final String? therapistId;
    final String? userId;
    final Payment? payment;
    final Bookedslots? bookedslots;
    final Order? order;
    final DateTime? bookedSlotsTime;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    Result({
        this.rescheduledCount,
        this.payoutStatus,
        this.id,
        this.therapistId,
        this.userId,
        this.payment,
        this.bookedslots,
        this.order,
        this.bookedSlotsTime,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    Result copyWith({
        int? rescheduledCount,
        String? payoutStatus,
        String? id,
        String? therapistId,
        String? userId,
        Payment? payment,
        Bookedslots? bookedslots,
        Order? order,
        DateTime? bookedSlotsTime,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        Result(
            rescheduledCount: rescheduledCount ?? this.rescheduledCount,
            payoutStatus: payoutStatus ?? this.payoutStatus,
            id: id ?? this.id,
            therapistId: therapistId ?? this.therapistId,
            userId: userId ?? this.userId,
            payment: payment ?? this.payment,
            bookedslots: bookedslots ?? this.bookedslots,
            order: order ?? this.order,
            bookedSlotsTime: bookedSlotsTime ?? this.bookedSlotsTime,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        rescheduledCount: json["rescheduled_count"],
        payoutStatus: json["payout_status"],
        id: json["_id"],
        therapistId: json["therapistId"],
        userId: json["userId"],
        payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        bookedslots: json["bookedslots"] == null ? null : Bookedslots.fromJson(json["bookedslots"]),
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
        bookedSlotsTime: json["bookedSlotsTime"] == null ? null : DateTime.parse(json["bookedSlotsTime"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "rescheduled_count": rescheduledCount,
        "payout_status": payoutStatus,
        "_id": id,
        "therapistId": therapistId,
        "userId": userId,
        "payment": payment?.toJson(),
        "bookedslots": bookedslots?.toJson(),
        "order": order?.toJson(),
        "bookedSlotsTime": bookedSlotsTime?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Bookedslots {
    final String? date;
    final String? day;
    final List<Slot>? slots;

    Bookedslots({
        this.date,
        this.day,
        this.slots,
    });

    Bookedslots copyWith({
        String? date,
        String? day,
        List<Slot>? slots,
    }) => 
        Bookedslots(
            date: date ?? this.date,
            day: day ?? this.day,
            slots: slots ?? this.slots,
        );

    factory Bookedslots.fromJson(Map<String, dynamic> json) => Bookedslots(
        date: json["date"],
        day: json["day"],
        slots: json["slots"] == null ? [] : List<Slot>.from(json["slots"]!.map((x) => Slot.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "day": day,
        "slots": slots == null ? [] : List<dynamic>.from(slots!.map((x) => x.toJson())),
    };
}

class Slot {
    final String? from;
    final String? to;

    Slot({
        this.from,
        this.to,
    });

    Slot copyWith({
        String? from,
        String? to,
    }) => 
        Slot(
            from: from ?? this.from,
            to: to ?? this.to,
        );

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        from: json["from"],
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
    };
}

class Order {
    final String? id;
    final String? entity;
    final int? amount;
    final int? amountPaid;
    final int? amountDue;
    final String? currency;
    final String? receipt;
    final dynamic offerId;
    final String? status;
    final int? attempts;
    final List<dynamic>? notes;
    final int? createdAt;

    Order({
        this.id,
        this.entity,
        this.amount,
        this.amountPaid,
        this.amountDue,
        this.currency,
        this.receipt,
        this.offerId,
        this.status,
        this.attempts,
        this.notes,
        this.createdAt,
    });

    Order copyWith({
        String? id,
        String? entity,
        int? amount,
        int? amountPaid,
        int? amountDue,
        String? currency,
        String? receipt,
        dynamic offerId,
        String? status,
        int? attempts,
        List<dynamic>? notes,
        int? createdAt,
    }) => 
        Order(
            id: id ?? this.id,
            entity: entity ?? this.entity,
            amount: amount ?? this.amount,
            amountPaid: amountPaid ?? this.amountPaid,
            amountDue: amountDue ?? this.amountDue,
            currency: currency ?? this.currency,
            receipt: receipt ?? this.receipt,
            offerId: offerId ?? this.offerId,
            status: status ?? this.status,
            attempts: attempts ?? this.attempts,
            notes: notes ?? this.notes,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        entity: json["entity"],
        amount: json["amount"],
        amountPaid: json["amount_paid"],
        amountDue: json["amount_due"],
        currency: json["currency"],
        receipt: json["receipt"],
        offerId: json["offer_id"],
        status: json["status"],
        attempts: json["attempts"],
        notes: json["notes"] == null ? [] : List<dynamic>.from(json["notes"]!.map((x) => x)),
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entity": entity,
        "amount": amount,
        "amount_paid": amountPaid,
        "amount_due": amountDue,
        "currency": currency,
        "receipt": receipt,
        "offer_id": offerId,
        "status": status,
        "attempts": attempts,
        "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
        "created_at": createdAt,
    };
}

class Payment {
    final String? fee;
    final String? currency;

    Payment({
        this.fee,
        this.currency,
    });

    Payment copyWith({
        String? fee,
        String? currency,
    }) => 
        Payment(
            fee: fee ?? this.fee,
            currency: currency ?? this.currency,
        );

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        fee: json["fee"],
        currency: json["currency"],
    );

    Map<String, dynamic> toJson() => {
        "fee": fee,
        "currency": currency,
    };
}
