import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_burger_type.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/burget_tool/burger_tool.dart';
import 'package:flutter_application_1/ui/views/custom_burger.dart';
import 'package:flutter_application_1/ui/views/deatils_burger/deatils_view.dart';
import 'package:flutter_application_1/ui/views/main_views/menu._view/menu_controller.dart';
import 'package:get/get.dart';

class MenueView extends StatefulWidget {
  const MenueView({super.key});

  @override
  State<MenueView> createState() => _MenueViewState();
}

MenueController controller = Get.put(MenueController());

class _MenueViewState extends State<MenueView> {
  final MenueController controller =
      Get.put(MenueController()); // هنا داخله بالكلاس

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(onTap: () {
          Get.to(BurgetTool());
        }),
        body: ListView(
          padding: EdgeInsetsDirectional.only(top: screenWidth(25)),
          children: [
            SizedBox(
              width: screenWidth(1),
              height: screenHeight(7),
              child: ListView.builder(
                padding: EdgeInsetsDirectional.only(end: screenWidth(20)),
                scrollDirection: Axis.horizontal,
                itemCount: controller.burgerImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
                    child: CustomBurgerType(
                      image: controller.burgerImages[index],
                      name: controller.name[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: screenWidth(1),
              height: screenHeight(1),
              child: ListView.builder(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(15), bottom: screenHeight(2.5)),
                itemCount: controller.burgerImages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => BurgerDetailsSheet(
                            imagePath: controller.burgerImages[index],
                            burgerName: controller.burgerNames[index],
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: screenWidth(20), bottom: screenWidth(20)),
                      child: Obx(
                        () => CustomBurger(
                          islike: controller.isBurgerFavorite(controller.burgerNames[index]),
                          isliketap: (isLiked) async {
                            controller.toggleFavorite(
                              controller.burgerNames[index],
                              controller.burgerImages[index],
                            );
                            return !isLiked;
                          },
                          image: controller.burgerImages[index],
                          name: controller.burgerNames[index],
                        ),
                      ), // انت لاحقاً تعدل عشان تمرر بيانات لكل برغر
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
