import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Screens/main_screen.dart';
import 'package:foodlyluss/Screens/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  SharedPreferences cached = await SharedPreferences.getInstance();
  await cached.setString('name', 'wesam');
  await cached.setInt('gender', 1);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xffF5F5F5),
            primaryColor: const Color(0xffFF42201),
            //secondery color
            colorScheme: theme.colorScheme.copyWith(secondary: const Color(0xffFFE8E0))

          ),


          home: const MainScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: const Locale('en'),
          supportedLocales: [
            const Locale('en'),
            const Locale('ar'),
          ],
        );
      },


      );

  }
}

