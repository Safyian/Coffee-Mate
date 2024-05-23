import 'package:coffee_mate/utils/constants.dart';
import 'package:coffee_mate/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.darkColor,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height * 0.65,
              child: Image.asset(
                Constants.landingImage,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    // color: Constants.darkColor,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                      0.0,
                      0.15,
                    ],
                        colors: [
                      Colors.white.withOpacity(0.6),
                      Colors.black.withOpacity(0.2),
                    ])),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 2),
                    // landing text 1
                    SizedBox(
                      width: Get.width * 0.7,
                      child: Text(
                        Constants.landingText1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: Get.width * 0.065,
                          color: Constants.textWhite,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    // landing text 2
                    SizedBox(
                      width: Get.width * 0.65,
                      child: Text(
                        Constants.landingText2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w400,
                          fontSize: Get.width * 0.04,
                          color: Constants.textLight,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Get Started Button
                    SizedBox(
                      width: Get.width * 0.85,
                      height: Get.width * 0.15,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.activeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => Get.off(() => const LoginScreen()),
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.sora(
                            fontSize: Get.width * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Constants.textWhite,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
