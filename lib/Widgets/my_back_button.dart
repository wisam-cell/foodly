import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyBackButton extends StatelessWidget {
 final Function()? on_tap;
  const MyBackButton({
    this.on_tap,
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:on_tap ,
      ///TODO
        child: Container(
          height: 50.h,
          width: 50.h,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary
              ,borderRadius: BorderRadius.circular(15.r)
          ),
          child: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,),

        ));
  }
}