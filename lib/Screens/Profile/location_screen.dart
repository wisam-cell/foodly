import 'package:flutter/material.dart';
import 'package:foodlyluss/Widgets/app_list_tile.dart';
import 'package:foodlyluss/Widgets/app_text_field.dart';
import 'package:foodlyluss/Widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Widgets/my_button.dart';
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late AppLocalizations applocale = AppLocalizations.of(context)!;
  late TextEditingController streetEditingController;
  late TextEditingController houseEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streetEditingController = TextEditingController();
    houseEditingController = TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    streetEditingController.dispose();
    houseEditingController.dispose();

    super.dispose();
  }
bool switchValue = false;
  String? gender;
  bool boxStatue1 =false;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: applocale.addNewAddress),
          SizedBox(height: 100.h,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                AppTextField(controller: streetEditingController,
                    hint:applocale.streetNumber),
                SizedBox(height: 20.h,),
                AppTextField(
                    controller: houseEditingController,
                    hint:applocale.houseNumber,
                ),
                SizedBox(height: 20.h,),
                _buildCityCountry,
                SizedBox(height: 20.h,),
                Switch(value: switchValue, onChanged:(value) =>
                  setState(() => switchValue = value)),
                SizedBox(height: 20.h,),
                Row(

                  children: [
                    Row(
                      children: [

                        SizedBox(width: 20.w,),



                        Radio(
                            activeColor: Colors.red,
                            value: 'M',
                            groupValue: gender,
                            onChanged: (value){
                              setState(() {
                                gender = value;
                              });
                            }
                        ),
                        Text('male')
                      ],
                    ),
                    Row(
                      children: [
                        // Switch(value: switchValue, onChanged:(value) =>
                        //   setState(() => switchValue = value)),
                        SizedBox(width: 20.w,),



                        Radio(
                          activeColor: Colors.red,
                            value: "F",
                            groupValue: gender,
                            onChanged: (value){
                              setState(() {
                                gender = value;
                              });
                            }
                        ),
                        Text('female')
                      ],
                    ),
                ],),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Checkbox(
                      //tristate: true,
                     // activeColor: Colors.red,
                     // checkColor: Colors.red,
                      //focusColor: Colors.green,
                      value: boxStatue1,
                      onChanged:(new_val) {
                           setState(() {
                             boxStatue1 =new_val!;
                           });
                    },),
                    Text("remember me"),
                  ],
                ),


                SizedBox(height: 50.h,),

                MyButton(text: applocale.saveChanges)
            
              ],
            
            ),
          )
      ]
      )


    );
  }

  Widget get _buildCityCountry{
    return Row(
      children: [
        Expanded(
          flex: 45,
          child: InkWell(
            onTap: () => _showCities(),
            child: Container(
              padding: EdgeInsetsDirectional.only(start: 28.w,end: 20.w),
                height: 65.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r)
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(applocale.city,style: TextStyle(color: Colors.grey,fontSize: 13.sp),),
                      Icon(Icons.keyboard_arrow_down,color: Colors.grey,size: 25.h,)
                    ],
                  ),
            ),
          )
        ),


        SizedBox(width: 17.w,),
        Expanded(
          flex: 55,
            child: Container(
            padding: EdgeInsetsDirectional.only(start: 28.w,end: 20.w),
            height: 65.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r)
                ),
            child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                     Text(applocale.state,style: TextStyle(color: Colors.grey,fontSize: 13.sp),),
                     Icon(Icons.keyboard_arrow_down,color: Colors.grey,size: 25.h,)
            ],
            ),
            ),
        )
      ],
    );


  }


  void _showCities (){
   // showModalBottomSheet( context: context, builder: (context) {
   // return Column();
   //
   // },);
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        width: double.infinity,
        //height: 200.h,
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [Text("data")],
        ));



    },);

}

}
