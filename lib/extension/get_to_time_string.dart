import 'package:ryt_life_cs/models/therapiest_calender_model.dart';

extension GetToTimeString on List<Day> {
  Iterable<String> getToTimes() => map(
        (element) => '${element.to?.split(":")[0]}:${element.to?.split(":")[1]} ${element.to?.split(":")[2]}',
      );
}
