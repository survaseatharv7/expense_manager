import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryAlertDialog {
  static void categoryAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    required Function() onPressedDelete,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            titlePadding: EdgeInsets.only(left: 81.w, top: 19),
            content: Text(
              content,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Colors.black),
            ),
            contentPadding: EdgeInsets.only(left: 38.w, top: 10.h),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actionsPadding: EdgeInsets.only(
                left: 40.w, top: 20.h, bottom: 20.h, right: 40.w),
            actions: [
              SizedBox(
                width: 100.w,
                height: 35.h,
                child: ElevatedButton(
                  onPressed: onPressedDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                  ),
                  child: Text(
                    "Delete",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                height: 35.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(140, 128, 128, 0.2),
                  ),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          );
        });
  }
}
