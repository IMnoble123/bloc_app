// import 'package:flutter/material.dart';
// import 'package:ryt_life_cs/utils/app_text_style.dart';

// class TimeSlotWidget extends StatefulWidget {
//   final List<String> timeSlots;
//   final Function(String) getTimeSlot;
//   final List<String> availableSlots;

//   const TimeSlotWidget({
//     super.key,
//     required this.timeSlots,
//     required this.getTimeSlot,
//     required this.availableSlots,
//   });
//   //todo: availableSlots is used for on tap functionalities to enable and disable the buttons of the timecard

//   @override
//   State<TimeSlotWidget> createState() => _TimeSlotWidgetState();
// }

// class _TimeSlotWidgetState extends State<TimeSlotWidget> {
//   int _selectedSlotIndex = -1;
//   String? getSelectedTimeSlot() {
//     if (_selectedSlotIndex >= 0 && _selectedSlotIndex < widget.timeSlots.length) {
//       return widget.getTimeSlot(widget.timeSlots[_selectedSlotIndex]);
//     } else {
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 434,
//       child: ScrollConfiguration(
//         behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
//         child: GridView.count(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           crossAxisCount: 4,
//           crossAxisSpacing: 43,
//           mainAxisSpacing: 20,
//           childAspectRatio: 75 / 41,
//           children: List.generate(
//             widget.timeSlots.length,
//             (index) => GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _selectedSlotIndex = index;
//                 });
//                 getSelectedTimeSlot();
//               },
//               child: SizedBox(
//                 height: 41,
//                 width: 75,
//                 child: Card(
//                   color: _selectedSlotIndex == index ? Colors.blue : Colors.white,
//                   elevation: 7.0,
//                   margin: EdgeInsets.zero,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14.0),
//                     side: BorderSide(
//                       color: _selectedSlotIndex == index ? Colors.blue : Colors.transparent,
//                       width: 2.0,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       widget.timeSlots[index],
//                       style: AppTextStyle.Poppins.copyWith(
//                         fontSize: 14.0,
//                         color: _selectedSlotIndex == index ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';

class TimeSlotWidget extends StatefulWidget {
  final List<String> timeSlots;
  final Function(String) getTimeSlot;
  final List<String> availableSlots;

  const TimeSlotWidget({
    super.key,
    required this.timeSlots,
    required this.getTimeSlot,
    required this.availableSlots,
  });
  //todo: availableSlots is used for on tap functionalities to enable and disable the buttons of the timecard

  @override
  State<TimeSlotWidget> createState() => _TimeSlotWidgetState();
}

class _TimeSlotWidgetState extends State<TimeSlotWidget> {
  int _selectedSlotIndex = -1;
  String getSelectedTimeSlot() {
    if (_selectedSlotIndex >= 0 && _selectedSlotIndex < widget.timeSlots.length) {
      return widget.getTimeSlot(widget.timeSlots[_selectedSlotIndex]);
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 434,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          crossAxisSpacing: 43,
          mainAxisSpacing: 20,
          childAspectRatio: 75 / 41,
          children: List.generate(
            widget.timeSlots.length,
            (index) => InkWell(
              onTap: widget.availableSlots.contains(widget.timeSlots[index])
                  ? () {
                      setState(() {
                        _selectedSlotIndex = index;
                      });
                      getSelectedTimeSlot();
                    }
                  : null,
              child: SizedBox(
                height: 41,
                width: 75,
                child: Card(
                  color: _selectedSlotIndex == index && widget.availableSlots.contains(widget.timeSlots[index])
                      ? Colors.blue
                      : widget.availableSlots.contains(widget.timeSlots[index])
                          ? Colors.white
                          : Colors.black12,
                  elevation: widget.availableSlots.contains(widget.timeSlots[index]) ? 7.0 : 0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    side: BorderSide(
                      color: _selectedSlotIndex == index && widget.availableSlots.contains(widget.timeSlots[index])
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.timeSlots[index],
                      style: AppTextStyle.Poppins.copyWith(
                        fontSize: 14.0,
                        color: _selectedSlotIndex == index ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
