import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AppTextField extends StatefulWidget {
 final TextEditingController controller;
 final String hint ;
 final bool hasEditIcon;
 final TextInputType inputType;
  const AppTextField({
    this.inputType= TextInputType.name,
    required this.controller,
    required this.hint,
    this.hasEditIcon=false,
        super.key});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: widget.controller,
      keyboardType: widget.inputType,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(

        filled: true,
        fillColor: Colors.white,


        contentPadding: EdgeInsets.symmetric(horizontal: 28.w,vertical: 20.h),
     
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey,fontSize: 13.sp),
        
        suffixIcon:widget.hasEditIcon? Padding(
          padding: EdgeInsetsDirectional.only(end: 20.w),
          child: SvgPicture.asset('assets/icons/edit_icon.svg',height: 30.h,),
        ):SizedBox.shrink(),
        suffixIconConstraints: const BoxConstraints(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none
        ),focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none
      ),

      ),





    );
  }
}
