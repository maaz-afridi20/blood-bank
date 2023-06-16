import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_blood_bank/views/profile.dart';
import 'package:smart_blood_bank/views/volunteer_page.dart';

import '../consts/colors.dart';
import '../main_home_page.dart';
import 'blood_bank_page.dart';

class NavBarHome extends StatelessWidget {
  NavBarHome({Key? key}) : super(key: key);

  final RxInt myCurrentIndex = 1.obs;
  final RxInt pageIndex = 0.obs;

  final List pages = [
    const VolunteerPage(),
    const MainHomePage(),
    const BloodBanks(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: whitecolor,
          selectedItemColor: redcolor,
          unselectedItemColor: lightgrey,
          currentIndex: myCurrentIndex.value,
          iconSize: 30,
          onTap: (value) {
            myCurrentIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.volunteer_activism,
              ),
              label: 'Volunteer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.balance_outlined),
              label: 'Blood Bank',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: pages[myCurrentIndex.value],
      ),
    );
  }
}
