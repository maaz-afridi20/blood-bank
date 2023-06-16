import 'package:smart_blood_bank/consts/exports.dart';

class MyCountryPickerClass extends GetxController {
  Rx<Country> selectedCountry = Rx<Country>(
    Country(
      phoneCode: "92",
      countryCode: "PK",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Pakistan",
      example: "Pakistan",
      displayName: "Pakistan",
      displayNameNoCountryCode: "PK",
      e164Key: "",
    ),
  );
}
