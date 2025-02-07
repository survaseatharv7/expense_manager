import 'package:expense_manager_app/view/Screens/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Graphs",
          style: GoogleFonts.poppins(
              color: const Color.fromRGBO(33, 33, 33, 1),
              fontWeight: FontWeight.w500,
              fontSize: 16.sp),
        ),
      ),
      drawer: CustomDrawer(selectedPageIndex: 1),
      body: Column(
        children: [
          const Divider(),
        ],
      ),
    );
  }
}
