import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Widgets/food_item.dart';
import 'package:foodlyluss/Widgets/icon_container.dart';
import 'package:foodlyluss/Widgets/restaurant_item.dart';
import 'package:foodlyluss/Widgets/search_filter_row.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../Models/category_model.dart';
import '../../temp.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AppLocalizations applocale =AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 40.h),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [

          SearchFilterRow(),
          SizedBox(height: 40.h,),
          _buildSlider,
          SizedBox(height: 40.h,),
          _buildCategories,
          SizedBox(height: 35.h,),
          Text(
            applocale.trendingNow,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          ),
          SizedBox(height: 25.h),
          _buildTrendingNow,
          SizedBox(height: 35.h),
          Text(
            applocale.restaurantsNearYou,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          ),
          SizedBox(height: 25.h),
          _buildRestaurantsNearYou




        ].animate(
          interval: Duration(milliseconds: 10),

        ).moveX(),
      ),
    );
  }

  Widget get _buildRestaurantsNearYou {
    return SizedBox(
      height: 270.h,
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const RestaurantItem(),
        separatorBuilder: (context, index) => SizedBox(width: 24.w),
      ),
    );
  }


  List<CategoryModel> categories = [
    CategoryModel(
      color: const Color(0xffFF4201),
      text: 'Burgers',
      image: 'burger_image',
    ),
    CategoryModel(
      color: const Color(0xffDFA000),
      text: 'Pizzas',
      image: 'pizza_image',
    ),
    CategoryModel(
      color: const Color(0xff4B69FD),
      text: 'Cakes',
      image: 'cake_image',
    ),
    CategoryModel(
      color: const Color(0xff009E80),
      text: 'Tacos',
      image: 'taco_image',

    ),
  ];

  Widget get _buildTrendingNow {
    return SizedBox(
      height: 270.h,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => const FoodItem(),
        separatorBuilder: (context, index) => SizedBox(width: 24.w),
        itemCount: 5,
      ),
    );
  }

  Widget get _buildCategories {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100.h,
            width: 100.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: categories[index].color.withOpacity(0.35),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Stack(
              children: [
                PositionedDirectional(
                  top: 20.h,
                  end: -30.w,
                  start: 0,
                  bottom: -50.h,
                  child: Image.asset(
                      'assets/images/${categories[index].image}.png'),
                ),
                PositionedDirectional(
                  top: 10.h,
                  start: 12.w,
                  child: Text(
                    categories[index].text,
                    style: TextStyle(
                      color: categories[index].color,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                    ),
                  ).animate().rotate(duration: 500.ms),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
      ),
    );
  }

  Widget get _buildSlider {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            height: 160.h,
            width: MediaQuery.of(context).size.width - 60.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: tempImage,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 20.h,
                    bottom: 20.h,
                    start: 30.w,
                    end: (MediaQuery.of(context).size.width - 60) / 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Breakfast Best Deals',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Container(
                        height: 36.h,
                        constraints: BoxConstraints(maxWidth: 100.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Text(
                          'upto 40% off',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
      ),
    );
  }
}
