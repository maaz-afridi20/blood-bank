import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_blood_bank/consts/colors.dart';
import 'package:smart_blood_bank/consts/text_style.dart';
import 'package:smart_blood_bank/reusable/profile_listile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Card(
              elevation: 8,
              child: Container(
                color: profileBackgroundcolor,
                height: Get.height * 0.4,
                child: Column(
                  children: [
                    const Center(
                      heightFactor: 2,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Edit Name',
                        style: customTextStyle(
                          color: blackk,
                          size: 15,
                          weight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        'Dr.Bilal',
                        style: customTextStyle(
                          color: blackk,
                          size: 15,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            profileListile(
              myleading: 'Edit Name',
              mytrailing: 'Dr.Khan',
            ),
            profileListile(
              myleading: 'Edit City',
              mytrailing: 'London',
            ),
            profileListile(
              myleading: 'Edit Blood Group',
              mytrailing: 'B+',
            ),
            profileListile(
              myleading: 'Edit Phone Number',
              mytrailing: '+9267283628',
            ),
          ],
        ),
      ),
    );
  }
}
