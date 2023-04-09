import "dart:async";

import "package:flutter/material.dart";
import 'package:kiot_map/mapcontroll/kiot_maps_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(
      const Duration(seconds: 8),
      () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const MapsPage(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  "images/logo-transparent.png",
                  width: 150,
                  height: 150,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Kiot Map",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 254, 254, 255),
                    fontSize: 40,
                    fontFamily: "Signatra",
                    letterSpacing: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
