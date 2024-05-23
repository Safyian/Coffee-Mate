import 'package:badges/badges.dart' as badges;
import 'package:coffee_mate/controllers/bottomNav_controller.dart';
import 'package:coffee_mate/utils/constants.dart';
import 'package:coffee_mate/views/NavViews/cart_screen.dart';
import 'package:coffee_mate/views/NavViews/favourites_screen.dart';
import 'package:coffee_mate/views/NavViews/home_screen.dart';
import 'package:coffee_mate/views/NavViews/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/coffee_controller.dart';
import '../controllers/detail_screen_controller.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({super.key});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  final navController = Get.put(BottomNavController());
  final coffeeController = Get.put(CoffeeController());
  final detailController = Get.put(DetailScreenController());
  int selectedIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Constants.backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(24.0),
          ),
          child: Obx(() {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Constants.backgroundColor,
              elevation: 2.0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedLabelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w500),
              selectedItemColor: Constants.activeColor,
              currentIndex: navController.selectedIdx.value,
              onTap: (int index) {
                // setState(() {
                //   selectedIdx = index;
                // });
                navController.selectedIdx.value = index;
              },
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    size: 35,
                  ),
                  activeIcon: Icon(
                    Icons.favorite,
                    size: 35,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(
                  //   Icons.shopping_cart,
                  //   size: 35,
                  // ),
                  // activeIcon: Icon(
                  //   Icons.shopping_cart,
                  //   size: 35,
                  // ),
                  // label: 'My Cart',
                  icon: Obx(
                    () => detailController.myCart.isEmpty
                        ? const Icon(
                            Icons.shopping_cart,
                            size: 35,
                          )
                        : badges.Badge(
                            position:
                                badges.BadgePosition.topEnd(top: -14, end: -16),
                            showBadge: true,
                            ignorePointer: false,
                            onTap: () {},
                            badgeStyle: const badges.BadgeStyle(
                                badgeColor: Constants.activeColor),
                            badgeContent: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "${detailController.noOfItems.value}",
                                style: GoogleFonts.sora(
                                  fontSize: 14,
                                  color: Constants.textWhite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            badgeAnimation:
                                const badges.BadgeAnimation.rotation(
                              animationDuration: Duration(seconds: 1),
                              colorChangeAnimationDuration:
                                  Duration(seconds: 1),
                              loopAnimation: false,
                              curve: Curves.fastOutSlowIn,
                              colorChangeAnimationCurve: Curves.easeInCubic,
                            ),
                            child: const Icon(
                              Icons.shopping_cart,
                              size: 35,
                            ),
                          ),
                  ),
                  label: 'My Cart',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 35,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    size: 35,
                  ),
                  label: 'My Profile',
                ),
              ],
            );
          }),
        ),
      ),
      // ),
      body: Obx(() {
        return IndexedStack(
          index: navController.selectedIdx.value,
          children: [
            HomeScreen(),
            FavouritesScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        );
      }),
    );
  }
}
