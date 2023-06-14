import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryt_life_cs/bloc/dashboard.dart';
import 'package:ryt_life_cs/bloc/event/dashboard_event.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_icons.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? isSelected;
  final String? profileUrl;
  const CustomeAppBar({super.key, this.profileUrl, this.isSelected});

  @override
  Widget build(BuildContext context) {
    final deviceWidtht = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      width: deviceWidtht,
      height: deviceHeight * 0.10,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context.read<DashboardBloc>().add(const CreateUserAccountScreen(isCreateUserScreen: false));
              context.read<DashboardBloc>().add(const BookAppointmentstateChange(isbookAppointment: false));
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 41.47,
              ),
              width: deviceWidtht / 10.88,
              height: deviceHeight / 14.61,
              child: Image.asset(AppIcons.logo),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 89.0, vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectedIcon(
                  url: AppIcons.addUser,
                  onTap: () => context.read<DashboardBloc>().add(const CreateUserAccountScreen(isCreateUserScreen: true)),
                  isSelected: false,
                  gWidth: 48.44,
                  gHeight: 49.63,
                ),
                SizedBox(
                  width: deviceWidtht * 0.02,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3.75, color: AppColors.xFF848484),
                          borderRadius: BorderRadius.circular(300),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SelectedIcon(
                            url: profileUrl ?? '',
                            onTap: () {},
                            isSelected: false,
                            gWidth: 45,
                            gHeight: 45,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 13),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppIcons.arrowDown,
                        fit: BoxFit.fill,
                        height: 8.18,
                        width: 16.35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class SelectedIcon extends StatelessWidget {
  final String url;
  final VoidCallback onTap;
  final bool isSelected;
  final double? gWidth;
  final double? gHeight;
  const SelectedIcon({required this.url, required this.onTap, this.isSelected = false, this.gHeight, this.gWidth, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double devicePixcelratio = MediaQuery.of(context).devicePixelRatio;
    return Container(
      width: gWidth ?? 60 / devicePixcelratio,
      height: gHeight ?? 60 / devicePixcelratio,
      decoration: isSelected
          ? BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10.0), boxShadow: const [
              BoxShadow(
                color: AppColors.shadowGrey,
                blurRadius: 3.0,
                spreadRadius: 0.0,
                offset: Offset(0.25, 0.25),
              )
            ])
          : const BoxDecoration(),
      child: InkWell(
        onTap: onTap,
        child: url.contains("http")
            ? Image.network(
                url,
                // fit: BoxFit.fill,
                height: height * 0.042,
                width: width * 0.042,
              )
            : Image.asset(
                url,
                height: height * 0.042,
                width: width * 0.042,
              ),
      ),
    );
  }
}
