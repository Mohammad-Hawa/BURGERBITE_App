import 'package:flutter_application_1/core/services/cart_services.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  RxBool ischeck = true.obs;
  RxList<String> waytopay = ['Delivery', 'Pick Up'].obs;
  final CartServices _cartServices = CartServices();

  RxString selectway = 'Delivery'.obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt totalItems = 0.obs; // ✅ أضفنا هذا المتغير

  @override
  void onInit() {
    super.onInit();
    updateTotal();
  }

  void updateTotal() {
    totalPrice.value = _cartServices.getTotalPrice();
    totalItems.value = _cartServices.getTotalItems(); // ✅ تحديث عدد العناصر
  }

  void changeCategory(String way) {
    selectway.value = way;
  }
}
