import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

class CustomCon extends StatelessWidget {
  final String nametext;
  final String image;
  final double price;
  final VoidCallback? onRemove;
  final VoidCallback? onTap;

  const CustomCon({
    super.key,
    required this.nametext,
    required this.image,
    this.price = 16.50,
    this.onRemove,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
      width: screenWidth(2),
      height: screenHeight(5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          spreadRadius: 0.1,
          blurRadius: 5,
          offset: Offset(5, 5), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(25), color: AppColors.whiteColor),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: nametext,
                  styleType: TextStyleType.SUBTITLE,
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CustomText(text: '${price.toStringAsFixed(2)} \$'),
                            if (onTap != null) ...[
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: screenWidth(35),
                                color: AppColors.greycolor,
                              ),
                            ],
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: onRemove,
                          child: CustomText(
                            text: 'Remove',
                            textColor: AppColors.orangeColor,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            flex: 4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  height: screenHeight(5),
                  image,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
      ),
    );
  }
}
