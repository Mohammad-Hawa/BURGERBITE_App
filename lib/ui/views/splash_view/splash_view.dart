import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/getready_view/get_ready_view.dart';
import 'package:flutter_application_1/ui/views/splash_view/splash_controller.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Stack(clipBehavior: Clip.none, children: [
          Image.asset(
            'assets/images/pngs/BURGERBITE.png',
          ),
          Positioned(
            bottom: screenWidth(18),
            left: screenWidth(3),
            child: Image.asset(
              'assets/images/pngs/LOGO.png',
              height: screenHeight(3),
            ),
          ),
        ]),
      ),
    ));
  }
}
