import 'package:flutter/material.dart';
import '../consts/colors.dart';
import '../consts/text_style.dart';

// ignore: must_be_immutable
class MessgAndCallContainer extends StatelessWidget {
  String buttonName;

  MessgAndCallContainer({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: redcolor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: customTextStyle(
              size: 12,
              weight: FontWeight.bold,
              color: whitecolor,
            ),
          ),
        ),
      ),
    );
  }
}
