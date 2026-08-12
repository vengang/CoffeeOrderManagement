import 'package:coffeeapp/model/drinkItem.dart';

class CartItem {
  final Drinkitem item;

  final String size;
  final int sugarLevel;
  final String ice;
  final String coffee;

  final int quantity;
  final double price;

  CartItem({
    required this.item,
    required this.size,
    required this.sugarLevel,
    required this.ice,
    required this.coffee,
    required this.quantity,
    required this.price,
  });
}