import 'package:flutter_application_1/core/data/model/item_model.dart';
import 'package:flutter_application_1/core/services/cart_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartServices _cartServices = CartServices();
  static CartController get to => Get.find(); // 👈 لإعادة استخدامه بسهولة
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  void loadCart() {
    cartItems.value = List<CartItemModel>.from(_cartServices.getCartItems());
    cartItems.refresh();
    updateTotal();
  }

  void addItem(CartItemModel item) {
    _cartServices.addItem(item);
    loadCart();
  }

  void decreaseItem(String id) {
    _cartServices.decreaseItem(id);
    loadCart();
  }

  void removeItem(String id) {
    _cartServices.removeItem(id);
    loadCart();
  }

  void updateTotal() {
    totalPrice.value = _cartServices.getTotalPrice();
  }
}
