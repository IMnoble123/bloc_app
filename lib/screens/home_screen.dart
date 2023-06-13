import 'package:flutter/material.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/bloc/event/dashboard_event.dart';
import 'package:ryt_life_cs/bloc/state/dashbord_state.dart';
import 'package:ryt_life_cs/screens/mainScreen/calendar_widget/calendar_widget.dart';
import 'package:ryt_life_cs/screens/mainScreen/widgets/book_appointment_widget.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ryt_life_cs/widgets/custom_app_bar.dart';
import 'package:ryt_life_cs/screens/mainScreen/notification_widget.dart';
import 'package:ryt_life_cs/screens/mainScreen/register_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<DashboardBloc>().add(GetCsNotification());
    context.read<DashboardBloc>().add(GetTheripiestData());
    // context.read<DashboardBloc>().add(AssigneTheripiestToUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomeAppBar(
        profileUrl:
            "https://png.pngtree.com/png-clipart/20210915/ourmid/pngtree-user-avatar-placeholder-png-image_3918418.jpg",
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 120,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // RegisterWidget(),
                BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                  return state.isCreateUserScreen
                      ? const Padding(
                          padding: EdgeInsets.only(left: 88.03),
                          child: RegisterWidget(),
                        )
                      : state.isbookAppointment
                          ? Padding(
                              padding: const EdgeInsets.only(left: 22, top: 79.87),
                              child: CalendarWidget(
                                therapiestId: state.tampTherapiestId ?? '',
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(left: 88.03),
                              child: BookAppointmentWidget(),
                            );
                }),
                const NotificationCenter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
