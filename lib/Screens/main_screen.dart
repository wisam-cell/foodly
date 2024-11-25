import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Helpers/navigator_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:foodlyluss/Screens/Bnb/cart_view.dart';
import 'package:foodlyluss/Screens/Bnb/favorites_view.dart';
import 'package:foodlyluss/Screens/Bnb/home_view.dart';
import 'package:foodlyluss/Screens/Bnb/profile_view.dart';
import '../Models/bottom_nav_item_model.dart';
import '../Widgets/notifications_button.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>with NavigatorHelper {
 late AppLocalizations appLocale =AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: selectedIndex != 3 ? AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: 90.h,
          title: Padding(
            padding: EdgeInsets.only(
              top: 40.h,
              right: 30.w,
              left: 30.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          appLocale.yourLocation,
                          style: TextStyle(
                            color: const Color(0xff9D9693),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).primaryColor,
                          size: 20.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Karachi, Pakistan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const NotificationButton().animate().shake(duration: Duration(seconds: 3)),
              ],
            ),
          ),
        ) : null,



    body: [
     const HomeView(),
     const FavoritesView(),
     const CartView(),
     const ProfileView()
    ][selectedIndex],

      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }
  late List<BottomNavItemModel> items = [
    BottomNavItemModel(
      icon: Icons.home_outlined,
      label: appLocale.home,
    ),
    BottomNavItemModel(
      icon: Icons.favorite_border_outlined,
      label: appLocale.favorites,
    ),
    BottomNavItemModel(
      icon: Icons.shopping_cart_outlined,
      label: appLocale.carts,
    ),
    BottomNavItemModel(
      icon: Icons.person_outline,
      label: appLocale.profile,
    ),
  ];

  int selectedIndex = 0;

  Widget get _buildBottomNavigationBar {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 27.h, bottom: 45.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.r),
          topLeft: Radius.circular(15.r),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(.2),
            offset: const Offset(0, -4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map(//from list of nav model to list of widgets
              (po) {
            int index = items.indexOf(po);
            return index == selectedIndex
                ? Container(
              height: 45.h,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    po.icon,
                    color: Theme.of(context).primaryColor,
                    size: 32.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    po.label!,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
                : InkWell(
              onTap: () => setState(() => selectedIndex = index),
              child: Icon(
                po.icon,
                color: const Color(0xffC9C5C4),
                size: 32.h,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
