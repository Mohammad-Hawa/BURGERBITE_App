import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/main_views/menu._view/menue_View.dart';
import 'package:get/get.dart';

class EndRwgisrView extends StatelessWidget {
  const EndRwgisrView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: screenWidth(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: screenWidth(6)),
              child: Image.asset('assets/images/pngs/LOGO.png',
                  height: screenHeight(4)),
            ),
            Icon(
              Icons.check_circle,
              color: AppColors.orangeColor,
              size: screenWidth(5),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  bottom: screenWidth(2), top: screenWidth(10)),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                          fontSize: screenWidth(15),
                          color: AppColors.orangeColor),
                      text: '${'Thank you' ?? ''}\n',
                    ),
                    TextSpan(
                      style: TextStyle(
                          fontSize: screenWidth(20),
                          color: AppColors.whiteColor),
                      text: 'For registering your account',
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              text: 'Explore menu',
              ontap: () {
                Get.to(MenueView());
              },
            ),
          ],
        ),
      ),
    ));
  }
}
