import 'package:coffee_mate/controllers/coffee_controller.dart';
import 'package:coffee_mate/controllers/detail_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../models/coffee_model.dart';
import '../utils/constants.dart';

class Custom {
  static Widget coffeeCard({required Item item, bool showFav = false}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.5,
      color: Constants.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: Get.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.amber,
                    ),
                    Text(
                      item.rating,
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Constants.textWhite,
                      ),
                    ),
                    const Spacer(),
                    showFav == false
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              Get.find<CoffeeController>().favList.remove(item);
                            },
                            child: const Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.red,
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Text(
              item.coffee,
              style:
                  GoogleFonts.sora(fontSize: 16.0, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ******** Coffee Type & Price *****
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.type.first,
                      style: GoogleFonts.sora(
                          fontSize: 14.0, color: Colors.black54),
                    ),
                    Text('\$ ${item.price}',
                        style: GoogleFonts.sora(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0XFF2F4B4E),
                        )),
                  ],
                ),
                const Spacer(),
                //
                // ******* Add To Cart Button *******
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: Get.width * 0.09,
                    height: Get.width * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Constants.activeColor,
                    ),
                    child: const Icon(Icons.add,
                        color: Constants.lightColor, size: 22),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // user defined function
  static void showDialogRemoveItem(
      {required BuildContext context, required int index}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Constants.backgroundColor,
          title: Text(
            "Are you sure?",
            style: GoogleFonts.sora(fontSize: 16, color: Constants.textBlack),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Container(
              width: Get.width * 0.2,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Constants.activeColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                child: Text(
                  "Yes",
                  style: GoogleFonts.sora(
                      fontSize: 16, color: Constants.textWhite),
                ),
                onPressed: () async {
                  Get.find<DetailScreenController>().myCart.removeAt(index);
                  Get.find<DetailScreenController>().paymentSummary();
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: Get.width * 0.2,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Constants.activeColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                child: Text(
                  "No",
                  style: GoogleFonts.sora(
                      fontSize: 16, color: Constants.textWhite),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // ******* Custom Dialog box ********
}

class CustomDialog extends StatefulWidget {
  final String title, description, buttonText;
  final Image? image;

  CustomDialog({
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..value = 0.5
      ..addListener(() {
        setState(() {
          // Rebuild the widget at each frame to update the "progress" label.
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 66 + 16,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: const EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(
                    widget.buttonText,
                    style: const TextStyle(
                        fontSize: 18, color: Constants.textBlack),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Lottie.asset(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            'assets/success.json',
            controller: _controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              _controller
                ..duration = composition.duration
                ..forward();
            },
          ),
        ),
      ],
    );
  }
}
