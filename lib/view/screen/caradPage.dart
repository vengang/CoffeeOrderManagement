import 'package:coffeeapp/const/appColor.dart';
import 'package:coffeeapp/controller/cardController.dart';
import 'package:coffeeapp/controller/orderController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Get.put(CartController());
  final OrderController orderController = Get.put(OrderController());
  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Appcolor.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 80,
                  color: Colors.grey,
                ),

                SizedBox(height: 16),

                Text(
                  "Your cart is empty",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8),

                Text(
                  "Add some coffee to your cart",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = controller.cartItems[index];

            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          cartItem.item.img,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.item.title,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 6),

                            Text(
                              "Size: ${cartItem.size}",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),

                            Text(
                              "Sugar: ${cartItem.sugarLevel}%",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),

                            if (cartItem.ice != null)
                              Text(
                                "Ice: ${cartItem.ice}",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),

                            if (cartItem.coffee != null)
                              Text(
                                "Coffee: ${cartItem.coffee}",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          controller.removeItem(index);
                        },
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${cartItem.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Appcolor.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.decreaseQuantity(index);
                            },
                            icon: Icon(Icons.remove_circle_outline),
                          ),

                          Text(
                            "${cartItem.quantity}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              controller.increaseQuantity(index);
                            },
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),

      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) {
          return SizedBox.shrink();
        }

        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
          ),

          child: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),

                      Text(
                        "\$${controller.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Appcolor.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolor.primary,
                        ),
                        onPressed: () {
                          Get.bottomSheet(
                            StatefulBuilder(
                              builder: (context, setBottomSheetState) {
                                return buildBottomSheet(setBottomSheetState);
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildBottomSheet(StateSetter setBottomSheetState) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 15),

          // Cash
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text("Cash"),
            subtitle: const Text("Pay when you pick up"),
            trailing: Radio<int>(
              value: 0,
              groupValue: selectedPayment,
              activeColor: Appcolor.primary,
              onChanged: (value) {
                setBottomSheetState(() {
                  selectedPayment = value!;
                });
              },
            ),
            onTap: () {
              setBottomSheetState(() {
                selectedPayment = 0;
              });
            },
          ),

          // ABA
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text("ABA"),
            subtitle: const Text("Pay with ABA Mobile"),
            trailing: Radio<int>(
              value: 1,
              groupValue: selectedPayment,
              activeColor: Appcolor.primary,
              onChanged: (value) {
                setBottomSheetState(() {
                  selectedPayment = value!;
                });
              },
            ),
            onTap: () {
              setBottomSheetState(() {
                selectedPayment = 1;
              });
            },
          ),

          // KHQR
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text("KHQR"),
            subtitle: const Text("Scan QR code to pay"),
            trailing: Radio<int>(
              value: 2,
              groupValue: selectedPayment,
              activeColor: Appcolor.primary,
              onChanged: (value) {
                setBottomSheetState(() {
                  selectedPayment = value!;
                });
              },
            ),
            onTap: () {
              setBottomSheetState(() {
                selectedPayment = 2;
              });
            },
          ),
          SizedBox(height: 8),

          // pay now
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Appcolor.primary),
            onPressed: () {
              Get.back();
              Get.dialog(
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/done.gif',
                        width: 180,
                        height: 180,
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Verifying Payment...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                barrierDismissible: false,
                barrierColor: Colors.black54,
              );

              Future.delayed(const Duration(seconds: 2), () {
                if (Get.isDialogOpen ?? false) {
                  Get.back();
                }

                Get.dialog(
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/done.gif',
                          width: 180,
                          height: 180,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),

                  barrierDismissible: false,
                  barrierColor: Colors.black54,
                );

                Future.delayed(Duration(seconds: 1), () {
                  if (Get.isDialogOpen ?? false) {
                    Get.back();
                  }
                  // Save
                  orderController.addOrders(List.from(controller.cartItems));

                  controller.cartItems.clear();
                });
              });
            },
            child: Text(
              "Pay Now",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
