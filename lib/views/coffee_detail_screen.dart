import 'package:coffee_mate/controllers/bottomNav_controller.dart';
import 'package:coffee_mate/controllers/coffee_controller.dart';
import 'package:coffee_mate/controllers/detail_screen_controller.dart';
import 'package:coffee_mate/models/coffee_model.dart';
import 'package:coffee_mate/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final Item coffee;
  final bool isFav;
  CoffeeDetailScreen({super.key, required this.coffee, required this.isFav});

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  final detailController = Get.find<DetailScreenController>();
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    // detailController.typeSelected.value = widget.coffee.type.first;
    if (widget.isFav == true) {
      setState(() {
        isFav = true;
      });
    } else {
      bool check = Get.find<CoffeeController>()
          .favList
          .any((item) => item.coffee == widget.coffee.coffee);
      setState(() {
        isFav = check;
      });
    }
    // Use post frame callback to update reactive variable
    WidgetsBinding.instance.addPostFrameCallback((_) {
      detailController.typeSelected.value = widget.coffee.type.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Container(
          width: Get.width,
          height: Get.height * 0.1,
          color: Constants.backgroundColor,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Price",
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Constants.textBlack.withOpacity(0.6),
                        )),
                    Text("\$ ${widget.coffee.price}",
                        style: GoogleFonts.sora(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Constants.textBlack,
                        )),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: GestureDetector(
                  onTap: () {
                    int qty = 0;
                    bool itemExists = false;

                    for (var element in detailController.myCart) {
                      if (element.coffee == widget.coffee.coffee) {
                        itemExists = true;
                        int index = detailController.myCart.indexOf(element);
                        detailController.myCart[index].quantity =
                            (detailController.myCart[index].quantity ?? 0) + 1;
                        detailController.paymentSummary();
                        break; // Exit the loop since we found the item
                      }
                      detailController.paymentSummary();
                    }

                    if (!itemExists) {
                      qty = 1;
                      Item item = Item(
                        image: widget.coffee.image,
                        coffee: widget.coffee.coffee,
                        beans: widget.coffee.beans,
                        type: widget.coffee.type,
                        price: widget.coffee.price,
                        rating: widget.coffee.rating,
                        description: widget.coffee.description,
                        sizes: widget.coffee.sizes,
                        selectedSize: detailController.sizeSelection.value,
                        quantity: qty,
                        typeSelected: detailController.typeSelected.value,
                      );
                      detailController.myCart.add(item);
                      detailController.paymentSummary();
                    }

                    detailController.typeSelected.value =
                        widget.coffee.type.first;
                    detailController.sizeSelection.value = 0;
                    Get.find<BottomNavController>().selectedIdx.value = 2;
                    Get.back();
                  },
                  child: Container(
                    width: Get.width * 0.45,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Constants.activeColor),
                    alignment: Alignment.center,
                    child: Text("Add to Cart",
                        style: GoogleFonts.sora(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Constants.textWhite,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Detail",
          style: GoogleFonts.sora(
              fontSize: 20,
              color: Constants.darkColor,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: GestureDetector(
              onTap: () {
                if (isFav == false) {
                  Get.find<CoffeeController>().favList.add(widget.coffee);
                } else {
                  Get.find<CoffeeController>().favList.remove(widget.coffee);
                }

                setState(() {
                  isFav = !isFav;
                });
              },
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                // *********** Coffee Image ********
                Container(
                  width: Get.width,
                  height: Get.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        widget.coffee.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                // ************ Name *********
                Text(widget.coffee.coffee,
                    style: GoogleFonts.sora(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Constants.textBlack,
                    )),

                // ************ type *********
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(() {
                      return Text("with ${detailController.typeSelected.value}",
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Constants.textBlack.withOpacity(0.6),
                          ));
                    }),
                    // Popup Menu for Coffee Type
                    PopupMenuButton(
                      color: Constants.activeColor,
                      icon: const Icon(
                        Icons.expand_circle_down,
                        color: Constants.activeColor,
                        size: 26,
                      ),
                      onSelected: (value) {
                        detailController.typeSelected.value = value;
                      },
                      itemBuilder: (BuildContext bc) {
                        return widget.coffee.type.map((String type) {
                          return PopupMenuItem(
                            value: type,
                            child: Text(
                              type,
                              style: GoogleFonts.sora(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Constants.textWhite,
                              ),
                            ),
                          );
                        }).toList();
                      },
                    )
                  ],
                ),

                // ************ Rating *********
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 26,
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 4)),
                      TextSpan(
                          text: widget.coffee.rating,
                          style: GoogleFonts.sora(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Constants.textBlack,
                          )),
                      const WidgetSpan(child: SizedBox(width: 4)),
                      TextSpan(
                          text: "(230)",
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            // fontWeight: FontWeight.w600,
                            color: Constants.textBlack.withOpacity(0.6),
                          )),
                    ],
                  ),
                ),
                //
                const Divider(height: 20),
                // *********** Coffee Description *********
                ReadMoreText(
                  widget.coffee.description,
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read Less',
                  moreStyle: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Constants.activeColor,
                  ),
                  lessStyle: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Constants.activeColor,
                  ),
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Constants.textBlack,
                  ),
                ),
                //
                const SizedBox(height: 6),
                // ******** Size *******
                Text("Size",
                    style: GoogleFonts.sora(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Constants.textBlack,
                    )),
                const SizedBox(height: 8),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: Get.width * 0.12,
                    ),
                    itemCount: widget.coffee.sizes.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        return GestureDetector(
                          onTap: () =>
                              detailController.sizeSelection.value = index,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: detailController.sizeSelection.value ==
                                          index
                                      ? Constants.activeColor
                                      : Colors.grey),
                              color:
                                  detailController.sizeSelection.value == index
                                      ? Constants.activeColor.withOpacity(0.2)
                                      : Constants.backgroundColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              widget.coffee.sizes[index],
                              style: GoogleFonts.sora(
                                  color: detailController.sizeSelection.value ==
                                          index
                                      ? Constants.activeColor
                                      : Constants.textBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      });
                    }),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
