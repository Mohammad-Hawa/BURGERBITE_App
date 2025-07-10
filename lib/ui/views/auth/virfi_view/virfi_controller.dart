import 'dart:async';

import 'package:get/get.dart';

class VirfiController extends GetxController {
  var sec = 180.obs; // استخدام Rx لتخزين الوقت المتبقي
  Timer? count;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    count?.cancel(); // تأكد من إيقاف المؤقت عند إغلاق الـ Controller
    super.onClose();
  }




 void startTimer() {
    count = Timer.periodic(Duration(seconds: 1), (timer) {
      if (sec.value > 0) {
        sec.value--; // تحديث الوقت
      } else {
        timer.cancel(); // إيقاف المؤقت عند الوصول إلى 0
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minStr = minutes.toString().padLeft(2, '0');
    String secStr = remainingSeconds.toString().padLeft(2, '0');

    return "$minStr:$secStr";
  }
}
