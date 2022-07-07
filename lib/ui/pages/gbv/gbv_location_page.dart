import 'dart:async';
import 'dart:developer';

import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GbvLocationPage extends StatefulWidget {
  const GbvLocationPage({Key? key}) : super(key: key);

  @override
  State<GbvLocationPage> createState() => _GbvLocationPageState();
}

class _GbvLocationPageState extends State<GbvLocationPage> {
  final Completer<GoogleMapController> _controller = Completer();
  Position? _currentPosition;
  final Set<Marker> _marker = {};
  @override
  initState() {
    super.initState();
  }

  _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    await getCurrentLocation().then((value) {
      _currentPosition = value;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(value.latitude, value.longitude),
            zoom: 15,
          ),
        ),
      );
    });
    setState(() {
      _marker.add(
        Marker(
          markerId: const MarkerId('currentPosition'),
          position:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          infoWindow: const InfoWindow(
            title: 'Your current position',
            snippet: 'You are here',
          ),
        ),
      );
    });
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
            markers: _marker,
          ),
          Positioned(
            top: 20,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
