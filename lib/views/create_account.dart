import 'package:smart_blood_bank/consts/exports.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});
  final myformkey = GlobalKey<FormState>();
  final MyCountryPickerClass selectCountry = MyCountryPickerClass();
  final PhoneAuthenticationsClass phoneAuthenticationsClass =
      PhoneAuthenticationsClass();
  final CheckController checkController = Get.put(CheckController());
  final TextControllers textControllers = Get.put(TextControllers());

  @override
  Widget build(BuildContext context) {
    textControllers.phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: textControllers.phoneController.text.length),
    );
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: myformkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
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
                        'Creat your account',
                        style: customTextStyle(
                          size: 12,
                          color: lightgrey,
                        ),
                      ),
                      const SizedBox(height: 40),
                      myCustomTextfield(
                          onchanged: (value) {
                            textControllers.phoneController.text = value;
                          },
                          preficIcon: InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 500,
                                ),
                                onSelect: (value) {
                                  selectCountry.selectedCountry.value = value;
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 12,
                              ),
                              child: Text(
                                '${selectCountry.selectedCountry.value.flagEmoji} + ${selectCountry.selectedCountry.value.phoneCode}',
                                style: customTextStyle(
                                  size: 18,
                                  color: blackk,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          myvalidator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter phone number';
                            }
                          },
                          myKeyboardtype: TextInputType.number,
                          hinText: 'enter phone number',
                          myController: textControllers.phoneController,
                          sufficIcon:
                              textControllers.phoneController.text.length >= 8
                                  ? Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                      child: const Icon(
                                        Icons.done,
                                        color: whitecolor,
                                        size: 20,
                                      ),
                                    )
                                  : null),
                      const SizedBox(height: 12),
                      myCustomTextfield(
                        myvalidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter password';
                          } else if (!textControllers.passwordController.text
                                  .contains(
                                RegExp('[!@#%^&*()-._]'),
                              ) ||
                              textControllers.passwordController.text.length <
                                  8) {
                            return 'length should be 8 and must contains special characters';
                          }
                        },
                        hinText: 'enter password',
                        obsecure: checkController.passToggle.value,
                        myController: textControllers.passwordController,
                        sufficIcon: InkWell(
                          onTap: () {
                            checkController.passToggle.value =
                                !checkController.passToggle.value;
                          },
                          child: checkController.passToggle.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            alreadyAccount,
                            style: customTextStyle(
                              color: lightgrey,
                              size: 12,
                              weight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Login());
                            },
                            child: Text(
                              loginn,
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
                        buttonText: 'Sign Up',
                        buttonTextColor: whitecolor,
                        color: lightRedcolor,
                        myOnTap: () {
                          if (myformkey.currentState!.validate()) {}
                        },
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
