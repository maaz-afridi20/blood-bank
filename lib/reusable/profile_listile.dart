import 'package:smart_blood_bank/consts/exports.dart';

Widget profileListile({
  myleading,
  mytrailing,
}) {
  return Card(
    elevation: 8,
    child: ListTile(
      tileColor: profileBackgroundcolor,
      leading: Text(
        '$myleading',
        style: customTextStyle(
          color: blackk,
          size: 15,
          weight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        '$mytrailing',
        style: customTextStyle(
          color: blackk,
          size: 15,
          weight: FontWeight.w500,
        ),
      ),
    ),
  );
}
