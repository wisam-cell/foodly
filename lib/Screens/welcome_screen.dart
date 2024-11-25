
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Helpers/navigator_helper.dart';
import 'package:foodlyluss/Models/welcome_model.dart';
import 'package:foodlyluss/Screens/main_screen.dart';
import 'package:foodlyluss/Widgets/my_back_button.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with NavigatorHelper{
 late AppLocalizations appLocale = AppLocalizations.of(context)!;

 late PageController controller;
 @override
  void initState() {

    super.initState();
    controller =PageController();
  }

 @override
 void dispose() {

   controller.dispose();
   super.dispose();

 }



 int currentPage = 0;


late List<WelcomeModel> items =[
   WelcomeModel(
     image: 'welcome_bg_1',
     title: appLocale.welcomeTitle1,
     subTitle: appLocale.welcomeSubTitle1,
   ),
   WelcomeModel(
     image: 'welcome_bg_2',
     title: appLocale.welcomeTitle2,
     subTitle: appLocale.welcomeSubTitle2,
   ),
   WelcomeModel(
     image: 'welcome_bg_3',
     title: appLocale.welcomeTitle3,
     subTitle: appLocale.welcomeSubTitle3,
   ),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
      padding: EdgeInsets.only(top: 65.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 35.w),
          child:currentPage == 0?null:
          MyBackButton(
              on_tap: ()=>controller.previousPage(duration: Duration(seconds: 1),
                                                  curve:Curves.easeInOut)),
        ),




          ///page view
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: items.length,
              onPageChanged: (index) => setState(() => currentPage = index),
             itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/${items[index].image!}.png'),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                         children: [
                           Text(items[index].title!,
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 35.sp,
                               fontWeight: FontWeight.w700,
                             ),
                           ),
                           Text(
                             items[index].subTitle!,
                             style: TextStyle(
                               color: const Color(0xff9D9693),
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w500,
                             ),
                             textAlign: TextAlign.center,
                           ),

                               ],
                          ),
                    )

                  ],

                );
             },






            ),
          ),
          /// row
          Padding(
            padding:EdgeInsetsDirectional.only(top:105.h,start: 35.w,end: 30.w,bottom: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h,
                child: ListView.separated(

                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(width: 8.w,),
                  itemCount: items.length,
                    itemBuilder: (context, index) {
                    return Container(
                      height: 10.h,
                      width:currentPage==index?22.w: 10.h,
                      decoration: BoxDecoration(
                        borderRadius: currentPage ==index ?
                        BorderRadius.circular(50.r):null,
                        shape: currentPage == index ?BoxShape.rectangle :BoxShape.circle,
                        color: currentPage==index?Theme.of(context).primaryColor
                            : Color(0xffC9C5C4)
                      ),
                    );

                    },),
                ),

                InkWell(
                  onTap:()=> jump(context,to: MainScreen(),replacment: true),
                  child: Text(appLocale.skip,style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),),
                )

              ],

            ),
          )

        ],
      ),
    ),




    );
  }
}


