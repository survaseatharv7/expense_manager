import 'package:expense_manager_app/view/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void navigateToNextScreen(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    navigateToNextScreen(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 329.h),
            child: Center(
              child: Container(
                width: 144.w,
                height: 144.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(234, 238, 235, 1),
                ),
                child: SizedBox(
                    width: 69.76.w,
                    height: 58.82.h,
                    child: Image.asset("assets/Logo.png")),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 213.h),
            child: Text(
              "Expense Manager",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
