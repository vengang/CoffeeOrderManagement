
import 'package:coffeeapp/model/cardItem.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  void addItem(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  void increaseQuantity(int index) {
    final oldItem = cartItems[index];

    cartItems[index] = CartItem(
      item: oldItem.item,
      size: oldItem.size,
      sugarLevel: oldItem.sugarLevel,
      ice: oldItem.ice,
      coffee: oldItem.coffee,
      quantity: oldItem.quantity + 1,
      price: oldItem.price,
    );
  }

  void decreaseQuantity(int index) {
    final oldItem = cartItems[index];

    if (oldItem.quantity > 1) {
      cartItems[index] = CartItem(
        item: oldItem.item,
        size: oldItem.size,
        sugarLevel: oldItem.sugarLevel,
        ice: oldItem.ice,
        coffee: oldItem.coffee,
        quantity: oldItem.quantity - 1,
        price: oldItem.price,
      );
    }
  }

  double get totalPrice {
    double total = 0;

    for (var cartItem in cartItems) {
      total += cartItem.price * cartItem.quantity;
    }

    return total;
  }

  void clearCart() {
    cartItems.clear();
  }
}

