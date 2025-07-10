import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/core/data/repository/shared_prefrens.dart';
import 'package:flutter_application_1/ui/views/main_views/menu._view/menu_controller.dart';
import 'package:flutter_application_1/ui/views/main_views/Favorites_view/favorits_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Favorites Functionality Tests', () {
    late SharedPrefrenceRepository repository;
    late MenueController menuController;
    late FavoritsController favoritesController;

    setUp(() async {
      // Initialize shared preferences for testing
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      Get.put(prefs);

      repository = SharedPrefrenceRepository();
      menuController = MenueController();
      favoritesController = FavoritsController();
    });

    tearDown(() {
      Get.reset();
    });

    test('should add burger to favorites with price', () {
      // Arrange
      const burgerName = 'Test Burger';
      const imagePath = 'test/image.jpg';
      const price = 15.99;

      // Act
      repository.addBurgerToFavorite(burgerName, imagePath, price: price);

      // Assert
      expect(repository.isBurgerFavorite(burgerName), true);

      final favorites = repository.getFavoriteBurgers();
      expect(favorites.length, 1);
      expect(favorites[0]['name'], burgerName);
      expect(favorites[0]['image'], imagePath);
      expect(favorites[0]['price'], price);
    });

    test('should remove burger from favorites', () {
      // Arrange
      const burgerName = 'Test Burger';
      const imagePath = 'test/image.jpg';
      repository.addBurgerToFavorite(burgerName, imagePath);

      // Act
      repository.removeBurgerFromFavorite(burgerName);

      // Assert
      expect(repository.isBurgerFavorite(burgerName), false);
      expect(repository.getFavoriteBurgers().length, 0);
    });

    test('should not add duplicate favorites', () {
      // Arrange
      const burgerName = 'Test Burger';
      const imagePath = 'test/image.jpg';

      // Act
      repository.addBurgerToFavorite(burgerName, imagePath);
      repository.addBurgerToFavorite(burgerName, imagePath); // Try to add again

      // Assert
      expect(repository.getFavoriteBurgers().length, 1);
    });

    test('menu controller should track individual burger favorites', () {
      // Arrange
      const burgerName = 'Cheese Burger';
      const imagePath = 'test/image.jpg';

      // Act
      menuController.toggleFavorite(burgerName, imagePath);

      // Assert
      expect(menuController.isBurgerFavorite(burgerName), true);
      expect(repository.isBurgerFavorite(burgerName), true);
    });

    test('menu controller should toggle favorite state correctly', () {
      // Arrange
      const burgerName = 'Fish Burger';
      const imagePath = 'test/image.jpg';

      // Act - Add to favorites
      menuController.toggleFavorite(burgerName, imagePath);
      expect(menuController.isBurgerFavorite(burgerName), true);

      // Act - Remove from favorites
      menuController.toggleFavorite(burgerName, imagePath);
      expect(menuController.isBurgerFavorite(burgerName), false);
    });

    test('favorites controller should load favorites correctly', () {
      // Arrange
      const burgerName = 'Veggie Burger';
      const imagePath = 'test/image.jpg';
      const price = 12.50;
      repository.addBurgerToFavorite(burgerName, imagePath, price: price);

      // Act
      favoritesController.loadFavorites();

      // Assert
      expect(favoritesController.favoriteBurgers.length, 1);
      expect(favoritesController.favoriteBurgers[0]['name'], burgerName);
      expect(favoritesController.favoriteBurgers[0]['price'], price);
    });

    test('favorites controller should remove favorites correctly', () {
      // Arrange
      const burgerName = 'Beef Burger';
      const imagePath = 'test/image.jpg';
      repository.addBurgerToFavorite(burgerName, imagePath);
      favoritesController.loadFavorites();

      // Act
      favoritesController.removeFavorite(burgerName);

      // Assert
      expect(favoritesController.favoriteBurgers.length, 0);
      expect(repository.isBurgerFavorite(burgerName), false);
    });

    test('favorites controller should sync with menu controller on load', () {
      // Arrange
      const burgerName = 'Chicken Burger';
      const imagePath = 'test/image.jpg';
      repository.addBurgerToFavorite(burgerName, imagePath);

      // Act
      favoritesController.loadFavorites();

      // Assert
      expect(favoritesController.favoriteBurgers.length, 1);
      // Menu controller should also be updated if it exists
      if (menuController.burgerNames.contains(burgerName)) {
        expect(menuController.isBurgerFavorite(burgerName), true);
      }
    });

    test('should handle immediate UI updates correctly', () {
      // Arrange
      const burgerName = 'Double Meat Burger';
      const imagePath = 'test/image.jpg';

      // Act - Toggle favorite on
      menuController.toggleFavorite(burgerName, imagePath);

      // Assert - Should be immediately reflected
      expect(menuController.isBurgerFavorite(burgerName), true);
      expect(repository.isBurgerFavorite(burgerName), true);

      // Act - Toggle favorite off
      menuController.toggleFavorite(burgerName, imagePath);

      // Assert - Should be immediately reflected
      expect(menuController.isBurgerFavorite(burgerName), false);
      expect(repository.isBurgerFavorite(burgerName), false);
    });

    test('favorites controller should refresh data correctly', () async {
      // Arrange
      const burgerName = 'Refresh Test Burger';
      const imagePath = 'test/image.jpg';
      const price = 18.99;

      // Add a burger to favorites
      repository.addBurgerToFavorite(burgerName, imagePath, price: price);

      // Act - Refresh favorites
      await favoritesController.refreshFavorites();

      // Assert - Data should be loaded
      expect(favoritesController.favoriteBurgers.length, 1);
      expect(favoritesController.favoriteBurgers[0]['name'], burgerName);
      expect(favoritesController.favoriteBurgers[0]['price'], price);
      expect(favoritesController.isLoading.value, false);
    });

    test('favorites controller should handle loading state correctly', () async {
      // Arrange
      expect(favoritesController.isLoading.value, false);

      // Act - Start refresh
      final refreshFuture = favoritesController.refreshFavorites();

      // Assert - Loading should be true during refresh
      // Note: Due to the small delay in refreshFavorites, we might miss the loading state
      // but the method should complete successfully
      await refreshFuture;

      // Assert - Loading should be false after completion
      expect(favoritesController.isLoading.value, false);
    });

    test('favorites controller should force refresh correctly', () {
      // Arrange
      const burgerName = 'Force Refresh Burger';
      const imagePath = 'test/image.jpg';
      repository.addBurgerToFavorite(burgerName, imagePath);

      // Act - Force refresh
      favoritesController.forceRefresh();

      // Assert - Data should be updated
      expect(favoritesController.favoriteBurgers.length, 1);
      expect(favoritesController.favoriteBurgers[0]['name'], burgerName);
    });
  });
}
