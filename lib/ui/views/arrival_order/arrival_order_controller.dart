import 'package:get/get.dart';

class ArrivalOrderController extends GetxController {
  // المتغير الذي يحفظ الوقت الذي استغرقه وصول الطلب (بالثواني)
  var arrivalTimeInSeconds = 0.obs;

  // دالة لضبط الوقت
  void setArrivalTime(int seconds) {
    arrivalTimeInSeconds.value = seconds;
  }
}
