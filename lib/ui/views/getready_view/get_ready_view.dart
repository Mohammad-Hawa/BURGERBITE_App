import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/intro_views/intro_views.dart';

class GetReady extends StatelessWidget {
  const GetReady({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/pngs/pablo-merchan-montes-hyIE90CN6b0-unsplash.jpg',
            fit: BoxFit.fitHeight,
            height: screenHeight(1),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsetsDirectional.only(bottom: screenWidth(15)),
              child: CustomButton(
                text: 'Hungry ? Get a bite',
                bordereadius: 25,
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return IntroViews();
                    },
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
