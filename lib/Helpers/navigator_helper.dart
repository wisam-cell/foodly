import 'package:flutter/material.dart';
mixin NavigatorHelper{
  void jump(BuildContext context, { required Widget to,bool replacment =false}){
  replacment ==false ?
  Navigator.push(context, MaterialPageRoute(builder: (context)=> to))
      : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> to));
  }






}