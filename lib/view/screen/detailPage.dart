import 'package:coffeeapp/const/appColor.dart';
import 'package:coffeeapp/controller/detailController.dart';
import 'package:coffeeapp/model/drinkItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detailpage extends StatelessWidget {
  final Drinkitem item;

  const Detailpage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Detailcontroller(item), tag: item.title);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          item.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total"),
                  Obx(
                    () => Text(
                      "\$${controller.totalPrice().toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Appcolor.primary,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolor.primary,
                ),
                onPressed: () {
                  if (controller.validateSelection()) {
                    controller.addToCart();
                  }
                },
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                label: Text(
                  "Add To Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(item.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              item.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),
            Text(
              item.description,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
            ),

            SizedBox(height: 25),

            buildSectionTitle("Size"),
            Obx(
              () => Wrap(
                spacing: 10,
                children: ["S", "L"].map((size) {
                  bool selected = controller.selectedSize.value == size;

                  return ChoiceChip(
                    label: Text(
                      size,
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: selected,
                    selectedColor: Appcolor.primary,
                    showCheckmark: false,
                    onSelected: (value) {
                      controller.selectSize(size);
                    },
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 20),

            buildSectionTitle("Sugar Level"),

            Obx(
              () => Wrap(
                spacing: 10,
                children: item.sugarLevels.map((sugar) {
                  bool selected = controller.selectedSugar.value == sugar;

                  return ChoiceChip(
                    label: Text(
                      "$sugar%",
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: selected,
                    selectedColor: Appcolor.primary,
                    showCheckmark: false,
                    onSelected: (value) {
                      controller.selectSugar(sugar);
                    },
                  );
                }).toList(),
              ),
            ),
            if (item.iceOptions.isNotEmpty) ...[
              SizedBox(height: 20),

              buildSectionTitle("Ice"),

              Obx(
                () => Wrap(
                  spacing: 10,
                  children: item.iceOptions.map((ice) {
                    bool selected = controller.selectedIce.value == ice;

                    return ChoiceChip(
                      label: Text(
                        ice,
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.black,
                        ),
                      ),
                      selected: selected,
                      selectedColor: Appcolor.primary,
                      showCheckmark: false,
                      onSelected: (value) {
                        controller.selectIce(ice);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],

            if (item.hasCoffee) ...[
              SizedBox(height: 20),

              buildSectionTitle("Coffee"),

              Obx(
                () => Wrap(
                  spacing: 10,
                  children: ["Less", "Normal", "Extra Shot"].map((coffee) {
                    bool selected = controller.selectedCoffee.value == coffee;

                    return ChoiceChip(
                      label: Text(
                        coffee,
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.black,
                        ),
                      ),
                      selected: selected,
                      selectedColor: Appcolor.primary,
                      showCheckmark: false,
                      onSelected: (value) {
                        controller.selectCoffee(coffee);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],

            SizedBox(height: 25),

            buildSectionTitle("Quantity"),

            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.decreaseQuantity();
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),

                    Text(
                      "${controller.quantity.value}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        controller.increaseQuantity();
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),

                    Spacer(),

                    Text(
                      "\$${controller.itemPrice().toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Appcolor.primary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
