import 'package:smart_blood_bank/consts/exports.dart';

// ignore: must_be_immutable
class DrawerListilee extends StatefulWidget {
  const DrawerListilee({super.key});

  @override
  State<DrawerListilee> createState() => _DrawerListileeState();
}

class _DrawerListileeState extends State<DrawerListilee> {
  List<String> cities = ['lahore', 'kohat', 'karachi', 'london'];
  var currentSelectedCity = 'All';

  List<String> bloodGroups = ['A-', 'A+', 'B+', 'B-', 'O+', '0-', 'AB+', 'AB-'];
  var currentSelectedGroup = 'All';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundColor: lightgrey,
                radius: 32,
                backgroundImage: AssetImage('assets/images/city.jpg'),
              ),
              const SizedBox(width: 8),
              Text(
                'City',
                style: customTextStyle(
                  weight: FontWeight.bold,
                  size: 14,
                  color: lightgrey,
                ),
              ),
              const Spacer(),
              Text(
                currentSelectedCity,
                style: customTextStyle(
                  weight: FontWeight.bold,
                  size: 10,
                  color: blackk,
                ),
              ),
              DropdownButton<String>(
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedCity = newValue!;
                  });
                },
                items: cities.map(
                  (String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundColor: lightgrey,
                radius: 32,
                backgroundImage: AssetImage('assets/images/blood.jpg'),
              ),
              const SizedBox(width: 8),
              Text(
                'Blood Group',
                style: customTextStyle(
                  weight: FontWeight.bold,
                  size: 14,
                  color: lightgrey,
                ),
              ),
              const Spacer(),
              Text(
                currentSelectedGroup,
                style: customTextStyle(
                  weight: FontWeight.bold,
                  size: 10,
                  color: blackk,
                ),
              ),
              DropdownButton<String>(
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedGroup = newValue!;
                  });
                },
                items: bloodGroups.map(
                  (String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
