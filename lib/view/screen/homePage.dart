import 'package:coffeeapp/const/appColor.dart';
import 'package:coffeeapp/model/announcement.dart';
import 'package:coffeeapp/view/screen/menuPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlideshow(
              autoPlayInterval: 3000,
              indicatorBottomPadding: 15,
              indicatorPadding: 10,
              isLoop: true,
              initialPage: 1,

              indicatorBackgroundColor: Appcolor.surface,
              indicatorColor: Appcolor.primary,
              height: 280,
              width: double.infinity,
              children: [
                Image.asset('assets/images/slider1.png', fit: BoxFit.cover),
                Image.asset('assets/images/slider2.png', fit: BoxFit.cover),
                Image.asset('assets/images/slider3.png', fit: BoxFit.cover),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Hello UserName",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(Menupage()),
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Appcolor.primary,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text(
                          "Pick Up",
                          style: TextStyle(
                            color: Appcolor.background,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: "Coming Soon",
                        middleText:
                            "Delivery service will be available in a future update.",
                        barrierDismissible: false,
                        textConfirm: "OK",
                        confirmTextColor: Colors.white,
                        buttonColor: Appcolor.primary,
                        onConfirm: Get.back,
                      );
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Appcolor.primary,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text(
                          "Delivery",
                          style: TextStyle(
                            color: Appcolor.background,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Announcements",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.secondary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  final item = announcements[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 24),
                    elevation: 0.1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.network(
                            item.img,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(item.subtitle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*  */