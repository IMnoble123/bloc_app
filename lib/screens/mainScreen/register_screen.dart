import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/bloc/state/dashbord_state.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';
import 'package:ryt_life_cs/widgets/app_textfield.dart';
import 'package:ryt_life_cs/widgets/get_dropdown.dart';
import 'package:ryt_life_cs/widgets/notification_tag_card.dart';
import 'package:ryt_life_cs/bloc/event/dashboard_event.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  String? selectedValue;
  @override
  void initState() {
    context.read<DashboardBloc>().add(ClearDataForNewUser());
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
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 88.03,
      height: MediaQuery.of(context).size.height - 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.newUserAccountRequest,
            style: AppTextStyle.Poppins.copyWith(
              color: AppColors.black,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          getTextFields(
            leftOnChange: (value) => context.read<DashboardBloc>().add(UpdateUserfirstName(value: value ?? '')),
            rightOnChange: (value) => context.read<DashboardBloc>().add(UpdateUseremail(value: value ?? '')),
            leftController: _firstName,
            rightController: _email,
            leftTitle: "First Name",
            rightTitile: "Email",
          ),
          const SizedBox(height: 30),
          getTextFields(
            leftOnChange: (value) => context.read<DashboardBloc>().add(UpdateUserlastName(value: value ?? '')),
            rightOnChange: (value) => context.read<DashboardBloc>().add(UpdateUserphone(value: value ?? '')),
            leftController: _lastName,
            rightController: _phone,
            leftTitle: "Last Name",
            rightTitile: "Phone Number",
          ),
          const SizedBox(height: 30),
          getTextFields(
            leftOnChange: (value) => context.read<DashboardBloc>().add(UpdateUserdob(value: value ?? '')),
            rightOnChange: (value) => context.read<DashboardBloc>().add(UpdateUsergender(value: value ?? '')),
            leftController: _dob,
            rightController: _gender,
            leftTitle: "Age",
            rightTitile: "Gender",
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 84.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                  List<Map<String, String>> _theripiestIdAndName = [];
                  List<String> _names = [];
                  state.theripiestModel.result?.forEach(
                    (element) {
                      _names.addAll([element.name ?? '']);
                      _theripiestIdAndName.addAll([
                        {element.name ?? '': element.id ?? ''}
                      ]);
                    },
                  );

                  return !state.isCreateUser && state.userModel.result?.id == null
                      ? Container()
                      : Column(
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
                              getDroupdown(
                                onChange: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                  for (Map<String, String> map in _theripiestIdAndName) {
                                    // Get the value associated with the specified key
                                    String? _value = map[value ?? ''];
                                    if (_value != null &&
                                        state.userModel != null &&
                                        state.userModel.result != null &&
                                        state.userModel.result?.id != null) {
                                      context.read<DashboardBloc>().add(AssignTheripiestTouser(
                                          theripiestId: _value, userId: state.userModel.result!.id!));
                                    }
                                  }
                                },
                                therapistName: _names,
                                selectedValue: selectedValue,
                              ),
                            ]);
                }),
                BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                  return SizedBox(
                    height: 56,
                    child: InkWell(
                      onTap: state.email != null &&
                              state.firstName != null &&
                              state.phone != null &&
                              state.email != '' &&
                              state.firstName != '' &&
                              state.phone != ''
                          ? () {
                              context.read<DashboardBloc>().add(CreateUserAccount());
                              if(state.isCreateUser && state.userModel.result?.id != null){
                                //TODO::  Navigate to book session screen 
                              }
                            }
                          : null,
                      child: NotificationTageCard(
                        color: state.email != null &&
                                state.firstName != null &&
                                state.phone != null &&
                                state.email != '' &&
                                state.firstName != '' &&
                                state.phone != ''
                            ? AppColors.blue200
                            : state.isCreateUser && state.userModel.result?.id != null
                                ? AppColors.blue200
                                : AppColors.gray40,
                        title: state.email != '' && state.firstName != '' && state.phone != ''
                            ? "Create User Account"
                            : state.isCreateUser && state.userModel.result?.id != null
                                ? "Book a session"
                                : "Create User Account",
                        textColor: AppColors.white,
                        verticalPadding: 10,
                        horizontalPadding: 26,
                        borderRadius: 56,
                      ),
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
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
      title: leftTitle,
      text: leftTitle,
      onChange: leftOnChange,
      controller: leftController,
    ),
    const SizedBox(width: 25),
    appTextField(
      title: rightTitile,
      text: rightTitile,
      onChange: rightOnChange,
      controller: rightController,
    )
  ]);
}
