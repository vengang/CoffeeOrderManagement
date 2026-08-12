import 'package:coffeeapp/controller/cardController.dart';
import 'package:coffeeapp/model/cardItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffeeapp/model/drinkItem.dart';

class Detailcontroller extends GetxController {
  final Drinkitem item;

  Detailcontroller(this.item);

  RxnString selectedSize = RxnString();
  RxnInt selectedSugar = RxnInt();
  RxnString selectedIce = RxnString();
  RxnString selectedCoffee = RxnString();

  RxInt quantity = 1.obs;

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void selectSugar(int sugar) {
    selectedSugar.value = sugar;
  }

  void selectIce(String ice) {
    selectedIce.value = ice;
  }

  void selectCoffee(String coffee) {
    selectedCoffee.value = coffee;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  double sizePrice() {
    if (selectedSize.value == "S") {
      return item.sPrice;
    }

    if (selectedSize.value == "L") {
      return item.lPrice;
    }

    return 0;
  }

  double coffeePrice() {
    if (selectedCoffee.value == "Extra Shot") {
      return item.extraShotPrice;
    }

    return 0;
  }

  double itemPrice() {
    return sizePrice() + coffeePrice();
  }

  double totalPrice() {
    return itemPrice() * quantity.value;
  }

  bool validateSelection() {
    if (selectedSize.value == null) {
      Get.snackbar(
        "Size Required",
        "Please select a size",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return false;
    }

    if (selectedSugar.value == null) {
      Get.snackbar(
        "Sugar Level Required",
        "Please select a sugar level",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return false;
    }

    if (item.iceOptions.isNotEmpty && selectedIce.value == null) {
      Get.snackbar(
        "Ice Required",
        "Please select an ice option",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return false;
    }

    if (item.hasCoffee && selectedCoffee.value == null) {
      Get.snackbar(
        "Coffee Required",
        "Please select a coffee option",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return false;
    }

    return true;
  }

  void addToCart() {
    if (!validateSelection()) {
      return;
    }

    final cartController = Get.find<CartController>();

    final cartItem = CartItem(
      item: item,
      size: selectedSize.value!,
      sugarLevel: selectedSugar.value!,
      ice: selectedIce.value!,
      coffee: selectedCoffee.value!,
      quantity: quantity.value,
      price: itemPrice(),
    );

    cartController.addItem(cartItem);

    Get.snackbar(
      "Added to Cart",
      "${item.title} has been added to your cart",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
