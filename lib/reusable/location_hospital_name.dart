import 'package:smart_blood_bank/consts/exports.dart';

// ignore: must_be_immutable
class LocationHospitalNames extends StatelessWidget {
  String hospitalName;
  String location;

  LocationHospitalNames(
      {super.key, required this.hospitalName, required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_city, color: blackk),
              const SizedBox(width: 8),
              Text(
                hospitalName,
                style: customTextStyle(
                    size: 10, weight: FontWeight.bold, color: lightgrey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_history,
                color: blackk,
              ),
              const SizedBox(width: 8),
              Text(
                location,
                style: customTextStyle(
                    size: 10, weight: FontWeight.bold, color: lightgrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
