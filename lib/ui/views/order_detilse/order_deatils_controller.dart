import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/model/item_model.dart';
import 'package:flutter_application_1/core/services/cart_services.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxString totalPrice = '0.0'.obs;

  final CartServices _cartServices = CartServices();

  @override
  void onInit() {
    super.onInit();
    loadOrderDetails(); // يتم تحميل البيانات عند بداية الكلاس
  }

  void loadOrderDetails() {
    cartItems.value = _cartServices.getCartItems();
    totalPrice.value = _cartServices.getTotalPrice().toStringAsFixed(2);
  }
  
  show() async {
    await Get.defaultDialog(
        title: '',
        content: Center(
          child: Column(
            children: [
              CustomText(
                text: 'Successful payment',
                textColor: AppColors.orangeColor,
                styleType: TextStyleType.TITLE,
              ),
              Icon(
                Icons.check_circle_outline_outlined,
                size: screenWidth(5),
                color: AppColors.orangeColor,
              )
            ],
          ),
        ));
  }
}
