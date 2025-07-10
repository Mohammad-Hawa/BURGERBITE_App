import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_contianer.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/burget_tool/burger_tool.dart';
import 'package:flutter_application_1/ui/views/deatils_burger/deatils_view.dart';
import 'package:flutter_application_1/ui/views/main_views/Favorites_view/favorits_controller.dart';
import 'package:get/get.dart';

class FavoritsView extends StatefulWidget {
  const FavoritsView({super.key});
  @override
  State<FavoritsView> createState() => _FavoritsViewState();
}

class _FavoritsViewState extends State<FavoritsView> with WidgetsBindingObserver {
  FavoritsController controller = Get.put(FavoritsController());

  @override
  void initState() {
    super.initState();
    // Add observer for app lifecycle changes
    WidgetsBinding.instance.addObserver(this);

    // Refresh favorites when the view is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.refreshFavorites();
    });
  }

  @override
  void dispose() {
    // Remove observer when disposing
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Refresh when app comes back to foreground
    if (state == AppLifecycleState.resumed) {
      controller.refreshFavorites();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh favorites when returning to this view
    controller.refreshFavorites();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.blackColor),
          onPressed: () {
            Get.to(BurgetTool());
          },
        ),
        title: CustomText(
          text: 'Favorites',
          styleType: TextStyleType.TITLE,
          textColor: AppColors.blackColor,
        ),
        centerTitle: true,
        actions: [
          Obx(() => IconButton(
            icon: controller.isLoading.value
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.orangeColor,
                    ),
                  )
                : Icon(Icons.refresh, color: AppColors.orangeColor),
            onPressed: controller.isLoading.value
                ? null
                : () => controller.refreshFavorites(),
            tooltip: 'Refresh favorites',
          )),
          SizedBox(width: 8),
        ],
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            await controller.refreshFavorites();
          },
          child: controller.isLoading.value
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.orangeColor,
                      ),
                      SizedBox(height: screenWidth(20)),
                      CustomText(
                        text: 'Loading favorites...',
                        styleType: TextStyleType.BODY,
                        textColor: AppColors.greycolor,
                      ),
                    ],
                  ),
                )
              : controller.favoriteBurgers.isEmpty
                  ? ListView(
                      // Make it scrollable for pull-to-refresh even when empty
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  size: screenWidth(6),
                                  color: AppColors.greycolor,
                                ),
                                SizedBox(height: screenWidth(20)),
                                CustomText(
                                  text: 'No favorites yet',
                                  styleType: TextStyleType.SUBTITLE,
                                  textColor: AppColors.greycolor,
                                ),
                                SizedBox(height: screenWidth(40)),
                                CustomText(
                                  text: 'Add some burgers to your favorites\nto see them here!',
                                  styleType: TextStyleType.BODY,
                                  textColor: AppColors.greycolor,
                                  textalign: TextAlign.center,
                                ),
                                SizedBox(height: screenWidth(20)),
                                CustomText(
                                  text: 'Pull down to refresh',
                                  styleType: TextStyleType.SMALL,
                                  textColor: AppColors.greycolor.withOpacity(0.7),
                                  textalign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      padding: EdgeInsetsDirectional.only(
                          top: screenWidth(15),
                          end: screenWidth(25),
                          start: screenWidth(25)),
                      itemCount: controller.favoriteBurgers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsetsDirectional.only(bottom: screenWidth(15)),
                          child: CustomCon(
                            image: '${controller.favoriteBurgers[index]['image']}',
                            nametext: '${controller.favoriteBurgers[index]['name']}',
                            price: controller.favoriteBurgers[index]['price']?.toDouble() ?? 16.50,
                            onTap: () {
                              // Navigate to burger details view and refresh when returning
                              Get.to(() => BurgerDetailsSheet(
                                imagePath: '${controller.favoriteBurgers[index]['image']}',
                                burgerName: '${controller.favoriteBurgers[index]['name']}',
                              ))?.then((_) {
                                // Refresh favorites when returning from details
                                controller.refreshFavorites();
                              });
                            },
                            onRemove: () {
                              controller.removeFavorite('${controller.favoriteBurgers[index]['name']}');
                            },
                          ),
                        );
                      },
                    ),
        ),
      ),
    ));
  }
}


  // Row(
  //                       children: [
  //                         CustomText(text: '10.50 £'),
  //                         TextButton(
  //                             onPressed: () {},
  //                             child: CustomText(
  //                               text: 'Remove',
  //                               textColor: AppColors.orangeColor,
  //                             ))
  //                       ],
  //                     ),