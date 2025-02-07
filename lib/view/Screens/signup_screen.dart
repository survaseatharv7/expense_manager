import 'package:expense_manager_app/view/Widgets/elevated_button.dart';
import 'package:expense_manager_app/view/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cnfPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 145.w, top: 86.h),
            child: SizedBox(
              width: 69.76.w,
              height: 58.82.h,
              child: Image.asset("assets/Logo.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 41.w, top: 60.18.h),
            child: Text(
              "Create your Account",
              style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(
                    0,
                    0,
                    0,
                    1,
                  ),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, top: 25.h),
            child: TextFieldWidget(
              controller: _nameController,
              containerHeight: 49,
              containerWidth: 280,
              hintText: "Name",
              borderRadius: 8,
              elevation: 3.0,
              containerColor: Colors.white,
              textStyle: GoogleFonts.poppins(
                color: const Color.fromRGBO(0, 0, 0, 0.4),
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, top: 22.h),
            child: TextFieldWidget(
              controller: _usernameController,
              containerHeight: 49,
              containerWidth: 280,
              hintText: "Username",
              borderRadius: 8,
              elevation: 3.0,
              containerColor: Colors.white,
              textStyle: GoogleFonts.poppins(
                color: const Color.fromRGBO(0, 0, 0, 0.4),
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, top: 22.h),
            child: TextFieldWidget(
              controller: _passwordController,
              containerHeight: 49,
              containerWidth: 280,
              hintText: "Password",
              borderRadius: 8,
              elevation: 3.0,
              containerColor: Colors.white,
              textStyle: GoogleFonts.poppins(
                color: const Color.fromRGBO(0, 0, 0, 0.4),
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, top: 22.h),
            child: TextFieldWidget(
              controller: _cnfPasswordController,
              containerHeight: 49,
              containerWidth: 280,
              hintText: "Confirm Password",
              borderRadius: 8,
              elevation: 3.0,
              containerColor: Colors.white,
              textStyle: GoogleFonts.poppins(
                color: const Color.fromRGBO(0, 0, 0, 0.4),
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, top: 30.h),
            child: ElevatedButtonWidget(
                containerHeight: 49,
                containerWidth: 280,
                borderRadius: 8,
                buttonColor: const Color.fromRGBO(14, 161, 125, 1),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
