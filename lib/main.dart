import 'package:expense_manager_app/view/Screens/splash_screen.dart';
import 'package:expense_manager_app/controller/auth_credential_controller.dart';
import 'package:expense_manager_app/controller/category_list_controller.dart';
import 'package:expense_manager_app/controller/transacation_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) {
          return AuthCredential(username: "", password: "");
        }),
        ChangeNotifierProvider(create: (context) => CategoryListProvider()),
        ChangeNotifierProvider(
            create: (context) => TransacationListController()),
      ],
      child: const ScreenUtilInit(
        designSize: Size(360, 801),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
