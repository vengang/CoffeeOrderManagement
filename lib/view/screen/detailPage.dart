import 'package:coffeeapp/const/appColor.dart';
import 'package:coffeeapp/model/drinkItem.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  final Drinkitem item;

  const Detailpage({super.key, required this.item});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.item.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
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
                  const Text("Total"),
                  Text(
                    "\$${widget.item.sPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Appcolor.primary,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
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
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                label: const Text(
                  "Add To Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(widget.item.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.item.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              widget.item.description,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
            ),

            const SizedBox(height: 25),

            buildSectionTitle("Size"),

            Wrap(
              spacing: 10,
              children: const [
                Chip(label: Text("S")),
                Chip(label: Text("L")),
                Chip(label: Text("XL")),
              ],
            ),

            const SizedBox(height: 20),

            buildSectionTitle("Sugar Level"),

            Wrap(
              spacing: 10,
              children: const [
                Chip(label: Text("0%")),
                Chip(label: Text("25%")),
                Chip(label: Text("50%")),
                Chip(label: Text("75%")),
                Chip(label: Text("100%")),
              ],
            ),

            const SizedBox(height: 20),

            buildSectionTitle("Ice"),

            Wrap(
              spacing: 10,
              children: const [
                Chip(label: Text("Less")),
                Chip(label: Text("Normal")),
                Chip(label: Text("Separate")),
              ],
            ),

            if (widget.item.hasCoffee) ...[
              const SizedBox(height: 20),

              buildSectionTitle("Coffee"),

              Wrap(
                spacing: 10,
                children: const [
                  Chip(label: Text("Less")),
                  Chip(label: Text("Normal")),
                  Chip(label: Text("Extra Shot")),
                ],
              ),
            ],

            const SizedBox(height: 25),

            buildSectionTitle("Quantity"),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),

                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),

                  const Spacer(),

                  Text(
                    "\$${(widget.item.sPrice * quantity).toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Appcolor.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
