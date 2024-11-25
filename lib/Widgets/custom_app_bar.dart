import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Widgets/my_back_button.dart';
import 'package:foodlyluss/Widgets/notifications_button.dart';

class CustomAppBar extends StatefulWidget {
  final String title;

  const CustomAppBar({
    required this.title,
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 130.h,
      padding: EdgeInsets.only(right: 35.w, left: 35.w, top: 30.h),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyBackButton(on_tap: () => Navigator.pop(context)),
          Text(
            widget.title,
            style: TextStyle(
              color: const Color(0xff9D9693),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const NotificationButton(),
        ],
      ),
    );
  }



}
