import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  Color? containerColor;
  double containerWidth;
  double containerHeight;
  Color? shadowColor = const Color.fromRGBO(0, 0, 0, 1);
  double elevation;
  String? hintText;
  double borderRadius;
  Border? containerBorder;
  bool readOnly;

  TextStyle? textStyle;

  TextFieldWidget(
      {super.key,
      required this.controller,
      this.hintText,
      this.borderRadius = 0,
      required this.containerHeight,
      required this.containerWidth,
      this.containerColor,
      this.elevation = 0,
      this.shadowColor,
      this.containerBorder,
      this.textStyle,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth.w,
      height: containerHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: containerBorder,
        color: containerColor,
      ),
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(8.r),
        shadowColor: shadowColor,
        child: TextField(
          controller: controller,
          readOnly: readOnly,
          cursorHeight: 15.h,
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              hintStyle: textStyle),
        ),
      ),
    );
  }
}
