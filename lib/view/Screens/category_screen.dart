import 'package:expense_manager_app/view/Screens/custom_drawer.dart';
import 'package:expense_manager_app/view/Widgets/category_alert_dialog.dart';
import 'package:expense_manager_app/view/Widgets/category_bottom_sheet.dart';
import 'package:expense_manager_app/view/Widgets/custom_snackbar.dart';
import 'package:expense_manager_app/view/Widgets/elevated_button.dart';
import 'package:expense_manager_app/controller/category_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
              color: const Color.fromRGBO(33, 33, 33, 1),
              fontWeight: FontWeight.w500,
              fontSize: 16.sp),
        ),
      ),
      drawer: CustomDrawer(selectedPageIndex: 2),
      body: GridView.builder(
          padding: EdgeInsets.all(20.sp),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10.w, mainAxisSpacing: 10.h),
          itemCount:
              Provider.of<CategoryListProvider>(context).categoryList.length,
          itemBuilder: (context, index) {
            return Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(14.r),
              shadowColor: Colors.black,
              child: GestureDetector(
                onLongPress: () {
                  CategoryAlertDialog.categoryAlertDialog(
                    context: context,
                    title: "Delete Category",
                    content:
                        "Are you sure you want to delete the selected Category?",
                    onPressedDelete: () {
                      Provider.of<CategoryListProvider>(context, listen: false)
                          .removeCategory(index: index);
                      Navigator.pop(context);

                      CustomSnackBar.customSnackBar(
                          context: context,
                          text: "Category Removed Succesfully",
                          color: Colors.green);
                    },
                  );
                },
                child: SizedBox(
                  width: 145.w,
                  height: 150.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 19.h),
                        child: Consumer(builder: (context, value, child) {
                          return Container(
                            width: 74.w,
                            height: 74.h,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Image.network(
                              Provider.of<CategoryListProvider>(context)
                                  .categoryList[index]
                                  .imageUrl,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress != null) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                return child;
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                              filterQuality: FilterQuality.high,
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Expanded(
                        child: Consumer(builder: (context, value, child) {
                          return Center(
                            child: Text(
                              Provider.of<CategoryListProvider>(context)
                                  .categoryList[index]
                                  .category,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: const Color.fromRGBO(33, 33, 33, 1),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: ElevatedButtonWidget(
          containerHeight: 46,
          containerWidth: 186,
          borderRadius: 67,
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(14, 161, 125, 1)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
              SizedBox(
                width: 9.w,
              ),
              Text(
                "Add Category",
                style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(37, 37, 37, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
              ),
            ],
          ),
          onPressed: () {
            CategoryBottomSheetOpener(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
