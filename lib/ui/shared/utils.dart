
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
//       return Container(
//         decoration: BoxDecoration(
//             color: AppColors.blackColor.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(10)),
//         width: screenWidth(4),
//         height: screenWidth(4),
//         child: SpinKitCircle(
//           color: AppColors.orangeColor,
//           size: screenWidth(8),
//         ),
//       );
//     });

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isValidPassword(String password) {
  return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(password);
}

// Future<XFile?> chooseImage(ImageSource imageSource) async {
//   return await ImagePicker().pickImage(source: imageSource);
// }

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

// SharedPrefrenceRepository get storege => Get.find<SharedPrefrenceRepository>();

// ConnectivityService get connectivityService => Get.find<ConnectivityService>();
// Connectivity get connectivity => Get.find<Connectivity>();

// CartService get cartService => Get.find<CartService>();
// LocationService get locationService => Get.find<LocationService>();

bool isOnline = false;
