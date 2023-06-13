import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/bloc/event/dashboard_event.dart';
import 'package:ryt_life_cs/models/notification_model.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';
import 'package:ryt_life_cs/widgets/notification_tag_card.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({
    super.key,
    this.notificationData,
  });
  final List<Result>? notificationData;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.notificationData?.length ?? 0,
      itemBuilder: (context, index) {
        final _data = widget.notificationData?[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Card(
            color: AppColors.white,
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
            child: InkWell(
              onTap: () {
                context.read<DashboardBloc>().add(NotificationTapedIndex(index: index));
                context.read<DashboardBloc>().add(const CreateUserAccountScreen(isCreateUserScreen: false));
                context.read<DashboardBloc>().add(const BookAppointmentstateChange(isbookAppointment: false));
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _data?.title ?? '',
                                style: AppTextStyle.Poppins.copyWith(
                                  color: AppColors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                height: 30,
                                child: NotificationTageCard(
                                  color: AppColors.xFFF62727,
                                  title: _data?.tag ?? "Imp",
                                  textColor: AppColors.white,
                                  verticalPadding: 1,
                                  horizontalPadding: 10,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                DateFormat('MMMM dd, yy').format(_data?.createdAt ?? DateTime.now()),
                                style: AppTextStyle.Poppins.copyWith(
                                  color: AppColors.xFF929292,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          NotificationTageCard(
                            color: _data?.unavailable ?? false ? AppColors.gray400 : AppColors.blue200,
                            title: "Unavailable",
                            textColor: _data?.unavailable ?? false ? AppColors.black : AppColors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 23.46),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Name : ${_data?.username ?? ''}\nEmail : ${_data?.emailId ?? ''}\nPh no : ${_data?.userphone ?? ''}",
                            style: AppTextStyle.Poppins.copyWith(
                              color: AppColors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 56,
                            child: InkWell(
                              onTap: () => context
                                  .read<DashboardBloc>()
                                  .add(UpdateCsNotification(csId: _data?.id ?? '', updatedbyId: "", iscompleted: true)),
                              child: NotificationTageCard(
                                color: _data?.iscompleted ?? false ? AppColors.gray400 : AppColors.blue200,
                                title: "Done",
                                textColor: AppColors.white,
                                verticalPadding: 10,
                                horizontalPadding: 26,
                                borderRadius: 56,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
