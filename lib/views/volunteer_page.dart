import 'package:smart_blood_bank/consts/exports.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  GoogleMapController? myGoogleMapController;
  Completer<GoogleMapController> completerGoogleMapController = Completer();

  List<Marker> markers = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: 'Islamabad'),
      icon: BitmapDescriptor.defaultMarker,
    ),
  ];

  Future<Position> getUserLocationn() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return Future.error('Location Service is Disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location is denied for ever we cannot permit it more');
    }
    Position currentPosition = await Geolocator.getCurrentPosition();

    return currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserLocationn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Text('Error retrieving poisiton');
        } else {
          final currentPosition = snapshot.data!;
          markers.add(
            Marker(
              markerId: const MarkerId('your Location'),
              position:
                  LatLng(currentPosition.latitude, currentPosition.longitude),
              infoWindow: const InfoWindow(title: 'Your Location'),
            ),
          );
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Volunteer'),
            ),
            body: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentPosition.latitude,
                    currentPosition.longitude,
                  ),
                  zoom: 14),
              onMapCreated: (GoogleMapController controller) {
                completerGoogleMapController.complete(controller);
              },
              markers: Set<Marker>.of(markers),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     try {
            //       getUserLocationn().then((value) async {
            //         myGoogleMapController =
            //             await completerGoogleMapController.future;
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(
            //               content: Text(
            //             "${value.latitude} ${value.longitude}",
            //           )),
            //         );
            //         markers.add(
            //           Marker(
            //               markerId: const MarkerId('3'),
            //               position: LatLng(value.longitude, value.latitude),
            //               infoWindow: const InfoWindow(
            //                 title: 'Your Location',
            //               )),
            //         );
            //         CameraPosition newCameraPosition = CameraPosition(
            //           target: LatLng(value.longitude, value.latitude),
            //         );
            //         await myGoogleMapController!.animateCamera(
            //           CameraUpdate.newCameraPosition(newCameraPosition),
            //         );
            //         setState(() {});
            //       });
            //     } catch (e) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(e.toString()),
            //         ),
            //       );
            //     }
            //   },
            //   child: const Icon(Icons.add),
            // ),
          );
        }
      },
    );
  }
}
