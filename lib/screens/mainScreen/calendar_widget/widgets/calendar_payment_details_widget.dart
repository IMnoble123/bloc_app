import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';

class CalendarPaymentDataWidget extends StatefulWidget {
  const CalendarPaymentDataWidget({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.onchange,
    required this.onTapCashPayment,
    required this.onTapOnlinePayment,
    this.controller,
  });

  final String name;
  final String amount;
  final DateTime dateTime;
  final Function(String) onchange;
  final VoidCallback onTapCashPayment;
  final VoidCallback onTapOnlinePayment;
  final TextEditingController? controller;

  @override
  State<CalendarPaymentDataWidget> createState() => _CalendarPaymentDataWidgetState();
}

class _CalendarPaymentDataWidgetState extends State<CalendarPaymentDataWidget> {
  bool onlineButtion = false;
  bool cashbuttion = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Appointment confirmed on",
          style: AppTextStyle.Poppins.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black),
        ),
        const SizedBox(height: 4.43),
        Text(
          "${formatTime(widget.dateTime)}\nwith ${widget.name}",
          style: AppTextStyle.Poppins.copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.black),
        ),
        const SizedBox(height: 33),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.grey[200],
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(73, 77, 89, 0.25),
                blurRadius: 7.0,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Promo code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              fillColor: AppColors.white,
              filled: true,
            ),
            onChanged: widget.onchange,
            controller: widget.controller,
            style: const TextStyle(fontSize: 16.0),
            maxLines: 1,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
        const SizedBox(height: 27),
        Text(
          "Total Amount : ₹${widget.amount}",
          style: AppTextStyle.Poppins.copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.black),
        ),
        const SizedBox(height: 11),
        SizedBox(
          width: 317,
          height: 48.5,
          child: ElevatedButton(
            onHover: (value) {
              setState(() {
                onlineButtion = value;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: onlineButtion ? const Color(0xff3384FF) : Colors.transparent, width: 2),
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            onPressed: widget.onTapOnlinePayment,
            child: const Text('Proceed with Razerpay'),
          ),
        ),
        const SizedBox(height: 21),
        SizedBox(
          width: 317,
          height: 48.5,
          child: ElevatedButton(
            onHover: (value) {
              setState(() {
                cashbuttion = value;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: cashbuttion ? const Color(0xff3384FF) : Colors.transparent, width: 2),
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            onPressed: widget.onTapCashPayment,
            child: const Text('Proceed with Cash'),
          ),
        ),
      ],
    );
  }
}

String formatTime(DateTime dateTime) {
  return DateFormat('MMMM d, y \'at\' hh:mma').format(dateTime).toString();
}
