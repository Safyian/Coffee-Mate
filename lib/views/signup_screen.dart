import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import '../widgets/bottom_navbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late TextEditingController _confirmPassController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.clear();
    _emailController.clear();
    _passController.clear();
    _confirmPassController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Coffee Mate",
          style: GoogleFonts.sora(
            fontSize: Get.width * 0.045,
            fontWeight: FontWeight.w600,
            color: Constants.textBlack,
          ),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Image Avatar
                CircleAvatar(
                  radius: Get.width * 0.2,
                  backgroundColor: Constants.activeColor.withOpacity(0.1),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 32,
                    // color: Constants.textGrey,
                    color: Constants.activeColor,
                  ),
                  // backgroundImage: const AssetImage(Constants.landingImage),
                ),
                const SizedBox(height: 46),
                // Name Text Field
                SizedBox(
                  width: Get.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: inputDecoration.copyWith(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Constants.activeColor,
                          ),
                          fillColor: Constants.activeColor.withOpacity(0.1),
                          hintText: "Name"),
                      keyboardType: TextInputType.name,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Email Text Field
                SizedBox(
                  width: Get.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: inputDecoration.copyWith(
                          // labelText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Constants.activeColor,
                          ),
                          fillColor: Constants.activeColor.withOpacity(0.1),
                          hintText: "Email"
                          // focusColor: Colors.amber,
                          ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your Email';
                        } else if (EmailValidator.validate(val) == false) {
                          return 'Please enter valid Email';
                        } else if (EmailValidator.validate(val)) {
                          return null;
                        } else
                          return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Password Text Field
                SizedBox(
                  width: Get.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      controller: _passController,
                      decoration: inputDecoration.copyWith(
                          // labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Constants.activeColor,
                          ),
                          fillColor: Constants.activeColor.withOpacity(0.1),
                          hintText: "Password"
                          // focusColor: Colors.amber,
                          ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a Password';
                        } else
                          return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Confirm Password Text Field
                SizedBox(
                  width: Get.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      controller: _confirmPassController,
                      decoration: inputDecoration.copyWith(
                          // labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Constants.activeColor,
                          ),
                          fillColor: Constants.activeColor.withOpacity(0.1),
                          hintText: "Confirm Password"
                          // focusColor: Colors.amber,
                          ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please re-enter to confirm your Password';
                        } else
                          return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                // Sign up Button
                SizedBox(
                  width: Get.width * 0.9,
                  height: Get.width * 0.14,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.activeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: signUp,
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.sora(
                        fontSize: Get.width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: Constants.textWhite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Signup Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.sora(
                        fontSize: Get.width * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Constants.textGrey,
                      ),
                    ),
                    const SizedBox(width: 6),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Text(
                        "Login",
                        style: GoogleFonts.sora(
                          fontSize: Get.width * 0.032,
                          fontWeight: FontWeight.w600,
                          color: Constants.textBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Text(
                      "OR",
                      style: GoogleFonts.sora(
                        fontSize: Get.width * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Constants.textGrey,
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0.0,
                        ),
                        onPressed: () {
                          Get.offAll(() => const BottomNaviBar());
                        },
                        child: Text(
                          "Continue as Guest",
                          style: GoogleFonts.sora(
                            fontSize: Get.width * 0.032,
                            fontWeight: FontWeight.w600,
                            color: Constants.textBlack,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ****** Login Authentication method ******
  // ****** Login Authentication method ******
  signUp() {
    if (_formKey.currentState!.validate()) {
      Get.offAll(() => const BottomNaviBar());
      // Authentication()
      //     .login(_emailController.text.trim(), _passController.text.trim());
      // print("validate");
    }
  }
}
