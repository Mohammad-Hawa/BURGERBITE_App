import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/deatils_burger/deatils_burger_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class BurgerDetailsSheet extends StatefulWidget {
  final String imagePath;
  final String burgerName;

  const BurgerDetailsSheet({
    super.key,
    required this.imagePath,
    required this.burgerName,
  });

  @override
  _BurgerDetailsSheetState createState() => _BurgerDetailsSheetState();
}

BurgerDetailsController controller = Get.put(BurgerDetailsController());

class _BurgerDetailsSheetState extends State<BurgerDetailsSheet> {
  @override
  void initState() {
    super.initState();
    controller.initialize(widget.burgerName, widget.imagePath);
  }

  @override
  void dispose() {
    controller.resetSheet(); // إعادة حالة السهم
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Get.back(); // الخروج من الصفحة
          },
        ),
        foregroundColor: AppColors.whiteColor,
        actions: [
          Obx(() => LikeButton(
                size: screenWidth(14),
                isLiked: controller.isFav.value,
                onTap: (isLiked) async {
                  controller.toggleFavorite();
                  return !isLiked;
                },
                likeBuilder: (bool isLiked) {
                  return Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                    color:
                        isLiked ? AppColors.orangeColor : AppColors.greycolor,
                  );
                },
              )),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: screenWidth(35),
              end: screenWidth(35),
            ),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              controller.isExpanded.value = notification.extent >
                  controller.initialChildSize.value + 0.05;
              return true;
            },
            child: DraggableScrollableSheet(
              controller: controller.sheetController,
              initialChildSize: controller.initialChildSize.value,
              minChildSize: controller.minChildSize.value,
              maxChildSize: controller.maxChildSize.value,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.ontapdecorator();
                        },
                        child: Obx(() => AnimatedRotation(
                              duration: Duration(milliseconds: 300),
                              turns: controller.isExpanded.value ? 0.5 : 0,
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: controller.isExpanded.value
                                    ? AppColors.orangeColor
                                    : AppColors.blackColor,
                                size: screenWidth(7),
                              ),
                            )),
                      ),
                      Center(
                        child: CustomText(
                          text: "Ingredients",
                          styleType: TextStyleType.TITLE,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: screenWidth(25),
                            horizontal: screenWidth(5)),
                        child: CustomButton(
                          text: 'Add To Cart',
                          ontap: () {
                            controller.addToCart();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Item added to cart'),
                              backgroundColor: AppColors.orangeColor,
                              duration: Duration(seconds: 2),
                            ));
                          },
                        ),
                      ),
                      ...List.generate(
                        controller.ingredients.length,
                        (index) {
                          final ingredient = controller.ingredients[index];
                          return Obx(() => CheckboxListTile(
                                contentPadding: EdgeInsetsDirectional.only(
                                  end: screenWidth(10),
                                  start: screenWidth(10),
                                ),
                                title: CustomText(
                                  text: ingredient,
                                  styleType: TextStyleType.SUBTITLE,
                                ),
                                value: controller.selectedIngredients
                                    .contains(ingredient),
                                onChanged: (bool? value) {
                                  controller.toggleIngredient(
                                      ingredient, value!);
                                },
                                activeColor: AppColors.orangeColor,
                                checkColor: AppColors.whiteColor,
                              ));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(20),
              vertical: screenWidth(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: widget.burgerName,
                        textColor: AppColors.whiteColor,
                        styleType: TextStyleType.TITLE,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: 4.5,
                      itemCount: 5,
                      itemSize: screenWidth(15),
                      unratedColor: AppColors.whiteColor,
                      itemBuilder: (context, index) {
                        return Icon(Icons.star, color: AppColors.orangeColor);
                      },
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: screenWidth(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.orangeColor,
                  ),
                  child: CustomText(
                    styleType: TextStyleType.TITLE,
                    text: '16.50 \$',
                    textColor: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
