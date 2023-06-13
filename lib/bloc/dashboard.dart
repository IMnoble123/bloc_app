// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:ryt_life_cs/bloc/event/dashboard_event.dart';
import 'package:ryt_life_cs/bloc/repository/booking_repository.dart';
import 'package:ryt_life_cs/bloc/repository/theripiest.dart';
import 'package:ryt_life_cs/bloc/state/dashbord_state.dart';
import 'package:ryt_life_cs/models/booking_api_model.dart';
import 'package:ryt_life_cs/models/notification_model.dart';
import 'package:ryt_life_cs/bloc/repository/create_user.dart';
import 'package:ryt_life_cs/bloc/repository/notification_repository.dart';
import 'package:ryt_life_cs/models/therapiest_calender_model.dart';
import 'package:ryt_life_cs/models/theripiest_model.dart';
import 'package:ryt_life_cs/models/user_model.dart';
import 'package:ryt_life_cs/extension/list_of_slots_x.dart';

enum DashboardStatus { UPCOMING, LOADING, HOME }

enum BookApptPageStatus {
  LOADING,
  NEW_APPOINTMENT,
  RESCHEDULE_APPOINTMENT,
  MAKE_PAYMENT,
  PAST_DR_APPOINTMENT,
  ERROR,
  NO_SLOTS
}

enum PaymentStatus { uninitialized, paid, confirmed, failed, cancelled, none }

final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final CreateUserRepository createUserrepository;
  final NotificationRepository notificationRepository;
  final TheripiestRepository theripiestRepository;
  final BookingRepository bookingRepository;

  DashboardBloc(
      {required this.theripiestRepository,
      required this.createUserrepository,
      required this.notificationRepository,
      required this.bookingRepository})
      : super(DashboardState(
          notificationModel: NotificationModel(),
          theripiestModel: TheripiestModel(),
          userModel: UserModel(),
          therapiestCalendarModel: TherapiestCalendarModel(),
          bookingApiModel: BookingApiModel(),
        ));

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is GetCsNotification) {
      NotificationModel? model = await notificationRepository.getCsNotification();
      yield state.copyWith(notificationModel: model);
    }

    if (event is UpdateCsNotification) {
      NotificationModel? model = await notificationRepository.updateCsNotification(
        csId: event.csId,
        iscompleted: event.iscompleted ?? false,
        updatedbyId: event.updatedbyId,
        unavailable: event.unavailable ?? false,
      );

      // yield state.copyWith(notificationModel: model);
    }

    if (event is GetTheripiestData) {
      TheripiestModel? model = await theripiestRepository.getTheripiestData();
      yield state.copyWith(theripiestModel: model);
    }
    if (event is AssigneTheripiestToUser) {
      // await createUserrepository.createNewUser();
      // yield state.copyWith(notificationModel: model);
    }
    if (event is CreateUserAccount) {
      UserModel? model = await createUserrepository.createNewUser(
        dob: state.dob ?? '',
        emailId: state.email!,
        firstName: state.firstName!,
        gender: state.gender ?? '',
        lastName: state.lastName ?? '',
        mobileNo: state.phone!,
      );
      yield state.copyWith(userModel: model);
      yield state.copyWith(isCreateUser: true);
    }
    if (event is AssignTheripiestTouser) {
      // final model =
      await createUserrepository.assignTheripiestToUser(theripiestId: event.theripiestId, userId: event.userId);
      yield state.copyWith(tampTherapiestId: event.theripiestId, tampuserId: event.userId);
    }
    if (event is RemoveTemIds) {
      yield state.copyWith(tampTherapiestId: '', tampuserId: '');
    }
    if (event is AddTheripiestIdAndName) {
      yield state.copyWith(theripiestIdAndName: event.theripiestIdAndName);
    }

    if (event is IsCreateUserStatusUpdate) {
      yield state.copyWith(isCreateUser: event.isCreateUser);
    }

    if (event is NotificationTapedIndex) {
      yield state.copyWith(notificationTapedIndex: event.index);
    }
    if (event is CreateUserAccountScreen) {
      yield state.copyWith(isCreateUserScreen: event.isCreateUserScreen);
    }

    if (event is UpdateUserfirstName) {
      yield state.copyWith(firstName: event.value);
    }
    if (event is UpdateUserlastName) {
      yield state.copyWith(lastName: event.value);
    }
    if (event is UpdateUserphone) {
      yield state.copyWith(phone: event.value);
    }
    if (event is UpdateUseremail) {
      yield state.copyWith(email: event.value);
    }
    if (event is UpdateUserdob) {
      yield state.copyWith(dob: event.value);
    }
    if (event is UpdateUsergender) {
      yield state.copyWith(gender: event.value);
    }
    if (event is ClearDataForNewUser) {
      yield state.copyWith(firstName: null, lastName: null, phone: null, email: null, dob: null, gender: null);
    }
    if (event is SelectWeekDaySlot) {
      //SelectWeekDaySlot
      List<String> timeSlot = [];
      List<Day>? days = [];
      if (event.dayIndex == 0) {
        days = state.therapiestCalendarModel.result?[0].slots?.monday;
      } else if (event.dayIndex == 1) {
        days = state.therapiestCalendarModel.result?[0].slots?.tuesday;
      } else if (event.dayIndex == 2) {
        days = state.therapiestCalendarModel.result?[0].slots?.wednesday;
      } else if (event.dayIndex == 3) {
        days = state.therapiestCalendarModel.result?[0].slots?.thursday;
      } else if (event.dayIndex == 4) {
        days = state.therapiestCalendarModel.result?[0].slots?.friday;
      } else if (event.dayIndex == 5) {
        days = state.therapiestCalendarModel.result?[0].slots?.saturday;
      }
      days?.forEach((element) {
        String fromTime =
            '${element.from?.split(":")[0]}:${element.from?.split(":")[1]} ${element.from?.split(":")[2]}';
        String toTime = '${element.to?.split(":")[0]}:${element.to?.split(":")[1]} ${element.to?.split(":")[2]}';
        timeSlot.add(fromTime);
        timeSlot.add(toTime);
      });
      yield state.copyWith(timeSlots: timeSlot);
    }

    if (event is CalenderTherapist) {
      //get calender therapist
      // yield state.copyWith(
      //   dashboardState: state.dashboardState
      //       .copyWith(calenderByTherapistModel: CalenderByTherapistModel()),
      // );
      TherapiestCalendarModel? therapiestCalendarModel =
          await theripiestRepository.getTherapiestCalendarById(id: event.therapiestId);
      TheripiestModel? therapistProfileData = await theripiestRepository.getTherapiestById(id: event.therapiestId);

      List<String>? avilableSlots = [];
      final List<String> typeSlot = [
        "monday",
        "tuesday",
        "wednesday",
        "thursday",
        "friday",
        "saturday",
        "sunday",
      ];
      // for (var element in typeSlot) {

      // }
      print("therapiestCalendarModel::: ${therapiestCalendarModel?.result}");
      avilableSlots = therapiestCalendarModel?.result?.first.slots?.getFromTimeSlot();
      // therapiestCalendarModel?.result?.first.slots?.monday?.forEach((element) {
      //   String fromTime =
      //       '${element.from?.split(":")[0]}:${element.from?.split(":")[1]} ${element.from?.split(":")[2]}';
      //   // String toTime =
      //   //     '${element.to?.split(":")[0]}:${element.to?.split(":")[1]} ${element.to?.split(":")[2]}';
      //   avilableSlots.add(fromTime);
      // });
      yield state.copyWith(
          therapiestCalendarModel: therapiestCalendarModel,
          timeSlots: avilableSlots,
          therapistProfileData: therapistProfileData);
    }
    if (event is UpdateSelectedSlot) {
      yield state.copyWith(selectedSlot: event.value);
    }

    if (event is AppointmentDateChanged) {
      yield state.copyWith(
        selectedDate: DateFormat('dd/MM/yyyy').format(event.date).toString(),
      );
    }
    if (event is CreateBooking) {
      yield state.copyWith(showLoader: true);

      // Map body = {}, slotMap = {}, paymentDetails = {};

      DateFormat inputFormat = DateFormat('dd/MM/yyyy');
      String date = state.selectedDate ?? '';
      DateFormat weekDayFormat = DateFormat.EEEE();
      String day = weekDayFormat.format(inputFormat.parse(state.selectedDate ?? ''));
      String fromTime = state.selectedSlot?.from ?? '';
      String toTime = state.selectedSlot?.to ?? '';

      // body['doctorId'] = state.therapistProfileData?.result?.first.id;
      // body['userId'] = state.userModel.result?.id;
      // paymentDetails['fee'] = state.therapistProfileData?.result?.first.consultationFee ?? 0;
      // paymentDetails['currency'] = "INR";
      // slotMap['date'] = date;
      // slotMap['day'] = day.toLowerCase();
      // slotMap['slots'] = [state.selectedSlot?.toJson()];
      // body['bookedslots'] = slotMap;
      // body['payment'] = paymentDetails;

      // if (state.counsellorState.selectedDoctorProfile.isCouponApplied)
      //   body['coupon_name'] =
      //       state.dashboardState.couponCodeModel.result[0].couponName;
      // print('request body CreateBooking:: ${body}');
      BookingApiModel? response;
      if (!event.isCash) {
        response = await bookingRepository.createOrderWithRazerPay(
          therapistId: state.therapistProfileData?.result?.first.id ?? '',
          userId: state.userModel.result?.id ?? '',
          fee: '1', // state.therapistProfileData?.result?.first.consultationFee?.toString() ?? '0',
          date: date,
          day: day.toLowerCase(),
          from: fromTime,
          to: toTime,
        );
      } else {
        response = await bookingRepository.createOrderWithCash(
          therapistId: state.therapistProfileData?.result?.first.id ?? '',
          userId: state.userModel.result?.id ?? '',
          fee: state.therapistProfileData?.result?.first.consultationFee?.toString() ?? '0',
          date: date,
          day: day.toLowerCase(),
          from: fromTime,
          to: toTime,
        );
      }
      // print('response CreateBooking:: ${response.toJson()}');
      yield state.copyWith(
        bookingApiModel: response,
        paymentStatus: PaymentStatus.uninitialized,
        showLoader: false,
        sessionStared: true,
      );
    }
    if (event is BookAppointmentstateChange) {
      yield state.copyWith(isbookAppointment: event.isbookAppointment);
    }
    if (event is UpdateSeletedTheripiestByCS) {
      yield state.copyWith(seletedTheripiestByCS: event.seletedTheripiestByCS);
    }
  }
}
