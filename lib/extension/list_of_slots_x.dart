import 'package:ryt_life_cs/extension/get_from_time_string.dart';
import 'package:ryt_life_cs/extension/get_to_time_string.dart';
import 'package:ryt_life_cs/models/therapiest_calender_model.dart';

extension ListOfSlotsX on Slots? {
  List<String> getFromTimeSlot() {
    return [
      this?.monday,
      this?.tuesday,
      this?.wednesday,
      this?.thursday,
      this?.friday,
      this?.saturday,
      this?.sunday,
    ]
        .where((element) => element != null)
        .map<List<String>>((e) => e!.getFromTimes().toList())
        .expand((element) => element)
        .toList();
  }

  List<String> getToTimeSlot() {
    return [
      this?.monday,
      this?.tuesday,
      this?.wednesday,
      this?.thursday,
      this?.friday,
      this?.saturday,
      this?.sunday,
    ]
        .where((element) => element != null)
        .map<List<String>>((e) => e!.getToTimes().toList())
        .expand((element) => element)
        .toList();
  }
}
