import 'package:coffee_mate/views/proceed_to_checkout.dart';
import 'package:coffee_mate/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/detail_screen_controller.dart';
import '../../utils/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final detailController = Get.find<DetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      // extendBody: true,
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        elevation: 0.0,
        title: Text(
          "My Cart",
          style: GoogleFonts.sora(
              fontSize: 20,
              color: Constants.darkColor,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Constants.backgroundColor,
          child: SingleChildScrollView(
            child: Obx(() {
              return detailController.myCart.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Your Cart is Empty! 🌟",
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
                            Constants.emptyCart,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Fill up your cart and get ready to enjoy the perfect coffee experience!",
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
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ******* Cart Item Cards *********
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: detailController.myCart.length,
                            itemBuilder: (context, index) {
                              final item = detailController.myCart[index];
                              return Card(
                                color: Constants.backgroundColor,
                                child: Container(
                                  width: Get.width,
                                  height: Get.width * 0.28,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  child: Row(
                                    children: [
                                      // ************* Image **************
                                      Container(
                                        width: Get.width * 0.24,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(item.image),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      // ********** Coffee Description *******
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            6, 8, 6, 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // ****** Coffee Name ******
                                            SizedBox(
                                              width: Get.width * 0.4,
                                              child: Text(
                                                item.coffee,
                                                style: GoogleFonts.sora(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            // ******** Coffee Type & Price *****
                                            Text(
                                              item.typeSelected!,
                                              style: GoogleFonts.sora(
                                                  fontSize: 12.0,
                                                  color: Colors.black54),
                                            ),
                                            const Spacer(),
                                            Text('\$ ${item.price}',
                                                style: GoogleFonts.sora(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0XFF2F4B4E),
                                                )),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          if (item.quantity == 1) {
                                            Custom.showDialogRemoveItem(
                                                context: context, index: index);
                                          } else {
                                            detailController
                                                .decrementItemQuantity(index);
                                          }
                                        },
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          color: Constants.backgroundColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: const SizedBox(
                                            width: 36,
                                            height: 36,
                                            child: Icon(
                                              Icons.remove,
                                              color: Constants.textBlack,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(
                                          "${item.quantity}",
                                          style: GoogleFonts.sora(
                                              fontSize: 16,
                                              color: Constants.textBlack),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          detailController
                                              .incrementItemQuantity(index);
                                        },
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          color: Constants.backgroundColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: const SizedBox(
                                            width: 36,
                                            height: 36,
                                            child: Icon(
                                              Icons.add,
                                              color: Constants.textBlack,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        //
                        const SizedBox(height: 26),
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
                                "${detailController.noOfItems.value}",
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
                                "\$ ${detailController.subTotal.value}",
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
                                "\$ ${detailController.discount.value}",
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
                                "\$ ${detailController.totalPayment.value}",
                                style: GoogleFonts.sora(
                                  fontSize: 18,
                                  color: Constants.textBlack,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                        //
                        // ********** Proceed to Checkout ********
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: Get.width,
                            height: Get.width * 0.14,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Constants.activeColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () =>
                                  Get.to(() => ProceedToCheckout()),
                              child: Text(
                                "Proceed to Checkout",
                                style: GoogleFonts.sora(
                                  fontSize: Get.width * 0.045,
                                  fontWeight: FontWeight.w600,
                                  color: Constants.textWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
