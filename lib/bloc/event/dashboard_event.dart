import 'package:equatable/equatable.dart';
import 'package:ryt_life_cs/models/therapiest_calender_model.dart';
import 'package:ryt_life_cs/screens/mainScreen/calendar_widget/calendar_widget.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetCsNotification extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class UpdateCsNotification extends DashboardEvent {
  final String csId;
  final bool? iscompleted;
  final String updatedbyId;
  final bool? unavailable;
  const UpdateCsNotification({this.unavailable, required this.csId, this.iscompleted, required this.updatedbyId});
  @override
  List<Object> get props => [csId, updatedbyId];
}

class GetTheripiestData extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class AssigneTheripiestToUser extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class CreateUserAccountScreen extends DashboardEvent {
  final bool isCreateUserScreen;

  const CreateUserAccountScreen({this.isCreateUserScreen = false});
  @override
  List<Object> get props => [isCreateUserScreen];
}

class NotificationTapedIndex extends DashboardEvent {
  final int index;

  const NotificationTapedIndex({required this.index});
  @override
  List<Object> get props => [index];
}

class IsCreateUserStatusUpdate extends DashboardEvent {
  final bool isCreateUser;

  const IsCreateUserStatusUpdate({required this.isCreateUser});
  @override
  List<Object> get props => [isCreateUser];
}

class CreateUserAccount extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class AssignTheripiestTouser extends DashboardEvent {
  final String theripiestId;
  final String userId;

  const AssignTheripiestTouser({
    required this.theripiestId,
    required this.userId,
  });
  @override
  List<Object> get props => [theripiestId, userId];
}

class UpdateUserfirstName extends DashboardEvent {
  final String value;
  const UpdateUserfirstName({required this.value});
  @override
  List<Object> get props => [value];
}

class AddTheripiestIdAndName extends DashboardEvent {
  final List<Map<String, String>> theripiestIdAndName;
  const AddTheripiestIdAndName({required this.theripiestIdAndName});
  @override
  List<Object> get props => [theripiestIdAndName];
}

class RemoveTemIds extends DashboardEvent {
  const RemoveTemIds();
  @override
  List<Object> get props => [];
}

class UpdateUserlastName extends DashboardEvent {
  final String value;
  const UpdateUserlastName({required this.value});
  @override
  List<Object> get props => [value];
}

class UpdateUserphone extends DashboardEvent {
  final String value;
  const UpdateUserphone({required this.value});
  @override
  List<Object> get props => [value];
}

class UpdateUseremail extends DashboardEvent {
  final String value;
  const UpdateUseremail({required this.value});
  @override
  List<Object> get props => [value];
}

class UpdateUserdob extends DashboardEvent {
  final String value;
  const UpdateUserdob({required this.value});
  @override
  List<Object> get props => [value];
}

class UpdateUsergender extends DashboardEvent {
  final String value;
  const UpdateUsergender({required this.value});
  @override
  List<Object> get props => [value];
}

class ClearDataForNewUser extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class AppointmentDateChanged extends DashboardEvent {
  final DateTime date;

  const AppointmentDateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class UpdateSelectedSlot extends DashboardEvent {
  final CalendarSlots value;
  const UpdateSelectedSlot({required this.value});

  @override
  List<Object> get props => [value];
}

/* This Event is raised to SelectWeekDaySlot therapist */
class SelectWeekDaySlot extends DashboardEvent {
  final int dayIndex;
  const SelectWeekDaySlot({required this.dayIndex});

  @override
  List<Object> get props => [];
}

/* This Event is raised to get all calender therapist */
class CalenderTherapist extends DashboardEvent {
  final String therapiestId;
  const CalenderTherapist({required this.therapiestId});

  @override
  List<Object> get props => [therapiestId];
}

/* This event is raised to book the selected appointment for user at appointment details page */
class CreateBooking extends DashboardEvent {
  final bool isCash;

  const CreateBooking({required this.isCash});
  @override
  List<Object> get props => [isCash];
}

class BookAppointmentstateChange extends DashboardEvent {
  final bool isbookAppointment;

  const BookAppointmentstateChange({required this.isbookAppointment});
  @override
  List<Object> get props => [isbookAppointment];
}

class UpdateSeletedTheripiestByCS extends DashboardEvent {
  final String seletedTheripiestByCS;

  const UpdateSeletedTheripiestByCS({required this.seletedTheripiestByCS});
  @override
  List<Object> get props => [seletedTheripiestByCS];
}
