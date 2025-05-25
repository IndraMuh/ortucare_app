import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ortucare/models/food_model.dart';
import 'package:ortucare/models/user_login.dart';
import 'package:ortucare/pages/class_page.dart';

import 'package:ortucare/widgets/bottom_nav.dart';
import 'package:ortucare/widgets/const.dart';
import 'package:ortucare/widgets/food_carousel.dart';
import '../models/slide_model.dart';

class HomePageOrtu extends StatefulWidget {
  const HomePageOrtu({super.key});

  @override
  State<HomePageOrtu> createState() => _HomePageOrtuState();
}

class _HomePageOrtuState extends State<HomePageOrtu> {
  SlideController slide = SlideController();
  FoodController _controller = FoodController();
  UserLogin userLogin = UserLogin();
  String? username;

  getUserLogin() async {
    var user = await userLogin.getUserLogin();
    if (user.status != false) {
      setState(() {
        username = user.username;
      });
    }
  }

  List? slider;
  int currentIndex = 1;

  late PageController controller;
  double pageoffSet = 1;

  @override
  void initState() {
    super.initState();
    getUserLogin();
    slider = slide.slide;
    controller = PageController(
      initialPage: 1,
      viewportFraction: 1.1,
    )..addListener(() {
        setState(() {
          pageoffSet = controller.page!;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenWidth * 0.2),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Mother $username",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kenzie is a good boy today",
                      style: TextStyle(
                        fontSize: screenWidth * 0.031,
                        color: pinkTua,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  margin: EdgeInsets.only(right: screenWidth * 0.02),
                  child: Image.asset(
                    'assets/bar.png', // Ganti path gambar sesuai kebutuhan
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Title
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.06),
            child: Text(
              "Video & Article Today",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Carousel
          SizedBox(
            height: screenWidth * 1.1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index % slide.slide.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    double angle = (controller.position.haveDimensions
                            ? index.toDouble() - (controller.page ?? 0)
                            : index.toDouble() - 1) *
                        5;
                    angle = angle.clamp(-5, 5);
                    final sliderItem = slide.slide[index % slide.slide.length];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ClassPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                        child: Transform.rotate(
                          angle: angle * pi / 90,
                          child: Hero(
                            tag: sliderItem.poster,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/${sliderItem.poster}',
                                    height: screenWidth * 0.8,
                                    width: screenWidth,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: screenWidth * 0.5,
                                    child: Container(
                                      width: screenWidth * 0.9,
                                      height: screenWidth * 0.3,
                                      color: Colors.black.withOpacity(0.5),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            sliderItem.hook,
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            sliderItem.hook_desc,
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.037,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: slide.slide.length,
                ),
                // Dots Indicator
                Positioned(
                  top: screenWidth * 0.9,
                  child: Row(
                    children: List.generate(
                      slide.slide.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: currentIndex == index ? 30 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? pinkTua
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.06),
            child: Text(
              "Recomendation Food",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FoodCarousel(foodList: _controller.food)
        ],
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }
}
