import 'package:coffeeapp/const/appColor.dart';
import 'package:coffeeapp/view/screen/caradPage.dart';
import 'package:coffeeapp/view/screen/homePage.dart';
import 'package:coffeeapp/view/screen/menuPage.dart';
import 'package:coffeeapp/view/screen/orderHistoryPage.dart';
import 'package:coffeeapp/view/screen/profile_screen.dart';
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
          item: ItemConfig(
            icon: Icon(Icons.home_outlined),
            title: "Home",
            activeForegroundColor: Appcolor.primary,
          ),
        ),
        PersistentTabConfig(
          screen: Menupage(),
          item: ItemConfig(
            icon: Icon(Icons.coffee_outlined),
            title: "Menu",
            activeForegroundColor: Appcolor.primary,
          ),
        ),
        PersistentTabConfig(
          screen: CartPage(),
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart_outlined),
            title: "Cart",
            activeForegroundColor: Appcolor.primary,
          ),
        ),
        PersistentTabConfig(
          screen: OrderHistoryPage(),
          item: ItemConfig(
            icon: Icon(Icons.receipt_long_outlined),
            title: "Orders",
            activeForegroundColor: Appcolor.primary,
          ),
        ),
        PersistentTabConfig(
          screen: ProfileScreen(),

          item: ItemConfig(
            icon: Icon(Icons.person_outline),
            title: "Profile",
            activeForegroundColor: Appcolor.primary,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
