import 'package:flutter/material.dart';
import 'package:ryt_life_cs/models/filter_model.dart';
import 'package:ryt_life_cs/screens/mainScreen/notification_widget.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/widgets/notification_tag_card.dart';

class FilterCard extends StatefulWidget {
  const FilterCard({super.key, required this.callBack, required this.index});
  final Function(String) callBack;
  final int index;
  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  int _index = 0;
  @override
  void initState() {
    _index = widget.index;
    super.initState();
  }

  final List<FilterModel> filterTitles = [
    FilterModel(index: 0, isTaped: false, title: 'New'),
    FilterModel(index: 1, isTaped: false, title: 'Imp'),
    FilterModel(index: 2, isTaped: false, title: 'Unattended'),
    FilterModel(index: 3, isTaped: false, title: 'Unavailable'),
    FilterModel(index: 4, isTaped: false, title: 'Done'),
    FilterModel(index: 5, isTaped: false, title: '')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filterTitles.length - 1,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _index = filterTitles[index].index;
            widget.callBack(filterTitles[index].title);
            // if (filterTitles[index].isTaped == true) {
            //   filterTitles[index].isTaped = false;
            // } else {
            //   filterTitles[index].isTaped = true;
            // }
            setState(() {});
          },
          child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: NotificationTageCard(
                  color: filterTitles[index].index == _index ? AppColors.blue200 : AppColors.gray400,
                  title: filterTitles[index].title,
                  verticalPadding: 4)),
        );
      },
    );
  }
}
