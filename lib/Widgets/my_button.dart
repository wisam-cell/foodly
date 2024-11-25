import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final bool loading;
  final double height;
  final double horizontalMargin;

  const MyButton({
    this.onTap,
    required this.text,
    this.loading = false,
    this.height = 65,
    this.horizontalMargin = 0,
    super.key,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.loading ? null : widget.onTap,
      child: Container(
        height: widget.height.h,
        width: double.infinity,
        margin: EdgeInsets.only(
          right: widget.horizontalMargin.w,
          left: widget.horizontalMargin.w,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: !widget.loading
            ? Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
