import 'package:coffee_mate/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/coffee_controller.dart';
import '../../utils/constants.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});
  final coffeeController = Get.find<CoffeeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            color: Constants.backgroundColor,
            child: Column(
              children: [
                Text(
                  "Favourite",
                  style: GoogleFonts.sora(
                      fontSize: 20,
                      color: Constants.textBlack,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                //
                // ******** Coffee List **********
                Obx(() {
                  return coffeeController.favList.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "Your Favorites List is Empty! 🌟",
                                style: GoogleFonts.sora(
                                  fontSize: Get.width * 0.042,
                                  color: Constants.textBlack,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: Get.height * 0.06),
                              // const Spacer(),
                              Image.asset(
                                Constants.emptyFav,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  "Start your journey now and fill this space with your coffee treasures!",
                                  // "Looks like you haven't added any favorites yet.",
                                  style: GoogleFonts.sora(
                                    fontSize: Get.width * 0.036,
                                    color: Constants.textBlack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            mainAxisExtent: Get.width * 0.6,
                          ),
                          itemCount: coffeeController.favList.length,
                          itemBuilder: (context, index) {
                            return Custom.coffeeCard(
                                item: coffeeController.favList[index],
                                showFav: true);
                          },
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
