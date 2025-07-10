import 'package:flutter_application_1/core/data/repository/shared_prefrens.dart';
import 'package:flutter_application_1/ui/views/main_views/menu._view/menu_controller.dart';
import 'package:get/get.dart';

class FavoritsController extends GetxController {
  RxList<Map<String, dynamic>> favoriteBurgers = <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  @override
  void onReady() {
    super.onReady();
    // Refresh data when controller is ready
    refreshFavorites();
  }

  // Called when the view becomes visible again
  void onViewResumed() {
    refreshFavorites();
  }

  void loadFavorites() {
    favoriteBurgers.value = SharedPrefrenceRepository().getFavoriteBurgers();

    // Update the menu controller's favorites map to ensure UI consistency
    try {
      MenueController menuController = Get.find<MenueController>();
      // Refresh all favorite states in menu controller
      for (String burgerName in menuController.burgerNames) {
        menuController.favoritesMap[burgerName] = SharedPrefrenceRepository().isBurgerFavorite(burgerName);
      }
    } catch (e) {
      // Menu controller not found, which is fine
    }
  }

  // Enhanced refresh method with loading state
  Future<void> refreshFavorites() async {
    isLoading.value = true;
    try {
      // Add a small delay to show loading state
      await Future.delayed(Duration(milliseconds: 100));

      // Force reload from SharedPreferences
      favoriteBurgers.value = SharedPrefrenceRepository().getFavoriteBurgers();

      // Update menu controller if it exists
      try {
        MenueController menuController = Get.find<MenueController>();
        for (String burgerName in menuController.burgerNames) {
          menuController.favoritesMap[burgerName] = SharedPrefrenceRepository().isBurgerFavorite(burgerName);
        }
      } catch (e) {
        // Menu controller not found, which is fine
      }

      // Force UI update
      favoriteBurgers.refresh();
    } finally {
      isLoading.value = false;
    }
  }

  // Force refresh method for external calls
  void forceRefresh() {
    refreshFavorites();
  }

  void removeFavorite(String burgerName) {
    SharedPrefrenceRepository().removeBurgerFromFavorite(burgerName);
    loadFavorites(); // reload the updated list

    // Update the menu controller's favorites map if it exists
    try {
      MenueController menuController = Get.find<MenueController>();
      menuController.favoritesMap[burgerName] = false;
    } catch (e) {
      // Menu controller not found, which is fine
    }
  }
}
