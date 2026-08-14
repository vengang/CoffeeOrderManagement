import 'package:coffeeapp/model/cardItem.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final RxList<CartItem> orders = <CartItem>[].obs;

  void addOrders(List<CartItem> cartItems) {
    orders.addAll(cartItems);
  }

  void clearOrders() {
    orders.clear();
  }
}