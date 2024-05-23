import 'package:coffee_mate/controllers/detail_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order History",
          style: GoogleFonts.sora(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Constants.backgroundColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() {
              return Get.find<DetailScreenController>().showOrder.isTrue
                  ? SizedBox(
                      width: Get.width,
                      height: Get.width * 0.36,
                      child: Card(
                        elevation: 0.5,
                        color: Constants.backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Order no. 103",
                                    style: GoogleFonts.sora(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.grey[600]!),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 26, vertical: 8),
                                    child: Text(
                                      "Details",
                                      style: GoogleFonts.sora(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Text(
                                "Quantity:     3",
                                style: GoogleFonts.sora(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  Text(
                                    "Total:     \$3.38",
                                    style: GoogleFonts.sora(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const Spacer(),
                                  //
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Status:",
                                            style: GoogleFonts.sora(
                                              fontSize: 16,
                                              color: Colors.grey[600],
                                            )),
                                        const WidgetSpan(
                                            child: SizedBox(width: 8)),
                                        TextSpan(
                                            text: "Delivered",
                                            style: GoogleFonts.sora(
                                              fontSize: 16,
                                              color: Colors.green[900],
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "History record is empty! 🌟",
                            style: GoogleFonts.sora(
                              fontSize: Get.width * 0.042,
                              color: Constants.textBlack,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: Get.height * 0.06),
                          // const Spacer(),
                          Image.asset(
                            Constants.emptyCart,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Order now to enjoy perfect coffee experience!",
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
                    );
            }),
            // ********* Order Card *******
          ],
        ),
      ),
    );
  }
}
