import 'package:get/get.dart';

enum OrderStatus { received, onTheWay, delivered }

class OrderStatusController extends GetxController {
  var orderStatus = OrderStatus.received.obs;
  var receivedTime = "10:00 am, 14 July 2020";
  var onTheWayTime = "10:10 am, 14 July 2020";
  var deliveredTime = "Finished, 14 July 2020";

  void updateOrderStatus(OrderStatus status) {
    orderStatus.value = status;
  }
}
