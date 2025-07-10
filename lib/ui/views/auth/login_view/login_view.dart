import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/Qu_row.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/custom_textfield.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/imag_title.dart';
import 'package:flutter_application_1/ui/views/auth/forgot_password_view/forgot_password_view.dart';
import 'package:flutter_application_1/ui/views/auth/signup_View/signup_view.dart';
import 'package:flutter_application_1/ui/views/main_views/main_view.dart';
import 'package:flutter_application_1/ui/views/main_views/menu._view/menue_View.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      appBar: AppBarCustom(
        istitle: true,
        title: 'LOGIN',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenWidth(25)),
            child: ImageTitle(
                title1: 'Welcome back !', title2: 'Log in to continue '),
          ),
          CustomTextFormfield(
            hinttext: 'Name',
            suficon: Icons.person,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(25)),
            child: CustomTextFormfield(
              hinttext: 'Password',
              suficon: Icons.lock,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                end: screenWidth(4),
                top: screenWidth(20),
                bottom: screenWidth(20)),
            child: InkWell(
              onTap: () {
                Get.to(ForgotPasswordView());
              },
              child: CustomText(
                text: 'Forgot password ?',
                styleType: TextStyleType.SUBTITLE,
                textColor: AppColors.orangeColor,
              ),
            ),
          ),
          CustomButton(
              text: 'Log in',
              ontap: () {
                Get.to(MainView());
              }),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(20), bottom: screenWidth(20)),
            child: CustomText(text: 'Or log in with'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/svgs/Icon simple-facebook.svg'),
              SizedBox(
                width: screenWidth(15),
              ),
              SvgPicture.asset('assets/images/svgs/Icon simple-google.svg'),
            ],
          ),
          Spacer(),
          QueRow(
              subtitle: 'Sign up ',
              ontap: () {
                Get.to(SignUpView());
              },
              title: 'Don’t have an account'),
        ],
      ),
    ));
  }
}
