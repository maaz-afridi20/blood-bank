import 'package:smart_blood_bank/consts/exports.dart';

class ResettinPassword extends StatelessWidget {
  ResettinPassword({super.key});

  final formkey = GlobalKey<FormState>();
  final TextEditingController numbercontroller = TextEditingController();
  final MyCountryPickerClass selectCountry = MyCountryPickerClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    resetpass,
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
                  const SizedBox(height: 50),
                  myCustomTextfield(
                    preficIcon: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (value) {},
                        );
                      },
                    ),
                    myKeyboardtype: TextInputType.number,
                    myController: numbercontroller,
                    myvalidator: (value) {
                      if (numbercontroller.text.isEmpty) {
                        return 'enter phone number';
                      }
                    },
                    hinText: 'enter phone number',
                  ),
                  const SizedBox(height: 50),
                  containerButtonn(
                    myOnTap: () {
                      if (formkey.currentState!.validate()) {
                        numbercontroller.clear();
                        Get.to(() => ChangePassword());
                      }
                    },
                    buttonText: 'Sign In',
                    color: lightRedcolor,
                    buttonTextColor: whitecolor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
