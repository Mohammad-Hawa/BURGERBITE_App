import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/order_detilse/order_deatils_controller.dart';
import 'package:flutter_application_1/ui/views/status_order/status_order_view.dart';
import 'package:get/get.dart';

class OrderDetailsView extends StatelessWidget {
  OrderDetailsView({super.key});

  final OrderDetailsController controller = Get.put(OrderDetailsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          istitle: true,
          title: 'Your Order',
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        styleType: TextStyleType.TITLE,
                        fontWeight: FontWeight.normal,
                        text: "Contact infos"),
                    SizedBox(height: screenHeight(45)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.orangeColor,
                            text: "Name"),
                        CustomText(text: "John Philips"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            fontWeight: FontWeight.bold,
                            text: "Number",
                            textColor: AppColors.orangeColor),
                        CustomText(text: "22 452 4545"),
                      ],
                    ),
                    SizedBox(height: screenHeight(45)),
                    CustomText(
                        fontWeight: FontWeight.bold,
                        text: "Delivery address",
                        textColor: AppColors.orangeColor),
                    SizedBox(height: screenHeight(35)),
                    CustomText(text: "Macon street, n°644, apprt 22"),
                  ],
                ),
              ),
              SizedBox(height: screenHeight(30)),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        styleType: TextStyleType.TITLE,
                        fontWeight: FontWeight.normal,
                        text: "Payment methods"),
                    SizedBox(height: screenHeight(45)),
                    CustomText(
                        fontWeight: FontWeight.bold,
                        styleType: TextStyleType.SUBTITLE,
                        text: "VISA",
                        textColor: AppColors.orangeColor),
                    SizedBox(height: screenHeight(35)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            fontWeight: FontWeight.bold,
                            text: "Cardholder name"),
                        CustomText(text: "John Philips"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            fontWeight: FontWeight.bold, text: "Card number"),
                        CustomText(text: "xxxx-xxxx-xxxx-xxxx"),
                      ],
                    ),
                    SizedBox(height: screenHeight(45)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            fontWeight: FontWeight.bold,
                            text: "CVV",
                            textColor: AppColors.orangeColor),
                        CustomText(text: "335"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            fontWeight: FontWeight.bold,
                            text: "Expiration date",
                            textColor: AppColors.orangeColor),
                        CustomText(text: "09/23"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight(30)),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        styleType: TextStyleType.TITLE,
                        fontWeight: FontWeight.normal,
                        text: "Your order"),
                    SizedBox(height: screenHeight(45)),
                    Column(
                      children: controller.cartItems.map((item) {
                        final totalPrice =
                            (item.price * item.quantity).toStringAsFixed(2);
                        return Container(
                          margin: EdgeInsets.only(bottom: screenHeight(50)),
                          height: screenHeight(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          bottom: screenWidth(25)),
                                      child: CustomText(
                                          styleType: TextStyleType.SUBTITLE,
                                          textColor: AppColors.orangeColor,
                                          text: item.name),
                                    ),
                                    CustomText(
                                        styleType: TextStyleType.CUSTOM,
                                        text: 'quantity : ${item.quantity}'),
                                    CustomText(
                                        styleType: TextStyleType.CUSTOM,
                                        text: 'price : $totalPrice\$'),
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item.imageUrl,
                                  width: screenHeight(6),
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight(30)),
              Center(
                child: CustomButton(
                  text: "PAY ${controller.totalPrice} \$",
                  ontap: () async {
                    controller.show(); // إظهار الـ Dialog
                    await Future.delayed(Duration(
                        seconds: 2)); // انتظار 2 ثانية أو المدة التي تريدها
                    Get.back(); // إغلاق الـ Dialog
                    Get.to(() => OrderStatusView()); // الانتقال للصفحة الثانية
                  },
                  bordereadius: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
