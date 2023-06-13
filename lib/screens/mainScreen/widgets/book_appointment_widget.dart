import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/bloc/event/dashboard_event.dart';
import 'package:ryt_life_cs/bloc/state/dashbord_state.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';
import 'package:ryt_life_cs/widgets/app_textfield.dart';
import 'package:ryt_life_cs/widgets/get_dropdown.dart';
import 'package:ryt_life_cs/widgets/notification_tag_card.dart';

class BookAppointmentWidget extends StatefulWidget {
  const BookAppointmentWidget({
    super.key,
  });
  @override
  State<BookAppointmentWidget> createState() => _BookAppointmentWidgetState();
}

class _BookAppointmentWidgetState extends State<BookAppointmentWidget> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  String? selectedValue;
  String? seletedName;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _phone.dispose();
    _email.dispose();
    _dob.dispose();
    _gender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
      final _notificationData = state.notificationTapedIndex == -1
          ? null
          : state.notificationModel.result?[state.notificationTapedIndex ?? 0];
      _firstName.text = _notificationData?.username ?? '';
      _phone.text = _notificationData?.userphone ?? '';
      _email.text = _notificationData?.emailId ?? '';
      final String _userId = _notificationData?.userId ?? '';
      return SizedBox(
        width: (MediaQuery.of(context).size.width / 2) - 88.03,
        height: MediaQuery.of(context).size.height - 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.bookAnAppointmentForNewUser,
              style: AppTextStyle.Poppins.copyWith(
                color: AppColors.black,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            getTextFields(
              leftOnChange: (value) {},
              rightOnChange: (value) {},
              leftController: _firstName,
              rightController: _email,
              leftTitle: "First Name",
              rightTitile: "Email",
            ),
            const SizedBox(height: 30),
            getTextFields(
              leftOnChange: (value) {},
              rightOnChange: (value) {},
              leftController: _lastName,
              rightController: _phone,
              leftTitle: "Last Name",
              rightTitile: "Phone Number",
            ),
            // const SizedBox(height: 30),
            // getTextFields(
            //   leftOnChange: (value) {},
            //   rightOnChange: (value) {},
            //   leftController: _dob,
            //   rightController: _gender,
            //   leftTitle: "Age",
            //   rightTitile: "Gender",
            // ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 84.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assigned Therapist",
                        style: AppTextStyle.Poppins.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 7),
                      BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                        List<Map<String, String>> _theripiestIdAndName = [];
                        List<String> _names = [];
                        state.theripiestModel.result?.forEach(
                          (element) {
                            _names.addAll([element.name ?? '']);
                            _theripiestIdAndName.add({element.name ?? '': element.id ?? ''});
                            context
                                .read<DashboardBloc>()
                                .add(AddTheripiestIdAndName(theripiestIdAndName: [..._theripiestIdAndName]));
                          },
                        );

                        return CustomDialogWidget(
                          selectedValue: state.seletedTheripiestByCS ?? '',
                          data: _names,
                          onSubmitButtionTaped: () {
                            if (state.seletedTheripiestByCS != null &&
                                state.seletedTheripiestByCS != '' &&
                                state.theripiestIdAndName != null &&
                                state.theripiestIdAndName != []) {
                              final id = removeValueByKey(state.theripiestIdAndName!, state.seletedTheripiestByCS!);

                              context
                                  .read<DashboardBloc>()
                                  .add(AssignTheripiestTouser(theripiestId: id, userId: _userId));
                              Navigator.of(context).pop();
                            } else {
                              final id = removeValueByKey(_theripiestIdAndName, seletedName!);

                              context
                                  .read<DashboardBloc>()
                                  .add(AssignTheripiestTouser(theripiestId: id, userId: _userId));
                              Navigator.of(context).pop();
                            }
                            // for (Map<String, String> map in _theripiestIdAndName) {
                            //   // Get the value associated with the specified key
                            //   String? _value = map[state.seletedTheripiestByCS ?? ''];
                            //   print('_value $_value');
                            // if (_id != null) {

                            // context
                            //     .read<DashboardBloc>()
                            //     .add(AssignTheripiestTouser(theripiestId: _id, userId: _userId));
                            // }
                            // }
                          },
                          onValueSeleted: (value) {
                            context
                                .read<DashboardBloc>()
                                .add(UpdateSeletedTheripiestByCS(seletedTheripiestByCS: value));
                            setState(() {
                              seletedName = value;
                            });
                          },
                        );

                        // getDroupdown(
                        //   onChange: (value) {
                        //     setState(() {
                        //       selectedValue = value;
                        //     });
                        //     for (Map<String, String> map in _theripiestIdAndName) {
                        //       // Get the value associated with the specified key
                        //       String? _value = map[value ?? ''];
                        //       if (_value != null) {
                        //         context
                        //             .read<DashboardBloc>()
                        //             .add(AssignTheripiestTouser(theripiestId: _value, userId: _userId));
                        //       }
                        //     }
                        //   },
                        //   therapistName: _names,
                        //   selectedValue: selectedValue,
                        // );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 56,
                    child: InkWell(
                      onTap: () {
                        context.read<DashboardBloc>().add(const BookAppointmentstateChange(isbookAppointment: true));
                      },
                      child: const NotificationTageCard(
                        color: AppColors.blue200,
                        title: "Book a session",
                        textColor: AppColors.white,
                        verticalPadding: 10,
                        horizontalPadding: 26,
                        borderRadius: 56,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

Widget getTextFields({
  Function(String? value)? leftOnChange,
  Function(String? value)? rightOnChange,
  TextEditingController? leftController,
  TextEditingController? rightController,
  String? leftTitle,
  String? rightTitile,
}) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    appTextField(
      enabled: false,
      title: leftTitle,
      text: leftTitle,
      onChange: leftOnChange,
      controller: leftController,
    ),
    const SizedBox(width: 25),
    appTextField(
      enabled: false,
      title: rightTitile,
      text: rightTitile,
      onChange: rightOnChange,
      controller: rightController,
    )
  ]);
}

class CustomDialogWidget extends StatelessWidget {
  final Function(String) onValueSeleted;
  final VoidCallback onSubmitButtionTaped;
  final List<String> data;
  final String selectedValue;
  const CustomDialogWidget({
    super.key,
    required this.onValueSeleted,
    required this.onSubmitButtionTaped,
    required this.data,
    required this.selectedValue,
  });

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: SizedBox(
            width: 297.47,
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final _data = data[index];
                      return BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          decoration: BoxDecoration(
                            border: (data.length) - 1 == index
                                ? null
                                : const Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFE3F0FF), // Border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                          ),
                          child: ListTile(
                            title: Text(_data),
                            onTap: () => onValueSeleted(_data),
                            tileColor: state.seletedTheripiestByCS == _data ? const Color(0xFF278AFF) : AppColors.white,
                          ),
                        );
                      });
                    },
                  ),
                  const SizedBox(height: 31),
                  Container(
                    width: 234,
                    height: 53,
                    decoration: BoxDecoration(
                      color: const Color(0xFF278AFF), // Button fill color
                      borderRadius: BorderRadius.circular(56),
                    ),
                    child: ElevatedButton(
                      onPressed: onSubmitButtionTaped,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, // Set transparent color for button background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185.36,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white, // Button fill color
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(73, 77, 89, 0.15), // Shadow color
            blurRadius: 25,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          _showDialog(context);
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                return Text(
                  state.seletedTheripiestByCS != '' ? state.seletedTheripiestByCS ?? 'Select' : "Select",
                  style: AppTextStyle.Poppins.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: AppColors.gray40,
                  ),
                );
              }),
              const SizedBox(width: 40),
              const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.gray500,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String removeValueByKey(List<Map<String, String>> keyValuePairs, String key) {
  String removedValue = '';

  keyValuePairs.removeWhere((pair) {
    if (pair.containsKey(key)) {
      removedValue = pair[key]!;
      return true;
    }
    return false;
  });

  return removedValue;
}
