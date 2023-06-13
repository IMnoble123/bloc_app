import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/bloc/event/dashboard_event.dart';
import 'package:ryt_life_cs/bloc/state/dashbord_state.dart';
import 'package:ryt_life_cs/models/filter_model.dart';
import 'package:ryt_life_cs/models/notification_model.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';
import 'package:ryt_life_cs/widgets/filter_card.dart';
import 'package:ryt_life_cs/widgets/notification_card.dart';
import 'package:ryt_life_cs/widgets/notification_tag_card.dart';

class NotificationCenter extends StatefulWidget {
  const NotificationCenter({super.key});

  @override
  State<NotificationCenter> createState() => _NotificationCenterState();
}

class _NotificationCenterState extends State<NotificationCenter> {
  final List<Result> _searchResult = [];
  final List<FilterModel> filterTitles = [
    FilterModel(index: 0, isTaped: false, title: 'New'),
    FilterModel(index: 1, isTaped: false, title: 'Imp'),
    FilterModel(index: 2, isTaped: false, title: 'Unattended'),
    FilterModel(index: 3, isTaped: false, title: 'Unavailable'),
    FilterModel(index: 4, isTaped: false, title: 'Done'),
    FilterModel(index: 5, isTaped: false, title: '')
  ];
  int _filterIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 120,
      width: (MediaQuery.of(context).size.width / 2) - 54.7,
      child: Card(
        elevation: 30,
        color: AppColors.white,
        shadowColor: const Color.fromRGBO(73, 77, 89, 0.3),
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
          // print(_searchResult);
          return Padding(
            padding: const EdgeInsets.only(left: 54.23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 38.12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _searchResult.clear();
                          _filterIndex = -1;
                        });
                      },
                      child: Text(
                        '${AppString.notifications} (${state.notificationModel.result?.length ?? 0})',
                        style: AppTextStyle.Poppins.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filterTitles.length - 1,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _filterIndex = filterTitles[index].index;

                              _searchResult.clear();

                              _searchResult.addAll(
                                  searchResults(filterTitles[index].title, state.notificationModel.result ?? []));
                              setState(() {});
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: NotificationTageCard(
                                    color: filterTitles[index].index == _filterIndex
                                        ? AppColors.blue200
                                        : AppColors.gray400,
                                    title: filterTitles[index].title,
                                    verticalPadding: 4)),
                          );
                        },
                      ),
                      //  FilterCard(
                      //   index: -1,
                      //   callBack: (String tag) {
                      //     _searchResult.clear();

                      //     _searchResult.addAll(searchResults(tag, state.notificationModel?.result ?? []));
                      //     setState(() {});
                      //   },
                      // )
                    ),
                  ],
                ),
                const SizedBox(height: 36.62),
                Expanded(
                  child: NotificationCard(
                    notificationData: _searchResult.isNotEmpty ? _searchResult : state.notificationModel.result,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// A function that searches for notificatio results based on a given term
List<Result> searchResults(dynamic term, List<Result> results) {
  return results.where((result) {
    return result.tag?.toLowerCase().contains(term.toLowerCase()) == true ||
        result.iscompleted == term ||
        result.unavailable == true;
  }).toList();
}
