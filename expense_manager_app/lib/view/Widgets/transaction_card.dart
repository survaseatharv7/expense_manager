import 'package:expense_manager_app/controller/transacation_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TransactionCard extends StatelessWidget {
  int index;
  TransactionCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 62.h,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.w, top: 10.h),
                child: SizedBox(
                  width: 41.w,
                  height: 41.h,
                  child: Image.network(
                      Provider.of<TransacationListController>(context)
                          .transactionList[index]
                          .imageUrl),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          Provider.of<TransacationListController>(context)
                              .transactionList[index]
                              .category,
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 120.w),
                          child: SizedBox(
                            width: 15.w,
                            height: 15.w,
                            child: Image.asset(
                              "assets/Subtract.png",
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "${Provider.of<TransacationListController>(context).transactionList[index].amount}",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        )
                      ],
                    ),
                    Text(
                      Provider.of<TransacationListController>(context)
                          .transactionList[index]
                          .description,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 0, 0, 0.8),
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 221.w),
                      child: Text(
                        Provider.of<TransacationListController>(context)
                            .transactionList[index]
                            .date,
                        style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(0, 0, 0, 0.6),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
