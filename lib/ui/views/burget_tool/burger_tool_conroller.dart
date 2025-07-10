import 'package:get/get.dart';

// Controller
class BurgetToolController extends GetxController {
  var selectedCategory = 'Cheese'.obs;

  List<String> image = [
    'assets/images/pngs/cheese.png',
    'assets/images/pngs/meat.png',
    'assets/images/pngs/sauces.png',
    'assets/images/pngs/harvest.png',
    'assets/images/pngs/fish.png',
    'assets/images/pngs/bread-roll.png'
  ];

  final List<String> categories = [
    'Cheese',
    'Meat',
    'Toppings',
    'Vegetables',
    'Fish',
    'Bun',
  ];

  var meatCounts = {
    'Beef': 1,
    'Chicken': 1,
    'Turkey': 1,
  }.obs;

  var cheeseSelections = {
    'Cheddar': false,
    'Swiss': false,
    'Mozzarella': false,
    'Parmesan': false,
  }.obs;

  var toppingsSelections = {
    'Ketchup': false,
    'Mayonnaise': false,
    'Mustard': false,
    'Hash browns': false,
    'Truffle butter': false,
    'BBQ sauce': false,
    'Buffalo sauce': false,
  }.obs;

  var vegetableSelections = {
    'Lettuce': false,
    'Tomato': false,
    'Onion': false,
    'Mushroom': false,
    'Cucumber': false,
    'Squash': false,
    'Kale': false,
    'Spinach': false,
  }.obs;

  var fishCounts = {
    'Tandoori': 1,
    'Salmon': 1,
    'Tilapia': 1,
    'Teriyaki': 1,
  }.obs;

  var bunSelections = {
    'Sesame seed': false,
    'Sliced bread': false,
    'Potato roll': false,
    'Onion roll': false,
    'Kaiser roll': false,
    'English muffin': false,
  }.obs;

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  void incrementMeat(String meat) {
    meatCounts[meat] = (meatCounts[meat] ?? 0) + 1;
  }

  void decrementMeat(String meat) {
    if ((meatCounts[meat] ?? 0) > 0) {
      meatCounts[meat] = (meatCounts[meat] ?? 0) - 1;
    }
  }

  void toggleCheese(String cheese) {
    cheeseSelections[cheese] = !(cheeseSelections[cheese] ?? false);
  }

  void toggleTopping(String topping) {
    toppingsSelections[topping] = !(toppingsSelections[topping] ?? false);
  }

  void toggleVegetable(String vegetable) {
    vegetableSelections[vegetable] = !(vegetableSelections[vegetable] ?? false);
  }

  void toggleBun(String bun) {
    bunSelections[bun] = !(bunSelections[bun] ?? false);
  }

  void incrementFish(String fish) {
    fishCounts[fish] = (fishCounts[fish] ?? 0) + 1;
  }

  void decrementFish(String fish) {
    if ((fishCounts[fish] ?? 0) > 0) {
      fishCounts[fish] = (fishCounts[fish] ?? 0) - 1;
    }
  }
}
