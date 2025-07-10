import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/data/model/item_model.dart';
import 'package:flutter_application_1/core/data/repository/shared_prefrens.dart';
import 'package:flutter_application_1/core/services/cart_services.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/cart_controller.dart';
import 'package:flutter_application_1/ui/views/main_views/menu._view/menu_controller.dart';
import 'package:flutter_application_1/ui/views/main_views/Favorites_view/favorits_controller.dart';
import 'package:get/get.dart';

class BurgerDetailsController extends GetxController {
  final DraggableScrollableController sheetController = DraggableScrollableController();

  RxBool isExpanded = false.obs;
  RxDouble initialChildSize = 0.1.obs;
  RxDouble minChildSize = 0.1.obs;
  RxDouble maxChildSize = 0.75.obs;

  RxList<String> ingredients = ['Onions', 'Tomatoes', 'Letuce', 'Salt', 'Mustard', 'Peper'].obs;
  RxList<String> selectedIngredients = <String>[].obs;

  var isFav = false.obs;

  late String burgerName;
  late String imagePath;

  void initialize(String burgerName, String imagePath) {
    this.burgerName = burgerName;
    this.imagePath = imagePath;
    selectedIngredients.assignAll(ingredients);
    checkIfFavorite(burgerName);
  }

  checkIfFavorite(String burgerName) {
    isFav.value = SharedPrefrenceRepository().isBurgerFavorite(burgerName);
  }

  toggleFavorite() {
    if (isFav.value) {
      SharedPrefrenceRepository().removeBurgerFromFavorite(burgerName);
    } else {
      SharedPrefrenceRepository().addBurgerToFavorite(burgerName, imagePath, price: 16.50);
    }
    isFav.toggle();

    try {
      final menuController = Get.find<MenueController>();
      menuController.favoritesMap[burgerName] = isFav.value;
    } catch (_) {}

    try {
      final favoritesController = Get.find<FavoritsController>();
      favoritesController.refreshFavorites();
    } catch (_) {}
  }

  void toggleIngredient(String ingredient, bool selected) {
    if (selected) {
      selectedIngredients.add(ingredient);
    } else {
      selectedIngredients.remove(ingredient);
    }
  }

  void ontapdecorator() {
    if (isExpanded.value) {
      sheetController.animateTo(
        initialChildSize.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      sheetController.animateTo(
        maxChildSize.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    isExpanded.toggle();
  }

  void resetSheet() {
    // فقط إعادة السهم للحالة الأصلية بدون تحريك الـ sheet
    isExpanded.value = false;
  }

  void addToCart() {
    final newItem = CartItemModel(
      id: burgerName,
      name: burgerName,
      price: 16.50,
      imageUrl: imagePath,
      quantity: 1,
    );

    CartServices().addItem(newItem);

    try {
      Get.find<CartController>().loadCart();
    } catch (_) {}
  }
}
