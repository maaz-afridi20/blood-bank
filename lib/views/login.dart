import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_blood_bank/controllers/check_controllers.dart';
import 'package:smart_blood_bank/controllers/text_controllers.dart';
import 'package:smart_blood_bank/views/create_account.dart';
import 'package:smart_blood_bank/views/nav_bar_home.dart';
import 'package:smart_blood_bank/views/resetting_password.dart';
import '../consts/colors.dart';
import '../consts/const_texts.dart';
import '../consts/text_style.dart';
import '../reusable/container_button.dart';
import '../reusable/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextControllers textControllers = Get.put(TextControllers());
  final CheckController checkController = Get.put(CheckController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Obx(
                  () => (Column(
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
                        myvalidator: (value) {
                          if (textControllers.loginNumberController.value.text.isEmpty) {
                            return 'enter phone number';
                          }
                        },
                        myController: textControllers.loginNumberController,
                        myKeyboardtype: TextInputType.number,
                        hinText: 'enter phone number',
                      ),
                      const SizedBox(height: 12),
                      myCustomTextfield(
                        myvalidator: (value) {
                          if (textControllers.loginPasswordController.value.text.isEmpty) {
                            return 'enter password';
                          } else if (!textControllers.loginPasswordController.value.text.contains(
                                RegExp('[!@#%^&*()-._]'),
                              ) ||
                              textControllers.loginPasswordController.value.text.length < 8) {
                            return 'length should be 8 and must contains special characters';
                          }
                        },
                        myController: textControllers.loginPasswordController,
                        hinText: 'enter password',
                        obsecure: checkController.passToggle.value,
                        sufficIcon: InkWell(
                          onTap: () {
                            checkController.passToggle.value = !checkController.passToggle.value;
                          },
                          child: checkController.passToggle.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
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
                          GestureDetector(
                            onTap: () {
                              Get.to(() => CreateAccount());
                            },
                            child: Text(
                              register,
                              style: customTextStyle(
                                color: bluecolor,
                                size: 12,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      containerButtonn(
                        buttonText: 'Sign In',
                        buttonTextColor: whitecolor,
                        color: lightRedcolor,
                        myOnTap: () {
                          if (formKey.currentState!.validate()) {
                            textControllers.loginNumberController.clear();
                            textControllers.loginPasswordController.clear();
                            Get.to(() => NavBarHome());
                          }
                        },
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
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
