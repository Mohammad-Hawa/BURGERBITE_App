import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/status_order/status_order_controller.dart';
import 'package:get/get.dart';

class OrderStatusView extends StatelessWidget {
  final controller = Get.put(OrderStatusController());

  @override
  Widget build(BuildContext conCustomText) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(
          istitle: true,
          title: 'Order status',
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight(25)),
              // صورة البرغر
              Image.asset(
                'assets/images/pngs/running burger icon.png',
                height: screenHeight(15),
              ),
              SizedBox(height: screenHeight(25)),

              // خطوات الطلب مع الخط الجانبي
              Obx(() =>
                  buildSteps(conCustomText, controller.orderStatus.value)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSteps(BuildContext conCustomText, OrderStatus currentStatus) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // الخط البرتقالي
        Column(
          children: [
            buildLine(isActive: currentStatus.index >= 0),
            buildLine(isActive: currentStatus.index >= 1, isTop: false),
            buildLine(isActive: currentStatus.index >= 2, isTop: false),
          ],
        ),
        SizedBox(width: screenWidth(25)),
        // النصوص
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildStepText(
              title: "Order received",
              time: "10:00 am, 14 July 2020",
              isActive: true,
            ),
            SizedBox(height: screenHeight(10)),
            buildStepText(
              title: "Order on the way",
              time: "10:10 am, 14 July 2020",
              isActive: currentStatus.index >= 1,
              highlight: currentStatus == OrderStatus.onTheWay,
            ),
            SizedBox(height: screenHeight(10)),
            buildStepText(
              title: "Order delivered",
              time: "Finished, 14 July 2020",
              isActive: currentStatus == OrderStatus.delivered,
            ),
          ],
        )
      ],
    );
  }

  Widget buildLine({required bool isActive, bool isTop = true}) {
    return Container(
      width: screenWidth(45),
      height: screenHeight(6),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget buildStepText(
      {required String title,
      required String time,
      required bool isActive,
      bool highlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
        ),
        SizedBox(height: screenHeight(80)),
        CustomText(
          text: time,
        ),
      ],
    );
  }
}
