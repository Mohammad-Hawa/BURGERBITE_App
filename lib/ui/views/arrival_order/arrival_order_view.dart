import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/arrival_order/arrival_order_controller.dart';
import 'package:flutter_application_1/ui/views/main_views/main_view.dart';
import 'package:get/get.dart';

class OrderArrivalView extends StatelessWidget {
  final ArrivalOrderController controller = Get.put(ArrivalOrderController());

  OrderArrivalView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/pngs/Icon.png',
                  width: screenWidth(1.5),
                ),
                SizedBox(height: screenHeight(25)),
                CustomText(
                  text: "Thank You",
                  textColor: AppColors.orangeColor,
                  styleType: TextStyleType.TITLE,
                ),

                SizedBox(height: screenHeight(50)),
                CustomText(
                  text: "Your order has arrived",
                  textColor: AppColors.whiteColor,
                  styleType: TextStyleType.SUBTITLE,
                ),

                SizedBox(height: screenHeight(25)),

                // عرض الوقت
                Obx(() {
                  final seconds = controller.arrivalTimeInSeconds.value;
                  final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
                  final sec = (seconds % 60).toString().padLeft(2, '0');
                  return CustomText(
                    text: "$minutes:$sec",
                    textColor: AppColors.orangeColor,
                    fontSize: screenWidth(8),
                  );
                }),
                CustomText(
                  text: "to arrive",
                  textColor: AppColors.whiteColor,
                ),

                SizedBox(height: screenHeight(10)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton(
                    text: "BACK TO MENU",
                    ontap: () {
                      Get.to(MainView());
                    },
                    bordereadius: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
