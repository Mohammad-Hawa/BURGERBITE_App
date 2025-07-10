import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/auth/login_view/login_view.dart';
import 'package:flutter_application_1/ui/views/intro_views/intro_controller.dart';
import 'package:get/get.dart';

class IntroViews extends StatefulWidget {
  const IntroViews({super.key});

  @override
  State<IntroViews> createState() => _IntroViewsState();
}

class _IntroViewsState extends State<IntroViews> {
  IntroController controller = Get.put(IntroController());
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (controller.index.value < controller.image.length - 1) {
                  controller.index++;
                  pageController.animateToPage(
                    controller.index.value,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: PageView.builder(
                controller: pageController,
                itemCount: controller.image.length,
                onPageChanged: (index) {
                  controller.index.value = index;
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/pngs/${controller.image[index]}.png',
                          height: screenHeight(3),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenWidth(20), bottom: screenWidth(20)),
                          child: CustomText(
                            text: '${controller.title[index]}',
                            textColor: AppColors.whiteColor,
                            styleType: TextStyleType.TITLE,
                          ),
                        ),
                        CustomText(
                          textalign: TextAlign.center,
                          text: '${controller.subtitle[index]}',
                          textColor: AppColors.whiteColor,
                          styleType: TextStyleType.SUBTITLE,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenWidth(15), bottom: screenWidth(10)),
                          child: Obx(
                            () => DotsIndicator(
                              dotsCount: controller.title.length,
                              position: controller.index.value,
                              decorator: DotsDecorator(
                                activeSize:
                                    Size(screenWidth(15), screenHeight(65)),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: AppColors.orangeColor.withOpacity(0.5),
                                activeColor: AppColors.orangeColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // ✅ زر الدخول أسفل الشاشة خارج الـ PageView
            Obx(() => controller.index.value == controller.subtitle.length - 1
                ? Positioned(
                    bottom: screenWidth(10),
                    left: screenWidth(8),
                    right: screenWidth(8),
                    child: CustomButton(
                      bordereadius: screenWidth(15),
                      text: 'Getting started',
                      ontap: () {
                        Get.to(LoginView());
                      },
                    ),
                  )
                : SizedBox()),
          ],
        ),
      ),
    );
  }
}
