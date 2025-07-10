import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/burget_tool/burger_tool.dart';
import 'package:flutter_application_1/ui/views/check_out_view/check_out_view.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/cart_controller.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/custom_card.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(onTap: () {
          Get.to(BurgetTool());
        }),
        body: Stack(
          children: [
            Obx(() => ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                        bottom: screenWidth(15),
                        top: screenWidth(15),
                        start: screenWidth(25),
                        end: screenWidth(25),
                      ),
                      child: CustomCartd(
                        nameburger: item.name,
                        numburger: '${item.quantity}',
                        pric:
                            '${(item.price * item.quantity).toStringAsFixed(2)} \$',
                        additembutton: () {
                          controller.addItem(item);
                        },
                        removitembutton: () {
                          controller.decreaseItem(item.id);
                        },
                        deletbutton: () {
                          controller.removeItem(item.id);
                        },
                      ),
                    );
                  },
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth(1),
                height: screenHeight(8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      spreadRadius: 0.1,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.only(bottom: screenWidth(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            text: 'Total',
                            styleType: TextStyleType.SUBTITLE,
                          ),
                          Obx(() => CustomText(
                                text:
                                    '${controller.totalPrice.value.toStringAsFixed(2)} \$',
                                styleType: TextStyleType.SUBTITLE,
                              )),
                        ],
                      ),
                    ),
                    CustomButton(
                      bordereadius: 10,
                      text: 'Checkout',
                      ontap: () {
                        Get.to(CheckOutView());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
