// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:intl/intl.dart';

class Utils {
  static const List<String> Psychologist = [
    "Addiction",
    "ADHD/ADD",
    "Anger Issues",
    "Anxiety",
    "Bipolar disorder",
    "Career counseling",
    "Child psychology",
    "Dementia",
    "Depression",
    "Dyslexia/ Dyscalculia/Dyspraxia",
    "Eating disorder",
    "Fears/Phobia",
    "General/ Personal growth",
    "Grief/loss",
    "Insomnia",
    "Postpartum depression/ issues",
    "Mood disorder",
    "OCD/OCPD",
    "Panic disorder",
    "PTSD",
    "Relationship issues",
    "Schizophrenia",
    "Sexual issues",
    "Stress",
    "Others"
  ];
  static const List<String> Psychiatrist = [
    "child and adolescent psychiatry",
    "geriatric psychiatry",
    "forensic (legal) psychiatry",
    "addiction psychiatry",
    "emergency psychiatry",
    "general psychiatry",
    "mental retardation psychiatry",
    "Pain medicine",
    "Sleep medicine",
    "Psychosomatic (mind and body) medicine",
    "Others"
  ];

  static const List<String> Languages = [
    'english',
    'hindi',
    'bengali',
    'marathi',
    'punjabi',
    'gujarati',
    'nepali',
    'telugu',
    'tamil',
    'kannada',
    'malayalam',
  ];

  static const List<String> appointmentFilter = [
    'Completed',
    'TBD',
    'Upcoming',
    'Cancelled',
    'Rescheduled',
    'All'
  ];

  final RegExp passwordRegex = RegExp(
    r"^(?=.*\d)(?=.*[a-zA-Z0-9])(?=.*[^\w\d\s:])([^\s]){8,16}$",
    caseSensitive: false,
    multiLine: false,
  );

  bool validateEmail(String email) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }


  static showToast(String? message) {
    FluttertoastWebPlugin().addHtmlToast(
      bgcolor: "linear-gradient(to right, #FFBA00, #FFBA00)",
      msg: message ?? "Something went wrong",
      gravity: 'center',
      position: 'center',
      time: 5000,
    );
  }

  static String getCouponCodeDate(String givenTime){
    DateTime dateTime = DateTime.parse(givenTime);
    var couponFormat = DateFormat('dd.MM.yyyy');
    final String couponDateTime = couponFormat.format(dateTime);
    return couponDateTime;
  }

  static bool checkCancelBtnActive(date) {
    return true;
  }

  static int getWeekdayInNumber() {
    DateTime currentDay = DateTime.now();
    if (currentDay.weekday == DateTime.monday) {
      return 1;
    }
    if (currentDay.weekday == DateTime.tuesday) {
      return 2;
    }
    if (currentDay.weekday == DateTime.wednesday) {
      return 3;
    }
    if (currentDay.weekday == DateTime.thursday) {
      return 4;
    }
    if (currentDay.weekday == DateTime.friday) {
      return 5;
    }
    if (currentDay.weekday == DateTime.saturday) {
      return 6;
    }
    if (currentDay.weekday == DateTime.sunday) {
      return 7;
    }
    return 0;
  }

  static printJson(Object obj){
    String json =  const JsonEncoder.withIndent('  ').convert(obj);
    print(json);
  }

}
