import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/repository/shared_prefrens.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/views/arrival_order/arrival_order_view.dart';
import 'package:flutter_application_1/ui/views/auth/forgot_password_view/forgot_password_view.dart';
import 'package:flutter_application_1/ui/views/auth/login_view/login_view.dart';
import 'package:flutter_application_1/ui/views/auth/phonnum_view/phonenum_view.dart';
import 'package:flutter_application_1/ui/views/auth/virfi_view/virfi_view.dart';
import 'package:flutter_application_1/ui/views/auth/end_registr/end_registr_view.dart';
import 'package:flutter_application_1/ui/views/main_views/Favorites_view/favorits_View.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/cart_View.dart';
import 'package:flutter_application_1/ui/views/main_views/main_view.dart';
import 'package:flutter_application_1/ui/views/main_views/profile_View/Profile_view.dart';
import 'package:flutter_application_1/ui/views/new_method_view/new_method_view.dart';
import 'package:flutter_application_1/ui/views/payment_methods/payment_methods_view.dart';
import 'package:flutter_application_1/ui/views/splash_view/splash_view.dart';
import 'package:flutter_application_1/ui/views/status_order/status_order_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "BurgerBite",
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.orangeColor,
          selectionColor: AppColors.orangeColor,
          selectionHandleColor: AppColors.orangeColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
