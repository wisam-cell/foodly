import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:foodlyluss/Helpers/navigator_helper.dart';
import 'package:foodlyluss/Screens/Bnb/home_view.dart';
import 'package:foodlyluss/Screens/notifications_screen.dart';

class NotificationButton extends StatelessWidget with NavigatorHelper {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => jump(context, to: const NotificationsScreen()),
      child: Container(
        height: 50.h,
        width: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Stack(
          children: [
            Icon(
              Icons.notifications_outlined,
              color: Theme.of(context).primaryColor,
              size: 35.h,
            ),
            PositionedDirectional(
              top: 3.h,
              end: 3.w,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 6.h,
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 6.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.1.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ).animate().shake(duration: Duration(seconds: 1)),
    );
  }
}
