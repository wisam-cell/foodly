import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Helpers/style_helper.dart';
import 'package:foodlyluss/temp.dart';

class RestaurantItem extends StatefulWidget {
  const RestaurantItem({super.key});

  @override
  State<RestaurantItem> createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> with StyleHelper {
  final Color _greyColor = const Color(0xff9D9693);

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.greenAccent,
    Colors.teal,
    Colors.brown,
    Colors.blueGrey,
    Colors.black,
  ];

  Color get chipColor => colors[Random().nextInt(colors.length)];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// TODO:
      },
      child: Container(
        height: 270.h,
        width: 280.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: appShadow(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: tempImage,
              height: 140.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 14.h,
                bottom: 18.h,
                right: 20.w,
                left: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Steak House',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '24min',
                        style: TextStyle(
                          color: _greyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      CircleAvatar(radius: 1.5.h, backgroundColor: _greyColor),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.star,
                        color: const Color(0xffFFBA00),
                        size: 22.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        '4.8',
                        style: TextStyle(
                          color: _greyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 25.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 25.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: chipColor.withOpacity(.3),
                            borderRadius: BorderRadius.circular(5.6.r),
                          ),
                          child: Text(
                            '$index',
                            style: TextStyle(
                              color: chipColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 11.w),
                      itemCount: colors.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
