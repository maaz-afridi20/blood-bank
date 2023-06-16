import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../consts/text_style.dart';

Widget containerButtonn({buttonText, myOnTap, required color, required buttonTextColor}) {
  return GestureDetector(
    onTap: myOnTap,
    child: Container(
      height: Get.height * .08,
      width: Get.width * 1,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: customTextStyle(
            color: buttonTextColor,
            weight: FontWeight.bold,
            size: 14,
          ),
        ),
      ),
    ),
  );
}





// class ContainerButton extends StatelessWidget {
//   final String buttonText;
//   const ContainerButton({super.key, required this.buttonText, myOnTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: myOnT,
//       child: Container(
//         height: Get.height * .08,
//         width: Get.width * 1,
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Center(
//           child: Text(
//             buttonText,
//             style: customTextStyle(
//               color: whitecolor,
//               weight: FontWeight.bold,
//               size: 14,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
