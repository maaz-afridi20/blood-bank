import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_blood_bank/controllers/check_controllers.dart';
import 'package:smart_blood_bank/controllers/text_controllers.dart';
import 'package:smart_blood_bank/reusable/custom_text_field.dart';
import 'package:smart_blood_bank/views/nav_bar_home.dart';
import '../consts/colors.dart';
import '../consts/text_style.dart';
import '../reusable/container_button.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  final TextControllers textControllers = Get.put(TextControllers());
  final CheckController checkController = Get.put(CheckController());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Change your password',
                        style: customTextStyle(
                          size: 16,
                          color: blackk,
                          weight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 60),
                      myCustomTextfield(
                        myController: textControllers.changePasswordController,
                        obsecure: checkController.passToggle.value,
                        sufficIcon: InkWell(
                          onTap: () {
                            checkController.passToggle.value = !checkController.passToggle.value;
                          },
                          child: checkController.passToggle.value
                              ? const Icon(Icons.visibility)
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                ),
                        ),
                        myvalidator: (value) {
                          if (textControllers.changePasswordController.value.text.isEmpty) {
                            return 'enter password';
                          } else if (!textControllers.changePasswordController.value.text.contains(
                                RegExp('[!@#%^&*()-._]'),
                              ) ||
                              textControllers.changePasswordController.value.text.length < 8) {
                            return 'length should be 8 and must contains special characters';
                          }
                        },
                        hinText: 'Enter new password',
                      ),
                      const SizedBox(height: 12),
                      myCustomTextfield(
                        obsecure: checkController.confirmPassToggle.value,
                        myController: textControllers.confirmPasswowrdController,
                        sufficIcon: InkWell(
                          onTap: () {
                            checkController.confirmPassToggle.value =
                                !checkController.confirmPassToggle.value;
                          },
                          child: checkController.confirmPassToggle.value
                              ? const Icon(Icons.visibility)
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                ),
                        ),
                        myvalidator: (value) {
                          if (textControllers.confirmPasswowrdController.value.text.isEmpty) {
                            return 'confirm password';
                          } else if (!textControllers.confirmPasswowrdController.value.text
                                  .contains(
                                RegExp('[!@#%^&*()-._]'),
                              ) ||
                              textControllers.confirmPasswowrdController.value.text.length < 8) {
                            return 'length should be 8 and must contains special characters';
                          }
                        },
                        hinText: 'Confirm new password',
                      ),
                      const SizedBox(height: 24),
                      containerButtonn(
                        myOnTap: () {
                          if (formkey.currentState!.validate()) {
                            textControllers.changePasswordController.clear();
                            textControllers.changePasswordController.text.trim();
                            textControllers.confirmPasswowrdController.clear();
                            textControllers.confirmPasswowrdController.value.text.trim();
                            Get.to(() => NavBarHome());
                          }
                        },
                        buttonText: 'Change password',
                        color: lightRedcolor,
                        buttonTextColor: whitecolor,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
