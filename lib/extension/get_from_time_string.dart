import 'package:ryt_life_cs/models/therapiest_calender_model.dart';

extension GetFromTimeString on List<Day> {
  Iterable<String> getFromTimes() => map(
        (element) => '${element.from?.split(":")[0]}:${element.from?.split(":")[1]} ${element.from?.split(":")[2]}',
      );
}


