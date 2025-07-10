import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/cart_services.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_payment.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/check_out_view/check_out_controller.dart';
import 'package:flutter_application_1/ui/views/main_views/profile_View/custom_info_num.dart';
import 'package:flutter_application_1/ui/views/order_detilse/order_detiles_view.dart';
import 'package:get/get.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final CheckOutController controller = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarCustom(
          istitle: true,
          title: 'Your order',
        ),
        backgroundColor: AppColors.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight(1.2),
              width: screenWidth(1),
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(25),
                  start: screenWidth(25),
                  end: screenWidth(25)),
              margin: EdgeInsets.symmetric(horizontal: screenWidth(25)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    spreadRadius: 0.1,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade500,
                    spreadRadius: 0.1,
                    blurRadius: 5,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: screenWidth(25)),
                    child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              textColor: AppColors.orangeColor,
                              styleType: TextStyleType.SUBTITLE,
                              text:
                                  '${controller.totalPrice.value.toStringAsFixed(2)} \$',
                            ),
                            CustomText(
                              text: '${controller.totalItems.value} items',
                            ),
                          ],
                        )),
                  ),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          controller.waytopay.length,
                          (index) {
                            final isSelected = controller.selectway.value ==
                                controller.waytopay[index];
                            return ToggleButtons(
                              fillColor: AppColors.whiteColor,
                              renderBorder: false,
                              isSelected: [isSelected],
                              onPressed: (i) {
                                controller
                                    .changeCategory(controller.waytopay[index]);
                              },
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: isSelected
                                            ? AppColors.orangeColor
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: CustomText(
                                    styleType: TextStyleType.TITLE,
                                    fontWeight: FontWeight.normal,
                                    text: controller.waytopay[index],
                                    textColor: isSelected
                                        ? AppColors.orangeColor
                                        : AppColors.blackColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )),
                  Obx(() {
                    return controller.selectway.value == 'Delivery'
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckboxListTile(
                                title: Text('Use actual location'),
                                value: controller.ischeck.value,
                                activeColor: AppColors.orangeColor,
                                onChanged: (bool) {
                                  controller.ischeck.value =
                                      !controller.ischeck.value;
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: screenWidth(25)),
                                child: CustomText(
                                  text: 'Street',
                                  styleType: TextStyleType.SUBTITLE,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: screenWidth(15),
                                    end: screenWidth(15),
                                    top: screenWidth(20),
                                    bottom: screenWidth(12),
                                  ),
                                  child: NumInfo(
                                    num: 'Macon street',
                                  )),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    bottom: screenWidth(20)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomText(
                                        text: 'House number',
                                        styleType: TextStyleType.SUBTITLE,
                                      ),
                                      CustomText(
                                        text: 'Appartement',
                                        styleType: TextStyleType.SUBTITLE,
                                      ),
                                    ]),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: screenWidth(15),
                                          end: screenWidth(15),
                                        ),
                                        child: NumInfo(
                                          num: '644',
                                        )),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          start: screenWidth(15),
                                          end: screenWidth(15),
                                        ),
                                        child: NumInfo(
                                          num: '22',
                                        ),
                                      )),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  //! Location
                                },
                                child: Container(
                                  margin: EdgeInsetsDirectional.only(
                                      top: screenWidth(25),
                                      bottom: screenWidth(25)),
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: AlignmentDirectional.center,
                                        margin: EdgeInsetsDirectional.only(
                                            start: screenWidth(25),
                                            end: screenWidth(25)),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: screenWidth(250),
                                              color: AppColors.orangeColor),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          size: screenWidth(8),
                                          Icons.location_on,
                                          color: AppColors.orangeColor,
                                        ),
                                      ),
                                      CustomText(
                                        text: 'Set new location',
                                        styleType: TextStyleType.SUBTITLE,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: screenWidth(25),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Restaurant address',
                                  styleType: TextStyleType.SUBTITLE,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: screenWidth(30),
                                    bottom: screenWidth(20),
                                    end: screenWidth(3.1),
                                  ),
                                  child: NumInfo(
                                    num: 'BurgerBite North',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    bottom: screenWidth(25),
                                  ),
                                  child: CustomText(
                                    text: 'Restaurant address',
                                    styleType: TextStyleType.SUBTITLE,
                                  ),
                                ),
                                CustomText(
                                  text:
                                      'Mon-Fri : 9:30 - 21:00\nSat-Sun : 11:00 - 22:00',
                                  styleType: TextStyleType.BODY,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: screenWidth(20),
                                    bottom: screenWidth(30),
                                  ),
                                  child: CustomText(
                                    text: 'Phone number',
                                    styleType: TextStyleType.SUBTITLE,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    bottom: screenWidth(25),
                                  ),
                                  child: CustomText(
                                    text: '22 343 2434',
                                    styleType: TextStyleType.BODY,
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: screenWidth(25),
                        bottom: screenWidth(25),
                        start: screenWidth(25)),
                    child: CustomText(
                      text: 'Payment methods',
                      styleType: TextStyleType.SUBTITLE,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomPaymentContainer(
                        image: 'assets/images/pngs/Icon payment-paypal.png',
                      ),
                      CustomPaymentContainer(
                        image:
                            'assets/images/pngs/Icon material-credit-card.png',
                      ),
                      CustomPaymentContainer(
                        image: 'assets/images/pngs/Icon payment-apple-pay.png',
                      ),
                      CustomPaymentContainer(
                        image: 'assets/images/pngs/Icon payment-cash.png',
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: screenWidth(25),
                    ),
                    child: Center(
                      child: CustomButton(
                        text: 'MAKE AN ORDER',
                        ontap: () {
                          Get.to(OrderDetailsView());
                        },
                        bordereadius: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
