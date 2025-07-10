import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/auth/virfi_view/pinput.dart';
import 'package:flutter_application_1/ui/views/auth/virfi_view/virfi_controller.dart';
import 'package:flutter_application_1/ui/views/main_views/main_view.dart';
import 'package:flutter_application_1/ui/views/main_views/menu._view/menue_View.dart';
import 'package:get/get.dart';

class VirfiView extends StatelessWidget {
  const VirfiView({super.key});

  @override
  Widget build(BuildContext context) {
    final VirfiController controller =
        Get.put(VirfiController()); // استخدام GetX للوصول إلى الـ Controller

    return SafeArea(
      child: Scaffold(          resizeToAvoidBottomInset: false,

        appBar: AppBarCustom(
          istitle: true,
          title: 'VERIFY CODE',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: screenWidth(4)),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                          fontSize: screenWidth(15),
                          color: AppColors.blackColor),
                      text: '${'Enter' ?? ''}\n',
                    ),
                    TextSpan(
                      style: TextStyle(
                          fontSize: screenWidth(15),
                          color: AppColors.orangeColor),
                      text: 'Verification code',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), bottom: screenWidth(3)),
              child: Center(child: CustomPinPut()),
            ),
            CustomButton(
              text: 'Resend code ',
              ontap: () {
                controller.sec.value =
                    180; // إعادة تعيين الوقت عند إعادة إرسال الرمز
                controller.startTimer(); // بدء المؤقت مرة أخرى
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(25), bottom: screenWidth(25)),
              child: Obx(() {
                return CustomText(
                  textColor: AppColors.orangeColor,
                  fontWeight: FontWeight.bold,
                  styleType: TextStyleType.BODY,
                  text: controller.formatTime(controller.sec.value),
                );
              }),
            ),
            CustomButton(
              text: 'Confirm',
              ontap: () {
                Get.to(MainView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
