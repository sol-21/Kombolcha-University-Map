import 'dart:async';
import "package:flutter/material.dart";

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late final Completer<GoogleMapController> _controller = Completer();
  static const LatLng _kiotLocation =
      LatLng(11.05089672932272, 39.74741234068117);
  static const CameraPosition _intialCameraPosition = CameraPosition(
    target: _kiotLocation,
    zoom: 14.0,
  );
  String googleApikey = "AIzaSyCDSneVnH1GjujG1mF5433bHcsWxeE0ETU";
  String location = "Search Location";

  final List<Marker> _marker = [];

  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(11.05054792918316, 39.7475981792547),
      infoWindow: InfoWindow(
        title: 'New Liberary',
      ),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(11.049228373433188, 39.748424284919764),
      infoWindow: InfoWindow(
        title: 'Main Liberary',
      ),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(11.048813881825973, 39.748614049799855),
      infoWindow: InfoWindow(
        title: 'Informatics Liberary',
      ),
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(11.050011876127659, 39.747769422074825),
      infoWindow: InfoWindow(
        title: 'Clinic',
      ),
    ),
    Marker(
      markerId: MarkerId('5'),
      position: LatLng(11.049826283854301, 39.74732576901798),
      infoWindow: InfoWindow(
        title: 'Students Lounge',
      ),
    ),
    Marker(
      markerId: MarkerId('6'),
      position: LatLng(11.051413659369077, 39.74840629610825),
      infoWindow: InfoWindow(
        title: 'Teachers Lounge',
      ),
    ),
    Marker(
      markerId: MarkerId('7'),
      position: LatLng(11.050388206250837, 39.74833564759589),
      infoWindow: InfoWindow(
        title: 'Class Rooms',
      ),
    ),
    Marker(
      markerId: MarkerId('8'),
      position: LatLng(11.048667588186346, 39.747775389216024),
      infoWindow: InfoWindow(
        title: 'Sport Field',
      ),
    ),
    Marker(
      markerId: MarkerId('9'),
      position: LatLng(11.048067640731928, 39.74880614529703),
      infoWindow: InfoWindow(
        title: 'Females Dormitery',
      ),
    ),
    Marker(
      markerId: MarkerId('10'),
      position: LatLng(11.048409865394955, 39.74994340181729),
      infoWindow: InfoWindow(
        title: 'Senior Males Dormitery',
      ),
    ),
    Marker(
      markerId: MarkerId('11'),
      position: LatLng(11.0525979604587, 39.747515374116546),
      infoWindow: InfoWindow(
        title: 'Registrar',
      ),
    ),
    Marker(
      markerId: MarkerId('12'),
      position: LatLng(11.0484609310966, 39.7501642678091),
      infoWindow: InfoWindow(
        title: 'Informatics Laboratory',
      ),
    ),
    Marker(
      markerId: MarkerId('13'),
      position: LatLng(11.054155277517383, 39.74977981771949),
      infoWindow: InfoWindow(
        title: 'Ancharo',
      ),
    ),
    Marker(
      markerId: MarkerId('14'),
      position: LatLng(11.049860472683585, 39.750975168631776),
      infoWindow: InfoWindow(
        title: 'White House',
      ),
    ),
    Marker(
      markerId: MarkerId('15'),
      position: LatLng(11.051719663305777, 39.74774489462865),
      infoWindow: InfoWindow(
        title: 'Informatics College',
      ),
    ),
    Marker(
      markerId: MarkerId('16'),
      position: LatLng(11.051917857755775, 39.74954755161849),
      infoWindow: InfoWindow(
        title: 'Students Cafeteria',
      ),
    ),
    Marker(
      markerId: MarkerId('17'),
      position: LatLng(11.051980952622452, 39.74669892974005),
      infoWindow: InfoWindow(
        title: 'Bank & ATM',
      ),
    ),
    Marker(
      markerId: MarkerId('18'),
      position: LatLng(11.048806854002288, 39.748136559691964),
      infoWindow: InfoWindow(
        title: 'Shops & Photocopy',
      ),
    ),
    Marker(
      markerId: MarkerId('19'),
      position: LatLng(11.049538214694493, 39.74787795702361),
      infoWindow: InfoWindow(
        title: 'Students Union',
      ),
    ),
    Marker(
      markerId: MarkerId('20'),
      position: LatLng(11.052409750780946, 39.74680680588732),
      infoWindow: InfoWindow(
        title: 'Administration',
      ),
    ),
    Marker(
      markerId: MarkerId('21'),
      position: LatLng(11.049191370049732, 39.75009020332489),
      infoWindow: InfoWindow(
        title: 'Gymnasium',
      ),
    ),
    Marker(
      markerId: MarkerId('21'),
      position: LatLng(11.051932335911083, 39.74877221281011),
      infoWindow: InfoWindow(
        title: 'Graduation Hall',
      ),
    ),
    Marker(
      markerId: MarkerId('22'),
      position: LatLng(11.050598125259235, 39.74936113917143),
      infoWindow: InfoWindow(
        title: 'Dstv',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
    print(_list.map((e) => e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Whre do you want to go"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.select_all),
          ),
        ],
        elevation: 2,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 253, 87, 37),
                Color.fromARGB(255, 204, 149, 66),
                Color.fromARGB(255, 250, 142, 0),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            markers: Set<Marker>.of(_marker),
            initialCameraPosition: _intialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
