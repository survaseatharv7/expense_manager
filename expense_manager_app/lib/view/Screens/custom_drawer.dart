import 'package:expense_manager_app/view/Screens/category_screen.dart';
import 'package:expense_manager_app/view/Screens/graph_screen.dart';
import 'package:expense_manager_app/view/Screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget {
  int selectedPageIndex;
  CustomDrawer({super.key, required this.selectedPageIndex});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isTransactionSelected = false;
  bool isGraphSelected = false;
  bool isCategorySelected = false;
  bool isTrashSelected = false;
  bool isAboutUsSelected = false;
  int? selectedIndex;

  void pageDecider(int selectedIndex) {
    isTransactionSelected = selectedIndex == 0 ? true : false;
    isGraphSelected = selectedIndex == 1 ? true : false;
    isCategorySelected = selectedIndex == 2 ? true : false;
    isTrashSelected = selectedIndex == 3 ? true : false;
    isAboutUsSelected = selectedIndex == 4 ? true : false;
  }

  @override
  void initState() {
    selectedIndex = widget.selectedPageIndex;
    pageDecider(selectedIndex!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 216.w,
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18.w, top: 16.h),
            child: Text(
              "Expense Manager",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.w),
            child: Text(
              "Saves all your Transactions",
              style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(0, 0, 0, 0.6),
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.h),
            child: SizedBox(
              width: 184.w,
              height: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isTransactionSelected
                          ? const Color.fromRGBO(14, 161, 125, 0.15)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 17.h,
                          child: Image.asset("assets/TransactionLogo.png"),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "Transaction",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(14, 161, 125, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionPage()));
                      setState(() {});
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.h),
            child: SizedBox(
              width: 184.w,
              height: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isGraphSelected
                          ? const Color.fromRGBO(14, 161, 125, 0.15)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 17.h,
                          child: Image.asset("assets/GraphsLogo.png"),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "Graphs",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(14, 161, 125, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GraphPage()));
                      setState(() {});
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.h),
            child: SizedBox(
              width: 184.w,
              height: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isCategorySelected
                          ? const Color.fromRGBO(14, 161, 125, 0.15)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 17.h,
                          child: Image.asset("assets/CategoryLogo.png"),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "Category",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(14, 161, 125, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryPage()));
                      setState(() {});
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.h),
            child: SizedBox(
              width: 184.w,
              height: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isTrashSelected
                          ? const Color.fromRGBO(14, 161, 125, 0.15)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 17.h,
                          child: Image.asset("assets/TrashLogo.png"),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "Trash",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(14, 161, 125, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionPage()));
                      setState(() {});
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.h),
            child: SizedBox(
              width: 184.w,
              height: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAboutUsSelected
                          ? const Color.fromRGBO(14, 161, 125, 0.15)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 17.h,
                          child: Image.asset("assets/AboutUsLogo.png"),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "About Us",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(14, 161, 125, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionPage()));
                      setState(() {});
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
