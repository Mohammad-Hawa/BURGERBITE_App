import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_payment.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/new_method_view/new_methods_controller.dart';
import 'package:get/get.dart';

class NewMethodView extends StatefulWidget {
  const NewMethodView({super.key});

  @override
  State<NewMethodView> createState() => _NewMethodViewState();
}

class _NewMethodViewState extends State<NewMethodView> {
  NewMethodsController controller = Get.put(NewMethodsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarCustom(
        onTap: () {},
        istitle: true,
        title: 'Payment methods',
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: screenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText(
                text: 'New method',
                styleType: TextStyleType.TITLE,
                fontWeight: FontWeight.normal),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  controller.image.length,
                  (index) {
                    return ToggleButtons(
                      selectedBorderColor: AppColors.orangeColor,
                      borderRadius: BorderRadius.circular(5),
                      children: [
                        Image.asset(
                          '${controller.image[index]}',
                          width: screenWidth(8),
                        ),
                      ],
                      isSelected: [true],
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
