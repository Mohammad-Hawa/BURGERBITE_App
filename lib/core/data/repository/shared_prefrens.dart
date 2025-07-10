import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DataType {
  STRING,
  INT,
  BOOL,
  DOUBLE,
  LISTSTRING,
}

class SharedPrefrenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();

  //!--- Keys

  String PREF_FAVORITE_BURGER = 'favorite_burger'; // Key for favorite products
  //* --- ----

  addBurgerToFavorite(String burgerName, String imagePath, {double price = 16.50}) {
    List<String> currentList = pref.getStringList(PREF_FAVORITE_BURGER) ?? [];
    Map<String, dynamic> newItem = {
      'name': burgerName,
      'image': imagePath,
      'price': price
    };
    String jsonItem = jsonEncode(newItem);

    // Check if item already exists (by name)
    bool itemExists = currentList.any((item) {
      Map<String, dynamic> decoded = jsonDecode(item);
      return decoded['name'] == burgerName;
    });

    if (!itemExists) {
      currentList.add(jsonItem);
      setPrefrnce(
          type: DataType.LISTSTRING,
          key: PREF_FAVORITE_BURGER,
          value: currentList);
    }
  }

  removeBurgerFromFavorite(String burgerName) {
    List<String> currentList = pref.getStringList(PREF_FAVORITE_BURGER) ?? [];
    currentList.removeWhere((item) {
      Map<String, dynamic> decoded = jsonDecode(item);
      return decoded['name'] == burgerName;
    });
    setPrefrnce(
        type: DataType.LISTSTRING,
        key: PREF_FAVORITE_BURGER,
        value: currentList);
  }

  List<Map<String, dynamic>> getFavoriteBurgers() {
    List<String> currentList = pref.getStringList(PREF_FAVORITE_BURGER) ?? [];
    return currentList
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
  }

  bool isBurgerFavorite(String burgerName) {
    List<Map<String, dynamic>> favorites = getFavoriteBurgers();
    return favorites.any((item) => item['name'] == burgerName);
  }

  setPrefrnce({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrnce(String key) {
    return pref.get(key);
  }
}
