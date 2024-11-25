import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../Models/category_model.dart';
import '../Widgets/my_button.dart';
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late AppLocalizations appLocale = AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'search filter',),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(appLocale.category),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 35.w,
                      bottom: 43.h,
                    ),
                    child: _buildCategories,
                  ),
                  _buildTitle(appLocale.sortBy),
                  _buildSortBy,
                  _buildTitle(appLocale.price),
                  _buildPriceSelector,
                  SizedBox(height: 40.h),
                  MyButton(
                    loading: false,
                    text: appLocale.apply.toUpperCase(),
                    horizontalMargin: 35,
                  ),





                ],



          ))


        ],
      ),


    );
  }
  double priceValue = 0;

  Widget get _buildPriceSelector {
    Color color = Theme.of(context).primaryColor;
    return Column(
      children: [
        Slider(
          value: priceValue,
          onChanged: (_) => setState(() => priceValue = _),
          inactiveColor: color,
          activeColor: color,
          thumbColor: color,
          min: 0,
          max: 1000,
          // divisions: 1,
          overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Theme.of(context).colorScheme.secondary),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <int>[0, 25, 50, 100, 500, 1000]
                .map((e) => Text(
              '\$$e',
              style: TextStyle(
                color: const Color(0xffC9C5C4),
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ))
                .toList(),
          ),
        ),
      ],
    );
  }
  Widget get _buildSortBy {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 23.h, start: 35.w),
      child: SizedBox(
        height: 50.h,
        child: ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          padding: EdgeInsetsDirectional.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 50.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                'Fast Delivery',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 17.w),
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(right: 35.w, left: 35.w, bottom: 23.h),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
        ),
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
}
