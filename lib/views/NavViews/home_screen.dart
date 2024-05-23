import 'package:coffee_mate/views/coffee_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/coffee_controller.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categoryList = [
    'Cappuccino',
    'Macchiato',
    'Latte',
    'Americano',
    'Mocca'
  ];
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Header Tile
                Container(
                  width: Get.width,
                  height: Get.height * 0.4,
                  color: Constants.lightColor,
                  child: Stack(
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height * 0.3,
                        color: Constants.darkColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              //
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Location Text
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Location",
                                        style: GoogleFonts.sora(
                                          fontSize: Get.width * 0.032,
                                          fontWeight: FontWeight.w600,
                                          color: Constants.textGreyLight,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "17 Wynyard, NSW ",
                                              style: GoogleFonts.sora(
                                                fontSize: Get.width * 0.032,
                                                fontWeight: FontWeight.w600,
                                                color: Constants.textWhite,
                                              ),
                                            ),
                                            const WidgetSpan(
                                              child: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Constants.lightColor,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  // Profile Image
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            Constants.profileImage,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.04 * Get.height),
                              // Search Text Field
                              SizedBox(
                                width: Get.width * 0.9,
                                child: TextFormField(
                                  decoration: inputDecoration.copyWith(
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Constants.lightColor,
                                    ),
                                    fillColor: const Color(0XFF313131),
                                    hintText: "Search Coffee",
                                    hintStyle: GoogleFonts.sora(
                                        color: Constants.lightColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Promo
                      promoCard(),
                    ],
                  ),
                ),
                //
                // ********* Category chips *********
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: SizedBox(
                    height: 60,
                    child: Obx(() {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: coffeeController.coffeeList.length,
                          itemBuilder: (context, index) {
                            var item = coffeeController.coffeeList[index];
                            return Padding(
                              padding: EdgeInsets.fromLTRB(
                                  index == 0 ? 24 : 4, 4, 4, 4),
                              child: Obx(() {
                                return GestureDetector(
                                  onTap: () => coffeeController
                                      .selectedChip.value = index,
                                  child: Card(
                                    elevation: 0.5,
                                    color:
                                        coffeeController.selectedChip.value ==
                                                index
                                            ? Constants.activeColor
                                            : Constants.lightColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 14),
                                      child: Text(
                                        item.type,
                                        style: GoogleFonts.sora(
                                          fontSize: 18,
                                          color: coffeeController
                                                      .selectedChip.value ==
                                                  index
                                              ? Constants.textWhite
                                              : Constants.textBlack,
                                        ),
                                      ),
                                    ),
                                    // side: BorderSide.none,
                                  ),
                                );
                              }),
                            );
                          });
                    }),
                  ),
                ),
                // ******** Coffee List **********
                Obx(() {
                  return coffeeController.coffeeList.isEmpty
                      ? const SizedBox()
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
                          itemCount: coffeeController
                              .coffeeList[coffeeController.selectedChip.value]
                              .items
                              .length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                bool check = Get.find<CoffeeController>()
                                    .favList
                                    .any((item) =>
                                        item.coffee ==
                                        coffeeController
                                            .coffeeList[coffeeController
                                                .selectedChip.value]
                                            .items[index]
                                            .coffee);
                                Get.to(() => CoffeeDetailScreen(
                                      coffee: coffeeController
                                          .coffeeList[coffeeController
                                              .selectedChip.value]
                                          .items[index],
                                      isFav: check,
                                    ));
                              },
                              child: Custom.coffeeCard(
                                  item: coffeeController
                                      .coffeeList[
                                          coffeeController.selectedChip.value]
                                      .items[index]),
                            );
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

Widget promoCard() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 4),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: Get.width,
        height: Get.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: const DecorationImage(
            image: AssetImage(Constants.promoImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Promo',
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: Get.width * 0.62,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 20,
                      color: Constants.darkColor,
                    ),
                  ),
                  Text(
                    'Buy one get one',
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: Get.width * 0.18,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 20,
                      color: Constants.darkColor,
                    ),
                  ),
                  Text(
                    'Free',
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
