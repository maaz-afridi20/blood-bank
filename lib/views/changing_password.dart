import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_blood_bank/reusable/custom_text_field.dart';
import 'package:smart_blood_bank/views/resetting_password.dart';
import '../consts/colors.dart';
import '../consts/const_texts.dart';
import '../consts/text_style.dart';
import '../reusable/container_button.dart';

class ChnaingPassword extends StatelessWidget {
  const ChnaingPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wellcome To Smart Blood Bank',
                  style: customTextStyle(
                    size: 16,
                    color: blackk,
                    weight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  loginToAcc,
                  style: customTextStyle(
                    size: 12,
                    color: lightgrey,
                  ),
                ),
                const SizedBox(height: 40),
                myCustomTextfield(
                  hinText: 'enter phone number',
                ),
                const SizedBox(height: 12),
                myCustomTextfield(
                  hinText: 'enter password',
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      dontacc,
                      style: customTextStyle(
                        color: lightgrey,
                        size: 12,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      register,
                      style: customTextStyle(
                        color: bluecolor,
                        size: 12,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                containerButtonn(
                  buttonText: 'Sign In',
                  color: lightRedcolor,
                  buttonTextColor: whitecolor,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ResettinPassword(),
                    );
                  },
                  child: Text(
                    forgot,
                    style: customTextStyle(
                      weight: FontWeight.bold,
                      size: 12,
                      color: bluecolor,
                    ),
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
