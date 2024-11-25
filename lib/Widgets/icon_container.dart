import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  final double size;
  final Function()? onTap;
  final dynamic icon;
  final Color? fillColor;
  final Color? iconColor;

  const IconContainer({
    required this.icon,
    this.size = 70,
    this.onTap,
    this.fillColor,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.h,
        width: size.h,
        alignment: Alignment.center,
        padding: EdgeInsets.all(7.h),
        decoration: BoxDecoration(
          color: fillColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: icon.runtimeType == String
            ? SvgPicture.asset(
                'assets/icons/$icon.svg',
                color: iconColor ?? Colors.white,
              )
            : Icon(
                icon,
                size: 26.h,
                color: iconColor ?? Colors.white,
              ),
      )
    );
  }
}
