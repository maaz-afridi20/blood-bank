import 'package:smart_blood_bank/consts/exports.dart';

class PhoneAuthenticationsClass extends GetxController {
  final auth = FirebaseAuth.instance;

  var veriId = ''.obs;
  var outOtp = ''.obs;

  // phone auth...
  void phoneAuth(String number) async {
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (phoneAuthCredential) async {
        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == 'invalid-phone-number') {
          Get.snackbar(
            'Error',
            'Invalid phone number',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
          );
        } else {
          Get.snackbar(
            'Error',
            'Something went wrong,Try again',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
          );
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        veriId.value = verificationId.toString();
      },
      codeAutoRetrievalTimeout: (verificationId) {
        veriId.value = verificationId;
      },
    );
  }

  //
  // Verify Otp
  // for verifing otp
  //

  verifyOtp(String otpp) async {
    try {
      var credentials = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: veriId.value, smsCode: otpp),
      );
      Get.to(() => const MainHomePage());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
}
