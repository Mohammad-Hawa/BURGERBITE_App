import 'package:flutter_application_1/core/data/repository/shared_prefrens.dart';
import 'package:get/get.dart';

class MenueController extends GetxController {
  List<String> burgerImages = [
    'assets/images/pngs/burger13.jpg',
    'assets/images/pngs/burger12.jpg',
    'assets/images/pngs/burger11.jpg',
    'assets/images/pngs/burger10.jpg',
    'assets/images/pngs/burger9.jpeg',
    'assets/images/pngs/burger8.jpg',
    'assets/images/pngs/burger7.jpg',
    'assets/images/pngs/burger6.jpg',
    'assets/images/pngs/burger5.jpg',
    'assets/images/pngs/burger4.jpg',
    'assets/images/pngs/burger3.jpg',
    'assets/images/pngs/burger2.jpeg',
    'assets/images/pngs/burger1.jpg',
  ];

  final List<String> burgerNames = [
    'Cheese Burger',
    'Fish Burger',
    'Veggie Burger',
    'Beef Burger',
    'Double Meat Burger',
    'Big BBQ Burger',
    'Charcoal Grilled Burger',
    'Burger with Smoked Cheese',
    'Spicy Burger',
    'Chicken Burger',
    'Bacon Burger',
    'Blue Cheese Burger',
    'Classic Burger',
  ];
  final List<String> name = [
    'Cheese ',
    'Fish ',
    'Veggie',
    'Beef ',
    ' BBQ ',
    'Charcoal Grilled',
    'Burger with Smoked Cheese',
    'Spicy ',
    'Chicken ',
    'Bacon ',
    'Double Meat ',
    'Blue Cheese',
    'Classic ',
  ];
  // Map to track individual favorite states for each burger
  RxMap<String, bool> favoritesMap = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize favorite states for all burgers
    for (String burgerName in burgerNames) {
      favoritesMap[burgerName] = SharedPrefrenceRepository().isBurgerFavorite(burgerName);
    }
  }

  bool isBurgerFavorite(String burgerName) {
    return favoritesMap[burgerName] ?? false;
  }

  void toggleFavorite(String burgerName, String imagePath) {
    bool currentState = favoritesMap[burgerName] ?? false;

    if (currentState) {
      SharedPrefrenceRepository().removeBurgerFromFavorite(burgerName);
      favoritesMap[burgerName] = false;
    } else {
      SharedPrefrenceRepository().addBurgerToFavorite(burgerName, imagePath, price: 16.50);
      favoritesMap[burgerName] = true;
    }
  }
}
