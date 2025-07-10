import 'package:flutter_application_1/core/data/model/item_model.dart';
import 'package:get/get.dart';

class CartServices {
  static final CartServices _instance = CartServices._internal();

  factory CartServices() {
    return _instance;
  }

  CartServices._internal();

  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> getCartItems() => _cartItems;

  void addItem(CartItemModel item) {
    int index = _cartItems.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _cartItems[index].quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
  }

  void decreaseItem(String id) {
    int index = _cartItems.indexWhere((e) => e.id == id);
    if (index != -1 && _cartItems[index].quantity > 1) {
      _cartItems[index].quantity -= 1;
    } else if (index != -1) {
      _cartItems.removeAt(index);
    }
  }

  void removeItem(String id) {
    _cartItems.removeWhere((e) => e.id == id);
  }

  double getTotalPrice() {
    return _cartItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  int getTotalItems() {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }
}
