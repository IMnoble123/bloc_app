import 'package:equatable/equatable.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/models/booking_api_model.dart';
import 'package:ryt_life_cs/models/notification_model.dart';
import 'package:ryt_life_cs/models/therapiest_calender_model.dart';
import 'package:ryt_life_cs/models/theripiest_model.dart';
import 'package:ryt_life_cs/models/user_model.dart';
import 'package:ryt_life_cs/screens/mainScreen/calendar_widget/calendar_widget.dart';

class DashboardState extends Equatable {
  final bool isCreateUserScreen;
  final bool isbookAppointment;
  final List<Map<String, String>>? theripiestIdAndName;
  final String? seletedTheripiestByCS;
  final bool isCreateUser;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? dob;
  final String? gender;
  final NotificationModel notificationModel;
  final TheripiestModel theripiestModel;
  final UserModel userModel;
  final int? notificationTapedIndex;
  final TherapiestCalendarModel therapiestCalendarModel;
  final List<String>? timeSlots;
  final TheripiestModel? therapistProfileData;
  final String? selectedDate;
  final bool showSlotDetails;
  final String? selectedTime;
  final CalendarSlots? selectedSlot;
  final BookingApiModel bookingApiModel;
  final PaymentStatus? paymentStatus;
  final bool showLoader;
  final bool sessionStared;
  final String? tampTherapiestId;
  final String? tampuserId;

  const DashboardState({
    required this.notificationModel,
    required this.theripiestModel,
    required this.userModel,
    required this.therapiestCalendarModel,
    required this.bookingApiModel,
    this.timeSlots,
    this.isCreateUserScreen = false,
    this.isCreateUser = false,
    this.notificationTapedIndex,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.dob,
    this.gender,
    this.therapistProfileData,
    this.selectedDate,
    this.showSlotDetails = false,
    this.selectedTime,
    this.selectedSlot,
    this.paymentStatus,
    this.showLoader = false,
    this.sessionStared = false,
    this.isbookAppointment = false,
    this.seletedTheripiestByCS,
    this.tampTherapiestId,
    this.tampuserId,
    this.theripiestIdAndName,
  });

  DashboardState copyWith({
    bool? isCreateUserScreen,
    bool? isCreateUser,
    NotificationModel? notificationModel,
    TheripiestModel? theripiestModel,
    TherapiestCalendarModel? therapiestCalendarModel,
    UserModel? userModel,
    int? notificationTapedIndex,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? dob,
    String? gender,
    List<String>? timeSlots,
    TheripiestModel? therapistProfileData,
    String? selectedDate,
    bool? showSlotDetails,
    String? selectedTime,
    CalendarSlots? selectedSlot,
    BookingApiModel? bookingApiModel,
    PaymentStatus? paymentStatus,
    bool? showLoader,
    bool? sessionStared,
    bool? isbookAppointment,
    String? seletedTheripiestByCS,
    String? tampTherapiestId,
    String? tampuserId,
    List<Map<String, String>>? theripiestIdAndName,
  }) {
    return DashboardState(
      isCreateUserScreen: isCreateUserScreen ?? this.isCreateUserScreen,
      isCreateUser: isCreateUser ?? this.isCreateUser,
      notificationModel: notificationModel ?? this.notificationModel,
      theripiestModel: theripiestModel ?? this.theripiestModel,
      userModel: userModel ?? this.userModel,
      notificationTapedIndex: notificationTapedIndex ?? this.notificationTapedIndex,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      therapiestCalendarModel: therapiestCalendarModel ?? this.therapiestCalendarModel,
      timeSlots: timeSlots ?? this.timeSlots,
      therapistProfileData: therapistProfileData ?? this.therapistProfileData,
      selectedDate: selectedDate ?? this.selectedDate,
      showSlotDetails: showSlotDetails ?? this.showSlotDetails,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedSlot: selectedSlot ?? this.selectedSlot,
      bookingApiModel: bookingApiModel ?? this.bookingApiModel,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      showLoader: showLoader ?? this.showLoader,
      sessionStared: sessionStared ?? this.sessionStared,
      isbookAppointment: isbookAppointment ?? this.isbookAppointment,
      seletedTheripiestByCS: seletedTheripiestByCS ?? this.seletedTheripiestByCS,
      tampTherapiestId: tampTherapiestId ?? this.tampTherapiestId,
      tampuserId: tampuserId ?? this.tampuserId,
      theripiestIdAndName: theripiestIdAndName ?? this.theripiestIdAndName,
    );
  }

  @override
  List<Object> get props => [
        isCreateUserScreen,
        isCreateUser,
        notificationModel,
        theripiestModel,
        userModel,
        therapiestCalendarModel,
        notificationTapedIndex ?? -1,
        firstName ?? '',
        lastName ?? '',
        phone ?? '',
        email ?? '',
        dob ?? '',
        gender ?? '',
        timeSlots ?? [],
        therapistProfileData ?? TheripiestModel(),
        selectedDate ?? '',
        showSlotDetails,
        selectedTime ?? '',
        selectedSlot ?? '',
        bookingApiModel,
        paymentStatus ?? PaymentStatus.none,
        showLoader,
        sessionStared,
        isbookAppointment,
        seletedTheripiestByCS ?? '',
        tampTherapiestId ?? '',
        tampuserId ?? '',
        theripiestIdAndName ?? [],
      ];
}
