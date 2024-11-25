import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Widgets/icon_container.dart';
import '../Helpers/style_helper.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({
    super.key,
  });

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> with StyleHelper{
  final Color _greyColor = const Color(0xff9D9693);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// TODO:
      },
      child: Container(
        width: 220.w,
        height: 200.h,
        margin: EdgeInsets.only(top: 70.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: appShadow(),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Cream Chicken',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            const TextSpan(
                                text: '\$14.',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: '99',
                              style: TextStyle(
                                color: _greyColor,
                                fontSize: 17.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                     const  IconContainer(icon: 'cart_icon', size: 40)
                    ],
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: -70.h,
              start: 0,
              end: 0,
              child: Image.asset(
                'assets/images/food_image.png',
                height: 145.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
