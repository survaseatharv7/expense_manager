import 'package:expense_manager_app/controller/category_list_controller.dart';
import 'package:expense_manager_app/controller/transacation_list_controller.dart';
import 'package:expense_manager_app/model/category.dart';
import 'package:expense_manager_app/view/Widgets/custom_snackbar.dart';
import 'package:expense_manager_app/view/Widgets/elevated_button.dart';
import 'package:expense_manager_app/view/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionBottomsheetOpener {
  TransactionBottomsheetOpener(BuildContext context) {
    bottomSheet(context);
  }
  TextEditingController _dateController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<void> bottomSheet(BuildContext context) {
    Category? selectedCategory;

    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              String imageUrl;

              Future<void> _selectDate(BuildContext context) async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2024),
                    lastDate: DateTime.now());
                if (pickedDate != null) {
                  _dateController.text =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  setState(() {});
                }
              }

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
                        padding: EdgeInsets.only(left: 22.w, top: 34.h),
                        child: Text(
                          "Date",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(33, 33, 33, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, top: 6.h),
                        child: Container(
                          width: 316.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color.fromRGBO(191, 189, 189, 1),
                                  width: 1)),
                          child: TextField(
                            readOnly: true,
                            controller: _dateController,
                            cursorHeight: 15.h,
                            onTap: () {
                              _selectDate(context);
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 5.h),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, top: 19.h),
                        child: Text(
                          "Amount",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(33, 33, 33, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, top: 6.h),
                        child: TextFieldWidget(
                          controller: _amountController,
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
                          padding: EdgeInsets.only(
                              left: 22.w, top: 6.h, right: 23.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromRGBO(191, 189, 189, 1),
                                  width: 1.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Category>(
                                value: selectedCategory,
                                isExpanded: true, // Makes it take full width
                                items:
                                    Provider.of<CategoryListProvider>(context)
                                        .categoryList
                                        .map((Category category) {
                                  imageUrl = category.imageUrl;
                                  return DropdownMenuItem<Category>(
                                    value: category,
                                    child: Text(category.category),
                                  );
                                }).toList(),
                                onChanged: (Category? newValue) {
                                  selectedCategory = newValue;
                                  imageUrl = newValue!.imageUrl;
                                  setState(() {});
                                },
                              ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, top: 19.h),
                        child: Text(
                          "Description",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(33, 33, 33, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, top: 6.h),
                        child: TextFieldWidget(
                          controller: _descriptionController,
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
                              if (_dateController.text.isNotEmpty &&
                                  _amountController.text.isNotEmpty &&
                                  _descriptionController.text.isNotEmpty &&
                                  selectedCategory != null) {
                                Provider.of<TransacationListController>(context,
                                        listen: false)
                                    .addTransaction(
                                        category: selectedCategory!.category,
                                        imageUrl: selectedCategory!.imageUrl,
                                        date: _dateController.text.trim(),
                                        description:
                                            _descriptionController.text.trim(),
                                        amount: double.parse(
                                            _amountController.text.trim()));
                                Navigator.pop(context);
                              } else {
                                CustomSnackBar.customSnackBar(
                                    context: context,
                                    text: "Please Fill in all fields",
                                    color: Colors.red);
                              }
                            }),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
