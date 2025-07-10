// View
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/burget_tool/burger_tool_conroller.dart';
import 'package:get/get.dart';

class BurgetTool extends StatelessWidget {
  final BurgetToolController controller = Get.put(BurgetToolController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Toggle Buttons
            Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        List.generate(controller.categories.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ToggleButtons(
                          isSelected: [
                            controller.selectedCategory.value ==
                                controller.categories[index],
                          ],
                          onPressed: (selectedIndex) {
                            controller
                                .changeCategory(controller.categories[index]);
                          },
                          borderRadius: BorderRadius.circular(12),
                          selectedBorderColor: AppColors.orangeColor,
                          borderColor: Colors.grey,
                          fillColor: AppColors.orangeColor.withOpacity(0.1),
                          renderBorder: true,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    controller.image[index],
                                    width: screenWidth(11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                )),

            SizedBox(height: 10),

            // Content based on selected category
            Expanded(
              child: Obx(() {
                String selected = controller.selectedCategory.value;

                if (selected == 'Meat') {
                  return ListView(
                    children: controller.meatCounts.keys.map((meat) {
                      return buildCounterRow(
                        title: meat,
                        count: controller.meatCounts[meat]!,
                        onIncrement: () => controller.incrementMeat(meat),
                        onDecrement: () => controller.decrementMeat(meat),
                      );
                    }).toList(),
                  );
                } else if (selected == 'Toppings') {
                  return ListView(
                    children: controller.toppingsSelections.keys.map((topping) {
                      return buildCheckboxRow(
                        title: topping,
                        value: controller.toppingsSelections[topping]!,
                        onChanged: (val) => controller.toggleTopping(topping),
                      );
                    }).toList(),
                  );
                } else if (selected == 'Cheese') {
                  return ListView(
                    children: controller.cheeseSelections.keys.map((cheese) {
                      return buildCheckboxRow(
                        title: cheese,
                        value: controller.cheeseSelections[cheese]!,
                        onChanged: (val) => controller.toggleCheese(cheese),
                      );
                    }).toList(),
                  );
                } else if (selected == 'Vegetables') {
                  return ListView(
                    children:
                        controller.vegetableSelections.keys.map((vegetable) {
                      return buildCheckboxRow(
                        title: vegetable,
                        value: controller.vegetableSelections[vegetable]!,
                        onChanged: (val) =>
                            controller.toggleVegetable(vegetable),
                      );
                    }).toList(),
                  );
                } else if (selected == 'Fish') {
                  return ListView(
                    children: controller.fishCounts.keys.map((fish) {
                      return buildCounterRow(
                        title: fish,
                        count: controller.fishCounts[fish]!,
                        onIncrement: () => controller.incrementFish(fish),
                        onDecrement: () => controller.decrementFish(fish),
                      );
                    }).toList(),
                  );
                } else if (selected == 'Bun') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.bunSelections.keys.map((bun) {
                      return buildCheckboxRow(
                        title: bun,
                        value: controller.bunSelections[bun]!,
                        onChanged: (val) => controller.toggleBun(bun),
                      );
                    }).toList(),
                  );
                } else {
                  return Center(child: Text('No items available.'));
                }
              }),
            ),

            // NEXT Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                ontap: () {},
                text: 'NEXT',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCounterRow({
    required String title,
    required int count,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: screenWidth(12), // العرض
                height: screenWidth(12), // الارتفاع = العرض ⇒ مربع
                decoration: BoxDecoration(
                  color: AppColors.orangeColor,
                  borderRadius: BorderRadius.circular(
                      8), // زوايا خفيفة (اجعله 0 لو تريده مربع حاد تماماً)
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.remove, color: AppColors.whiteColor),
                  onPressed: onDecrement,
                ),
              ),
              Text(count.toString()),
              IconButton(
                icon: Icon(Icons.add, color: AppColors.orangeColor),
                onPressed: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCheckboxRow({
    required String title,
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      activeColor: AppColors.orangeColor,
      onChanged: onChanged,
    );
  }
}
