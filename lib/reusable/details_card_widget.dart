import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/colors.dart';
import '../consts/text_style.dart';
import 'location_hospital_name.dart';
import 'msg_and_call_container.dart';

class DetailsCardWidget extends StatelessWidget {
  const DetailsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        child: Column(
          children: [
            ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
              ),
              tileColor: lightRedcolor,
              leading: const CircleAvatar(
                backgroundColor: otpbracketcolor,
                radius: 32,
                backgroundImage: AssetImage('assets/images/cop.jpg'),
              ),
              title: Text(
                'Choopan',
                style: customTextStyle(
                  weight: FontWeight.bold,
                  size: 14,
                  color: whitecolor,
                ),
              ),
              subtitle: Text(
                'December 10 2020',
                style: customTextStyle(
                  size: 10,
                  color: whitecolor,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: otpbracketcolor,
                radius: 32,
                child: Text(
                  'A+',
                  style: customTextStyle(
                    color: lightRedcolor,
                    size: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //
            // here will show the name and location of the hospital.
            LocationHospitalNames(
              hospitalName: 'Agha khan',
              location: 'Karachi',
            ),
            //
            // row for message and call
            //

            Row(
              children: [
                MessgAndCallContainer(
                  buttonName: 'Message',
                ),
                const SizedBox(width: 4),
                MessgAndCallContainer(buttonName: 'Call'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
