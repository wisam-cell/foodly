import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Widgets/custom_app_bar.dart';
import 'package:foodlyluss/main.dart';
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Notification'),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: GlobalKey(),

                  onDismissed: (direction) {
                    if(direction == DismissDirection.startToEnd){
                      print('delete');
                    }
                    // if(direction == DismissDirection.endToStart){
                    //   print('Archive');
                    //}
                  },
                  direction: DismissDirection.startToEnd, //only start to end
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                           width:200.w,
                            height: 100,
                            color: Colors.red,
                            child: Icon(Icons.delete,color: Colors.white,)),
                        Icon(Icons.archive_outlined,color: Colors.green,)
                      ],
                    )
                  ,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start
                      ,
                      children: [
                        Align( alignment : AlignmentDirectional.centerEnd,
                            child: Text('3/10/1985')),
                        Text('your order has been successsfully orderd',style: TextStyle(fontSize: 15.sp),)
                       ,Text('implemented')
                      ],
                    ),

                  ),
                );
            
              }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20.h,); },
            
            ),
          )
        ],
      ),



    );
  }
}
