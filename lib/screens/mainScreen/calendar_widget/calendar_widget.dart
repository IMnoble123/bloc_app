import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/bloc/event/dashboard_event.dart';
import 'package:ryt_life_cs/bloc/state/dashbord_state.dart';
import 'package:ryt_life_cs/models/therapiest_calender_model.dart';
import 'package:ryt_life_cs/screens/mainScreen/calendar_widget/widgets/calendar_payment_details_widget.dart';
import 'package:ryt_life_cs/screens/mainScreen/calendar_widget/widgets/calendar_time_widget.dart';
import 'package:ryt_life_cs/screens/mainScreen/calendar_widget/widgets/calendart_widget_data.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_loader.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';
import 'package:ryt_life_cs/utils/coupon_status.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key, required this.therapiestId});
  final String therapiestId;

  @override
  _WeeklyCalendarState createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<CalendarWidget> with SingleTickerProviderStateMixin {
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedIndexDate = DateTime.now();
  final DateTime currentDate = DateTime.now();
  String _seletedSlot = '8:00 AM';
  int _selectedDayIndex = 0;
  int _selectedTabIndex = 0;
  late TabController _tabController;
  final _tabTextStyle =
      AppTextStyle.Poppins.copyWith(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 16);
  final formatDate = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    context.read<DashboardBloc>().add(CalenderTherapist(therapiestId: widget.therapiestId));
    if (_selectedDate == DateTime.now()) {
      _tabController = TabController(initialIndex: getTimeOfDay(_selectedDate.hour), length: 3, vsync: this);
    } else {
      _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    }

    super.initState();
  }

  void getTabController() {
    if (_selectedIndexDate.day == DateTime.now().day &&
        _selectedIndexDate.month == DateTime.now().month &&
        _selectedIndexDate.year == DateTime.now().year) {
      _onTabButtonPressed(getTimeOfDay(_selectedIndexDate.hour));
    } else {
      _onTabButtonPressed(0);
    }
  }

  DateTime setTimeFromUserInput(String userInputTime, DateTime originalDateTime) {
    DateFormat dateFormat = DateFormat('h:mm a');
    DateTime parsedTime = dateFormat.parse(userInputTime);

    return DateTime(
      originalDateTime.year,
      originalDateTime.month,
      originalDateTime.day,
      parsedTime.hour + (parsedTime.hour < 12 && userInputTime.toLowerCase().contains('pm') ? 12 : 0),
      parsedTime.minute,
      parsedTime.second,
      parsedTime.millisecond,
      parsedTime.microsecond,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabButtonPressed(int index) {
    setState(() {
      _selectedTabIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 22,
          height: 600.62,
          child: Card(
            elevation: 14,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 35, 50, 50),
              child: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                print('state.timeSlots?.afternoonTimes:: ${state.timeSlots}');
                return Column(
                  children: [
                    SizedBox(
                        height: 54,
                        width: 296,
                        child: Text("Confirm session",
                            style: AppTextStyle.Poppins.copyWith(
                                fontSize: 36, color: AppColors.black, fontWeight: FontWeight.w600))),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 36,
                                  width: 434,
                                  child: Text("Please Select Date and Time",
                                      style: AppTextStyle.Poppins.copyWith(
                                          fontSize: 24, color: AppColors.black, fontWeight: FontWeight.w400))),
                              const SizedBox(height: 24.61),
                              SizedBox(
                                  height: 144.74,
                                  width: 434,
                                  child: Card(
                                      margin: EdgeInsets.zero,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                      child: _buildDaySelector())),
                              const SizedBox(height: 34.31),
                              SizedBox(
                                  height: 26.47,
                                  width: 434,
                                  child: TabBar(
                                    controller: _tabController,
                                    labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    indicatorColor: AppColors.blue100,
                                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    labelColor: AppColors.black,
                                    labelStyle: _tabTextStyle,
                                    unselectedLabelColor: AppColors.gray200,
                                    tabs: const [
                                      Tab(text: 'Morning'),
                                      Tab(text: 'Afternoon'),
                                      Tab(text: 'Evening'),
                                    ],
                                  )),
                              const SizedBox(height: 36.03),
                              SizedBox(
                                  height: 102,
                                  width: 432,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      TimeSlotWidget(
                                        availableSlots: state.timeSlots?.morningTimes ?? [],
                                        timeSlots: CalendarWidgetData.MorningTimes,
                                        getTimeSlot: (String slot) {
                                          if (slot != '') {
                                            setState(() {
                                              _seletedSlot = slot;
                                            });
                                          }
                                        },
                                      ),
                                      TimeSlotWidget(
                                        availableSlots: state.timeSlots?.afternoonTimes ?? [],
                                        timeSlots: CalendarWidgetData.AfternoonTimes,
                                        getTimeSlot: (String slot) {
                                          if (slot != '') {
                                            setState(() {
                                              _seletedSlot = slot;
                                            });
                                          }
                                        },
                                      ),
                                      TimeSlotWidget(
                                        availableSlots: state.timeSlots?.eveningTimes ?? [],
                                        timeSlots: CalendarWidgetData.EveningTimes,
                                        getTimeSlot: (String slot) {
                                          if (slot != '') {
                                            setState(() {
                                              _seletedSlot = slot;
                                            });
                                          }
                                        },
                                      )
                                    ],
                                  ))
                            ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            width: 1,
                            height: 380.2,
                            decoration: BoxDecoration(
                              color: AppColors.gray190,
                              border: Border.all(width: 1.0, color: AppColors.gray190),
                            ),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 364.93,
                                  width: 318,
                                  child: state.therapistProfileData?.result == null &&
                                          state.therapistProfileData?.result == []
                                      ? const Center(child: AppLoader())
                                      : CalendarPaymentDataWidget(
                                          amount: '${state.therapistProfileData?.result?.first.consultationFee ?? 0}',
                                          dateTime: setTimeFromUserInput(_seletedSlot, _selectedIndexDate),
                                          name: state.therapistProfileData?.result?.first.name ?? '',
                                          onchange: (String value) {
                                            print(value);
                                            // if (value.length > 4 && value.length < 9) {
                                            //   context.read<DashboardBloc>().add(ApplyCouponCode(value.toUpperCase()));
                                            // } else {
                                            //   print("else ");
                                            //   context.read<DashboardBloc>().add(ChangeCouponStatus(CouponStatus.none));
                                            // }
                                          },
                                          onTapOnlinePayment: () {
                                            context
                                                .read<DashboardBloc>()
                                                .add(AppointmentDateChanged(_selectedIndexDate));
                                            context.read<DashboardBloc>().add(UpdateSelectedSlot(
                                                value: CalendarSlots(
                                                    from: _seletedSlot,
                                                    to: addThirtyMinutes(_seletedSlot),
                                                    booked: false)));
                                            context.read<DashboardBloc>().add(const CreateBooking(isCash: false));
                                            //todo add payment funcanality
                                          },
                                          onTapCashPayment: () {
                                            context
                                                .read<DashboardBloc>()
                                                .add(AppointmentDateChanged(_selectedIndexDate));
                                            context.read<DashboardBloc>().add(UpdateSelectedSlot(
                                                value: CalendarSlots(
                                                    from: _seletedSlot,
                                                    to: addThirtyMinutes(_seletedSlot),
                                                    booked: false)));
                                            context.read<DashboardBloc>().add(const CreateBooking(isCash: true));
                                            //todo add payment funcanality
                                          },
                                        ))
                            ]),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  String addThirtyMinutes(String time) {
    final dateFormat = DateFormat('hh:mm a');
    final dateTime = dateFormat.parse(time);
    final newDateTime = dateTime.add(Duration(minutes: 30));
    final result = dateFormat.format(newDateTime);
    return result;
  }

  Widget _buildDaySelector() {
    final currentDate = DateTime.now().toLocal();
    final currentWeek = _getDaysInWeek(currentDate);
    final currentWeekIndex = currentWeek.indexWhere((date) => date == currentDate);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedDate = DateTime.now();
                    _selectedDayIndex = CalendarWidgetData.DaysOfWeek.indexOf(DateFormat('EEEE').format(_selectedDate));
                  });
                },
                child: Text(
                  DateFormat('MMMM yyyy').format(_selectedDate),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Image.asset(
                  "assets/images/new_app/app_bar/left_arrow.png",
                  height: 5.29,
                  width: 10.57,
                ),
                onPressed: _selectedDate.isAfter(currentWeek.first)
                    ? () {
                        setState(() {
                          _selectedDate = _selectedDate.subtract(const Duration(days: 7));
                          _selectedDayIndex =
                              CalendarWidgetData.DaysOfWeek.indexOf(DateFormat('EEEE').format(_selectedDate));
                        });
                      }
                    : null,
              ),
              const SizedBox(width: 30.0),
              IconButton(
                icon: Image.asset(
                  "assets/images/new_app/app_bar/right_arrow.png",
                  height: 5.29,
                  width: 10.57,
                ),
                onPressed: () {
                  setState(() {
                    _selectedDate = _selectedDate.add(const Duration(days: 7));
                    _selectedDayIndex = CalendarWidgetData.DaysOfWeek.indexOf(DateFormat('EEEE').format(_selectedDate));
                  });
                },
              ),
              const SizedBox(width: 8.0),
            ],
          ),
        ),
        Container(
          height: 60.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: CalendarWidgetData.DaysOfWeek.length,
            itemBuilder: (context, index) {
              final date = _getDaysInWeek(_selectedDate)[index];
              bool isCurrentDate =
                  currentDate.day == date.day && currentDate.month == date.month && currentDate.year == date.year;
              return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedDayIndex = index;
                      _selectedIndexDate = date;
                      getTabController();
                    });
                    context.read<DashboardBloc>().add(SelectWeekDaySlot(dayIndex: index));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      height: 68.74,
                      width: 46,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: index == _selectedDayIndex ? AppColors.blue : null,
                        borderRadius: BorderRadius.circular(12.0),
                        border: isCurrentDate ? Border.all(color: AppColors.blue.withOpacity(.5), width: 2.0) : null,
                      ),
                      child: Column(
                        children: [
                          Text(
                            DateFormat('EEEE').format(date)[0],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: index == _selectedDayIndex ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(DateFormat('d').format(date),
                              style: TextStyle(
                                fontSize: 12.0,
                                color: index == _selectedDayIndex ? Colors.white : Colors.grey.shade700,
                              ))
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}

List<DateTime> _getDaysInWeek(DateTime weekStart) {
  final List<DateTime> days = [];
  for (int i = 0; i < 7; i++) {
    days.add(weekStart.add(Duration(days: i)));
  }
  return days;
}

int getTimeOfDay(int hour) {
  if (hour < 12) {
    return 0; // morning
  } else if (hour < 18) {
    return 1; // afternoon
  } else {
    return 2; // evening
  }
}

extension TimeListExtension on List<String> {
  List<String> get morningTimes {
    return where((time) => _getTimeOfDay(time) == TimeOfDay.morning).toList();
  }

  List<String> get afternoonTimes {
    return where((time) => _getTimeOfDay(time) == TimeOfDay.afternoon).toList();
  }

  List<String> get eveningTimes {
    return where((time) => _getTimeOfDay(time) == TimeOfDay.evening).toList();
  }

  TimeOfDay _getTimeOfDay(String time) {
    int hour = int.parse(time.split(':')[0]);
    if (hour < 12) {
      return TimeOfDay.morning;
    } else if (hour >= 12 && hour < 18) {
      return TimeOfDay.afternoon;
    } else {
      return TimeOfDay.evening;
    }
  }
}

enum TimeOfDay { morning, afternoon, evening }

class CalendarSlots {
  final String from;
  final String to;
  final bool booked;

  CalendarSlots({required this.from, required this.to, required this.booked});

  factory CalendarSlots.fromJson(Map<String, dynamic> json) =>
      CalendarSlots(from: json['from'] ?? '', to: json['to'] ?? '', booked: json['booked'] ?? false);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['booked'] = booked;
    return data;
  }
}
