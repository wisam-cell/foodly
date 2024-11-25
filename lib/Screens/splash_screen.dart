
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodlyluss/Helpers/navigator_helper.dart';
import 'package:foodlyluss/Screens/welcome_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with NavigatorHelper {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),
            () => jump(context, to: WelcomeScreen(),replacment: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: _buildVersion1,
    );
  }

  Widget get _buildVersion2 {
    return Stack(
      children: [
        Positioned(
          right: -40.w,
          top: -50.h,
          child: SvgPicture.asset('assets/images/splash_corner_1.svg'),
        ),
        Positioned(
          left: -50.w,
          bottom: -40.h,
          child: SvgPicture.asset(
            'assets/images/splash_corner_2.svg',
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/splash_logo_2.svg'),
              SizedBox(height: 25.h),
              Text(
                'Foodly',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _buildVersion1 {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/splash_logo.svg'),
          Text(
            'Foodly',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
