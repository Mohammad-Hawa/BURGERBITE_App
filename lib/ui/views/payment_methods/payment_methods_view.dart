import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/payment_methods/custom_payment.dart';
import 'package:flutter_application_1/ui/views/payment_methods/payment_methods_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentMethodsView extends StatefulWidget {
  const PaymentMethodsView({super.key});

  @override
  State<PaymentMethodsView> createState() => _nameState();
}

class _nameState extends State<PaymentMethodsView> {
  PaymentMethodsController controller = Get.put(PaymentMethodsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          onTap: () {},
          istitle: true,
          title: 'Payment methods',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: screenWidth(25), bottom: screenWidth(15)),
              width: screenWidth(1.5),
              height: screenHeight(15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    spreadRadius: 0.1,
                    blurRadius: 5,
                    offset: Offset(5, 5), // changes position of shadow
                  ),
                ],
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomText(
                  text: 'Add new',
                  textColor: AppColors.orangeColor,
                  styleType: TextStyleType.SUBTITLE,
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: screenWidth(25)),
                  child: Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.orangeColor),
                ),
              ]),
            ),
            SizedBox(
              height: screenHeight(1.4),
              child: ListView.builder(
                padding: EdgeInsetsDirectional.only(
                    start: screenWidth(12), end: screenWidth(12)),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.only(bottom: screenWidth(20)),
                    child: Obx(
                      () => CustomPument(
                        image: '${controller.image[index]}',
                        cardnum: 'xxxx-xxxx-xxxx-xxxx',
                        cardholder: 'John Philips',
                        expdarte: '09/23',
                        cvv: '335',
                        onchang: (p0) {
                          controller.Checkbox.value =
                              !controller.Checkbox.value;
                        },
                        ischeck: controller.Checkbox.value,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
