import 'package:coffee_mate/controllers/detail_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import '../widgets/custom_widgets.dart';

class ProceedToCheckout extends StatefulWidget {
  const ProceedToCheckout({super.key});

  @override
  State<ProceedToCheckout> createState() => _ProceedToCheckoutState();
}

class _ProceedToCheckoutState extends State<ProceedToCheckout> {
  final controller = Get.find<DetailScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Check Out",
          style: GoogleFonts.sora(
              fontSize: 20,
              color: Constants.darkColor,
              fontWeight: FontWeight.w500),
        ),
      ),
      //
      // ******** Pay Now ******
      persistentFooterButtons: <Widget>[
        // ********* Pay Now *********
        const SizedBox(height: 8),
        Center(
          child: GestureDetector(
            onTap: () {
              controller.myCart.clear();
              Get.back();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(
                    title: "Success",
                    description: "Order has been placed.\nOrder no. 103",
                    buttonText: "Okay",
                  );
                },
              );
            },
            child: Container(
              width: Get.width * 0.85,
              height: Get.width * 0.12,
              decoration: BoxDecoration(
                color: controller.tab.value == 0
                    ? Constants.activeColor
                    : const Color(0XFFf2f2f2),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                "Order Now",
                style: GoogleFonts.sora(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: controller.tab.value == 0
                        ? Constants.textWhite
                        : Constants.textBlack),
              ),
            ),
          ),
        ),
      ],
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              // ********** Deliver Option Tab Buttons *******
              Container(
                width: Get.width,
                height: Get.width * 0.16,
                decoration: BoxDecoration(
                  color: const Color(0xFFf2f2f2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.tab.value = 0;
                        },
                        child: Container(
                          width: Get.width * 0.42,
                          height: Get.width * 0.12,
                          decoration: BoxDecoration(
                            color: controller.tab.value == 0
                                ? Constants.activeColor
                                : const Color(0XFFf2f2f2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Deliver",
                            style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: controller.tab.value == 0
                                    ? Constants.textWhite
                                    : Constants.textBlack),
                          ),
                        ),
                      );
                    }),
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.tab.value = 1;
                        },
                        child: Container(
                          width: Get.width * 0.42,
                          height: Get.width * 0.12,
                          decoration: BoxDecoration(
                            color: controller.tab.value == 1
                                ? Constants.activeColor
                                : const Color(0XFFf2f2f2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Pick Up",
                            style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: controller.tab.value == 1
                                    ? Constants.textWhite
                                    : Constants.textBlack),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //
              // ************** Address ***********
              Obx(() {
                return Text(
                  controller.tab.value == 0
                      ? "Delivery Address"
                      : "Counter no. 3",
                  style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Constants.textBlack),
                );
              }),
              const SizedBox(height: 12),
              //
              // ********* Name & Address ********
              Text(
                "John Gobbler",
                style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Constants.textBlack),
              ),
              const SizedBox(height: 4),
              Obx(() {
                return Text(
                  controller.tab.value == 0
                      ? "17 o’Connnel Street, Wynyard, NSW"
                      : "Order no. 106",
                  style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                );
              }),
              const SizedBox(height: 20),
              Row(
                children: [
                  Obx(() {
                    return controller.tab.value == 1
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Constants.backgroundColor,
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(color: Constants.darkColor)),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 6),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.edit_location_outlined,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Edit Address",
                                    style: GoogleFonts.sora(
                                        fontSize: 12,
                                        color: Constants.textBlack),
                                  ),
                                ],
                              ),
                            ),
                          );
                  }),
                  Container(
                    decoration: BoxDecoration(
                        color: Constants.backgroundColor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Constants.darkColor)),
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit_note_sharp,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Add Notes",
                          style: GoogleFonts.sora(
                              fontSize: 12, color: Constants.textBlack),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 30),
              // ******* Add Coupon Button ********
              Obx(() {
                return controller.discountApplied.isTrue
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.add,
                            color: Constants.activeColor,
                          ), // The icon
                          label: Text(
                            'Add Coupon',
                            style: GoogleFonts.sora(
                              color: Constants.textBlack,
                              fontSize: 12,
                            ),
                          ), // The text
                          onPressed: () {
                            buildShowModalBottomSheet(context);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12.0),
                              elevation: 0.0,
                              backgroundColor: Constants
                                  .backgroundColor // Padding inside the button// Text style
                              ),
                        ),
                      );
              }),
              //
              // ******** Line Items ********
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.myCart.length,
                  itemBuilder: (context, index) {
                    final item = controller.myCart[index];
                    return Card(
                      color: Constants.backgroundColor,
                      child: Container(
                        width: Get.width,
                        height: Get.width * 0.24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Row(
                          children: [
                            // ************* Image **************
                            Container(
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(item.image),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            // ********** Coffee Description *******
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 6, 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ****** Coffee Name ******
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      item.coffee,
                                      style: GoogleFonts.sora(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // ******** Coffee Type & Price *****
                                  Text(
                                    item.typeSelected!,
                                    style: GoogleFonts.sora(
                                        fontSize: 12.0, color: Colors.black54),
                                  ),
                                  const Spacer(),
                                  Text('\$ ${item.price}',
                                      style: GoogleFonts.sora(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0XFF2F4B4E),
                                      )),
                                  const Spacer(),
                                ],
                              ),
                            ),
                            // ********* Quantity *******
                            const Spacer(),
                            Text(
                              "${item.quantity}x",
                              style: GoogleFonts.sora(
                                fontSize: 16.0,
                                color: Constants.textBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 20),
              // ********* Discount Applied Tile *******
              Obx(() {
                return controller.discountApplied.isTrue
                    ? Container(
                        width: Get.width,
                        height: Get.width * 0.12,
                        decoration: BoxDecoration(
                            color: Constants.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Constants.darkColor)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Image.asset(
                                Constants.discount,
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                "Discount Applied",
                                style: GoogleFonts.sora(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () =>
                                    controller.discountApplied.value = false,
                                child: const Icon(
                                  Icons.close,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox();
              }),
              const SizedBox(height: 16),
              // ********** Payment Summary ********
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Payment Summary",
                  style: GoogleFonts.sora(
                    fontSize: 18,
                    color: Constants.textBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // ******** No. of Items *******
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      "Item",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        color: Constants.textBlack,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${controller.noOfItems.value}",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        color: Constants.textBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              // ******** Sub Total *******
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      "Subtotal",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        color: Constants.textBlack,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$ ${controller.subTotal.value}",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        color: Constants.textBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              // ******** Sub Total *******
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      "Discount",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        color: Constants.textBlack,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$ ${controller.discount.value}",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        color: Constants.textBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
                height: 50,
              ),
              // ******** Total Payment *******
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      "Total Payment",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        color: Constants.textBlack,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$ ${controller.totalPayment.value}",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        color: Constants.textBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              //
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 46),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apply Coupon Code',
                style: GoogleFonts.sora(
                  color: Constants.textBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: "VWS10"),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Coupon Code',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: Get.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    controller.discountApplied.value = true;
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.activeColor),
                  child: Text(
                    'Apply',
                    style: GoogleFonts.sora(
                      color: Constants.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
