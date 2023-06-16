import 'package:smart_blood_bank/consts/exports.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Form(
        child: Row(
          children: [
            SizedBox(
              height: 65,
              width: 48,
              child: Center(
                child: TextFormField(
                  onChanged: (value) {},
                  cursorColor: lightgrey,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  style: customTextStyle(
                    color: blackk,
                    weight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: otpbracketcolor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: lightgrey),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
