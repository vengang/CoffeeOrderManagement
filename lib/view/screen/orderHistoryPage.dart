import 'package:coffeeapp/const/appColor.dart';
import 'package:coffeeapp/controller/orderController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryPage extends StatelessWidget {
  OrderHistoryPage({super.key});

  final OrderController controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order History",
          style: TextStyle(
            color: Appcolor.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Obx(() {
        if (controller.orders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt_long_outlined, size: 80, color: Colors.grey),

                SizedBox(height: 16),

                Text(
                  "No orders yet",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      order.item.img,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 12),

                  // Product info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.item.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Size: ${order.size}",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),

                        Text(
                          "Sugar: ${order.sugarLevel}%",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),

                        if (order.ice != null)
                          Text(
                            "Ice: ${order.ice}",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),

                        if (order.coffee != null)
                          Text(
                            "Coffee: ${order.coffee}",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),

                        const SizedBox(height: 6),

                        Text(
                          "Quantity: ${order.quantity}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // Price
                  Text(
                    "\$${(order.price * order.quantity).toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Appcolor.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
