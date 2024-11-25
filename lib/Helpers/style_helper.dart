import 'package:flutter/material.dart';

mixin StyleHelper {
  List<BoxShadow> appShadow() {
    return [
      BoxShadow(
        color: const Color(0xffDFDFDF).withOpacity(.8),
        offset: const Offset(0, 5),
        blurRadius: 10,
      ),
    ];
  }
}