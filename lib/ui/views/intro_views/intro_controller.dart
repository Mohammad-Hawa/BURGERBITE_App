import 'package:get/get.dart';

class IntroController extends GetxController {
  List<String> image = ['location', 'burger icon', 'cart'];
  List<String> title = [
    'Delivery address',
    'Customisable burger',
    'Your burger is coming'
  ];
  List<String> subtitle = [
    'Get your order without\n mooving',
    'Customize and order your own burger\n with the maker tool',
    'Complete your order and wait\n for your burger'
  ];
  RxInt index = 0.obs;
}
