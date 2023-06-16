import 'package:smart_blood_bank/consts/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redcolor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  height: 170,
                  width: 170,
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'let\'s get started',
                  style: customTextStyle(
                    size: 16,
                    weight: FontWeight.w800,
                    color: whitecolor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Donate now, save lives',
                  style: customTextStyle(
                    size: 12,
                    color: whitecolor,
                  ),
                ),
                const SizedBox(height: 20),
                containerButtonn(
                  color: whitecolor,
                  buttonText: 'Get Started',
                  buttonTextColor: lightgrey,
                  myOnTap: () {
                    Get.to(() => CreateAccount());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
