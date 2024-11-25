import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Helpers/navigator_helper.dart';
import 'package:foodlyluss/Screens/Profile/preferences_screen.dart';
//import 'package:foodlyluss/Screens/Profile/preferences_screen.dart';
import 'package:foodlyluss/Screens/splash_screen.dart';
import 'package:foodlyluss/Widgets/app_list_tile.dart';
import 'package:foodlyluss/temp.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:foodlyluss/Helpers/navigator_helper.dart';

import '../../Widgets/app_list_tile.dart';
import '../../temp.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with NavigatorHelper{
  late AppLocalizations appLocale = AppLocalizations.of(context)!;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 100.h),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildProfileImage,
        SizedBox(height: 12.h),
        Center(
          child: Column(
            children: [
              Text(
                'Charlie Greer',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '@CharlieG',
                style: TextStyle(
                  color: const Color(0xff9D9693),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 55.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            children: [
              AppListTile(

                title: appLocale.preferences,
                icon: Icons.settings_outlined,
                onTap: () => jump(context, to: const PreferencesScreen()),
              ),
              AppListTile(
                title: appLocale.accountSecurity,
                icon: Icons.lock_open,
                subWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14.h),
                    _buildRate(),
                    SizedBox(height: 14.h),
                    Text(
                      'Excellent!',
                      style: TextStyle(
                        color: const Color(0xff9D9693),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              AppListTile(
                title: appLocale.customerSupport,
                icon: Icons.support_agent_outlined,
              ),
              AppListTile(
                title: appLocale.logout,
                icon: Icons.logout_outlined,
                showTrailing: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRate() {
    double rating = 60;
    double width = 210;
    double value = width - (width * (rating / 100));
    return Container(
      height: 8.h,
      width: width.w,
      padding: EdgeInsetsDirectional.only(end: value.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }

  Widget get _buildProfileImage {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: tempImage,
              fit: BoxFit.cover,
            ),
          ),
          PositionedDirectional(
            bottom: 5.h,
            end: 0,
            child: CircleAvatar(
              radius: 13.h,
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(4.h),
                child:const  CircleAvatar(backgroundColor: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

