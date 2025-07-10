import 'package:flutter_application_1/ui/views/getready_view/get_ready_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3)).then((value) => Get.to(GetReady()));
    super.onInit();
  }
}
