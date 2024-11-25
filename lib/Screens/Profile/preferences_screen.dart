import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Helpers/navigator_helper.dart';
import 'package:foodlyluss/Screens/Profile/account_info_screen.dart';
import 'package:foodlyluss/Screens/Profile/location_screen.dart';
import 'package:foodlyluss/Widgets/app_list_tile.dart';
import 'package:foodlyluss/Widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen>with NavigatorHelper {
  late AppLocalizations applocale = AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: applocale.preferences),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 50.h),
              shrinkWrap: true,
              children: [
                AppListTile(
                  title: applocale.accountInformation,
                  icon: Icons.person_outlined,
                  subTitle:'change your account information',
                  bottomMargin: 40,
                  onTap: () => jump(context, to: const AccountInfoScreen()),
                ),

                AppListTile(
                  title: applocale.password,
                  subTitle: applocale.changeYourPassword,
                  icon: Icons.visibility_outlined,
                  bottomMargin: 40,
                ),

                AppListTile(
                  title: applocale.deliveryLocations,
                  subTitle: applocale.editOrChangeYourDailyDeliveryLocations,
                  icon: Icons.location_on_outlined,
                  bottomMargin: 40,
                  onTap: () => jump(context, to: const LocationScreen()),
                ),

              ],
              
              
            ),
          )
        ],
      ),

    );
  }
}
