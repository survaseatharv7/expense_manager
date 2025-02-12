import 'package:expense_manager_app/view/Widgets/custom_snackbar.dart';
import 'package:expense_manager_app/view/Widgets/elevated_button.dart';
import 'package:expense_manager_app/view/Widgets/textfield.dart';
import 'package:expense_manager_app/controller/category_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryBottomSheetOpener {
  CategoryBottomSheetOpener(BuildContext context) {
    bottomSheet(context);
  }

  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();

  Future<void> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 434.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 144.w, top: 37.h),
                    child: Container(
                      width: 74.w,
                      height: 74.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(140, 128, 128, 0.2)),
                      child: Center(
                        child: SizedBox(
                          width: 22.w,
                          height: 22.h,
                          child: Image.asset(
                            "assets/NoImage.png",
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 168.w, top: 3.h),
                    child: Text(
                      "Add",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w, top: 34.h),
                    child: Text(
                      "Image URL",
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(33, 33, 33, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w, top: 6.h),
                    child: TextFieldWidget(
                      controller: _imageUrlController,
                      containerHeight: 36,
                      containerWidth: 316,
                      borderRadius: 5,
                      containerBorder: Border.all(
                          color: const Color.fromRGBO(191, 189, 189, 1),
                          width: 1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w, top: 19.h),
                    child: Text(
                      "Category",
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(33, 33, 33, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w, top: 6.h),
                    child: TextFieldWidget(
                      controller: _categoryController,
                      containerHeight: 36,
                      containerWidth: 316,
                      borderRadius: 5,
                      containerBorder: Border.all(
                          color: const Color.fromRGBO(191, 189, 189, 1),
                          width: 1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 118.w, top: 34.h),
                    child: ElevatedButtonWidget(
                        containerHeight: 40.h,
                        borderRadius: 67,
                        containerWidth: 123.w,
                        buttonColor: const Color.fromRGBO(14, 161, 125, 1),
                        child: Text(
                          "Add",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                        onPressed: () {
                          if (_categoryController.text.trim().isNotEmpty &&
                              _imageUrlController.text.trim().isNotEmpty) {
                            Provider.of<CategoryListProvider>(context,
                                    listen: false)
                                .addNewCategory(
                                    imageUrl: _imageUrlController.text.trim(),
                                    category: _categoryController.text.trim());
                            Navigator.pop(context);
                            CustomSnackBar.customSnackBar(
                                context: context,
                                text: "Category Added Successfully",
                                color: Colors.green);
                          } else {
                            CustomSnackBar.customSnackBar(
                                context: context,
                                text: "Please fill in all the fields",
                                color: Colors.red);
                          }
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
