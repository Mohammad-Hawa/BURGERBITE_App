import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

class CustomCartd extends StatelessWidget {
  final String numburger;
  final Function deletbutton;
  final Function additembutton;
  final Function removitembutton;

  final String pric;
  final String nameburger;
  const CustomCartd(
      {super.key,
      required this.numburger,
      required this.pric,
      required this.nameburger,
      required this.deletbutton,
      required this.additembutton,
      required this.removitembutton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(2),
      height: screenHeight(7),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          spreadRadius: 0.1,
          blurRadius: 5,
          offset: Offset(5, 5), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(15), color: AppColors.whiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(text: nameburger),
              CustomText(text: pric),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              removitembutton();
                            },
                            child: Icon(
                              Icons.remove,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.orangeColor),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: screenWidth(35), end: screenWidth(35)),
                          child: CustomText(text: numburger),
                        ),
                        InkWell(
                          onTap: () {
                            additembutton();
                          },
                          child: Container(
                            child: Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.orangeColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    deletbutton();
                  },
                  child: CustomText(
                    text: 'Remove',
                    textColor: AppColors.orangeColor,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
