import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:smart_blood_bank/reusable/container_button.dart';
import 'package:smart_blood_bank/views/login.dart';
import 'package:smart_blood_bank/views/nav_bar_home.dart';

import '../consts/colors.dart';
import '../consts/const_texts.dart';
import '../consts/text_style.dart';

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter OTP',
                  style: customTextStyle(
                    size: 16,
                    color: blackk,
                    weight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  sentOtp,
                  style: customTextStyle(
                    size: 12,
                    color: lightgrey,
                  ),
                ),
                const SizedBox(height: 60),

                //
                // this otp is package
                //
                SizedBox(
                  child: Pinput(
                    validator: (value) {
                      if (value == '6969') {
                        Get.snackbar(
                          'Congragulations',
                          'Your pin is correct.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: whitecolor,
                        );
                        Get.to(() => NavBarHome());
                      } else {
                        Get.snackbar(
                          'Wrong',
                          'Your pin is Wrong, choopanay khray.',
                          colorText: whitecolor,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: redcolor,
                        );
                      }
                    },
                    onCompleted: (value) {},
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    length: 4,
                    animationCurve: Curves.bounceIn,
                    focusedPinTheme: PinTheme(
                      height: 60,
                      width: 56,
                      textStyle: customTextStyle(
                        size: 18,
                        color: lightgrey,
                        weight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        color: otpbracketcolor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  resentOtp,
                  style: customTextStyle(
                    color: lightgrey,
                    weight: FontWeight.bold,
                    size: 12,
                  ),
                ),
                const SizedBox(height: 19),
                GestureDetector(
                  onTap: () {
                    Get.to(() => Login());
                  },
                  child: containerButtonn(
                    buttonText: 'Verify',
                    buttonTextColor: whitecolor,
                    color: lightRedcolor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
