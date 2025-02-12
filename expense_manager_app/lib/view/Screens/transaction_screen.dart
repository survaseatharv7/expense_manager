import 'package:expense_manager_app/controller/transacation_list_controller.dart';
import 'package:expense_manager_app/view/Screens/custom_drawer.dart';
import 'package:expense_manager_app/view/Widgets/transaction_bottom_sheet.dart';
import 'package:expense_manager_app/view/Widgets/elevated_button.dart';
import 'package:expense_manager_app/view/Widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "January 2025 ",
              style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(33, 33, 33, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 30.sp,
              color: const Color.fromRGBO(33, 33, 33, 1),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Consumer(
        builder: (context, value, child) {
          return Expanded(
            child: ListView.builder(
                itemCount: Provider.of<TransacationListController>(context)
                    .transactionList
                    .length,
                itemBuilder: (context, index) {
                  return TransactionCard(index: index);
                }),
          );
        },
      ),
      drawer: CustomDrawer(
        selectedPageIndex: 0,
      ),
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
                "Add Transaction",
                style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(37, 37, 37, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
              ),
            ],
          ),
          onPressed: () {
            TransactionBottomsheetOpener(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
