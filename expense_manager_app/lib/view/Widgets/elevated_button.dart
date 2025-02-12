import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ElevatedButtonWidget extends StatelessWidget {
  Color? buttonColor;
  double containerWidth;
  double containerHeight;
  double borderRadius;
  Widget child;
  double? elevation;
  Function()? onPressed;

  ElevatedButtonWidget(
      {super.key,
      required this.containerHeight,
      required this.containerWidth,
      this.buttonColor,
      required this.child,
      this.borderRadius = 0,
      this.elevation = 0,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: containerWidth.w,
      height: containerHeight.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
            )),
        child: child,
      ),
    );
  }
}
