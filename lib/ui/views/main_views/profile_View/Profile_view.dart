import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_payment.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/main_views/profile_View/custom_info_num.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarCustom(onTap: () {}),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: screenWidth(15),
          end: screenWidth(15),
          top: screenWidth(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: screenHeight(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.orangeColor, width: 5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      screenWidth(45),
                    ), // Border radius
                    child: ClipOval(
                        child: Image.asset(
                      'assets/images/pngs/person.png',
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                SizedBox(
                  width: screenWidth(20),
                ),
                Column(children: [
                  CustomText(
                      text: 'John Philips',
                      fontWeight: FontWeight.bold,
                      styleType: TextStyleType.TITLE),
                  CustomText(text: '22 452 4545')
                ]),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: screenWidth(6),
                    start: screenWidth(35),
                  ),
                  child: CustomText(
                    fontWeight: FontWeight.bold,
                    text: 'Edit profile',
                    textColor: AppColors.orangeColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: screenWidth(15),
                end: screenWidth(15),
                top: screenWidth(15),
                bottom: screenWidth(15),
              ),
              child: CustomText(
                text: 'Location',
                styleType: TextStyleType.SUBTITLE,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(25)),
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
              padding: EdgeInsetsDirectional.only(bottom: screenWidth(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), bottom: screenWidth(15)),
              child: CustomText(
                text: 'Payment methods',
                styleType: TextStyleType.SUBTITLE,
                fontWeight: FontWeight.normal,
              ),
            ),
            InkWell(
              onTap: (){
                // Get.to(page);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomPaymentContainer(
                    image: 'assets/images/pngs/Icon payment-paypal.png',
                  ),
                  CustomPaymentContainer(
                    image: 'assets/images/pngs/Icon material-credit-card.png',
                  ),
                  CustomPaymentContainer(
                    image: 'assets/images/pngs/Icon payment-apple-pay.png',
                  ),
                  CustomPaymentContainer(
                    image: 'assets/images/pngs/Icon payment-cash.png',
                  ),
                ],
              ),
            ),

            // SizedBox(
            //   width: size.width / 1,
            //   height: size.width / 3,
            //   child: ListView.builder(
            //     padding: EdgeInsetsDirectional.only(end: size.width / 20),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 6,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: EdgeInsetsDirectional.only(start: size.width / 20),
            //         child: CustomBurgerType(),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
