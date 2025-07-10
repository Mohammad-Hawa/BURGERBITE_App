import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/Qu_row.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/custom_textfield.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/imag_title.dart';
import 'package:flutter_application_1/ui/views/auth/login_view/login_view.dart';
import 'package:flutter_application_1/ui/views/auth/phonnum_view/phonenum_view.dart';

class SignupView2 extends StatefulWidget {
  const SignupView2({super.key});
  @override
  State<SignupView2> createState() => _SignupView2State();
}

class _SignupView2State extends State<SignupView2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(          resizeToAvoidBottomInset: false,

      appBar: AppBarCustom(
        istitle: true,
        title: 'SIGN UP',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageTitle(
            title1: 'Please enter your email and password',
            width: 15,
          ),
          CustomTextFormfield(
            hinttext: 'Email',
            suficon: Icons.email,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(25), bottom: screenWidth(25)),
            child: CustomTextFormfield(
              hinttext: 'Password',
              suficon: Icons.lock,
            ),
          ),
          CustomTextFormfield(
            hinttext: 'Password',
            suficon: Icons.lock,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: screenWidth(10),
            ),
            child: CustomButton(
              text: 'Sign up',
              ontap: () {
                {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PhonnumView();
                    },
                  ));
                }
                ;
              },
            ),
          ),
          Spacer(),
          QueRow(
              subtitle: ' Log in ',
              ontap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginView();
                  },
                ));
              },
              title: 'Don’t have an account'),
        ],
      ),
    ));
  }
}
