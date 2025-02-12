import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomSnackBar {
  static customSnackBar({
    required BuildContext context,
    required String text,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.startToEnd,
        hitTestBehavior: HitTestBehavior.translucent,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
      ),
    );
  }
}
