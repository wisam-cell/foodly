import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Widgets/icon_container.dart';

class AppListTile extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String? subTitle;
  final bool showTrailing;
  final dynamic icon;
  final Widget? subWidget;
  final double bottomMargin;

  const AppListTile({
    this.onTap,
    required this.title,
    this.subTitle,
    this.showTrailing = true,
    required this.icon,
    this.subWidget,
    this.bottomMargin = 30,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: bottomMargin.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconContainer(
              icon: icon,
              size: 50,
              fillColor: Theme.of(context).colorScheme.secondary,
              iconColor: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subTitle ?? '',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.sp,
                    ),
                  ),
                  subWidget ?? _empty,
                ],
              ),
            ),
            
            showTrailing
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: const Color(0xff9D9693),
                    size: 20.h,
                  )
                : _empty,
          ],
        ),
      ),
    );
  }

  Widget get _empty => const SizedBox.shrink();
}
