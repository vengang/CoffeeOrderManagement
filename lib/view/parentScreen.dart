import 'package:coffeeapp/view/screen/caradPage.dart';
import 'package:coffeeapp/view/screen/homePage.dart';
import 'package:coffeeapp/view/screen/menuPage.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Parentscreen extends StatelessWidget {
  const Parentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: Homepage(),
          item: ItemConfig(icon: Icon(Icons.home_outlined), title: "Home"),
        ),
        PersistentTabConfig(
          screen: Menupage(),
          item: ItemConfig(icon: Icon(Icons.coffee_outlined), title: "Menu"),
        ),
        PersistentTabConfig(
          screen: CartPage(),
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart_outlined),
            title: "Cart",
          ),
        ),
        PersistentTabConfig(
          screen: Homepage(),
          item: ItemConfig(
            icon: Icon(Icons.receipt_long_outlined),
            title: "Orders",
          ),
        ),
        PersistentTabConfig(
          screen: Homepage(),
          item: ItemConfig(icon: Icon(Icons.person_outline), title: "Profile"),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
