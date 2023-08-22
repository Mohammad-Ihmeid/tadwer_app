import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController with ChangeNotifier {
  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition? cameraPosition;
  late LatLng defaultLatLng;

  LocationController() {
    initializeProvider();
  }

  initializeProvider() {
    defaultLatLng = const LatLng(11, 104);
    cameraPosition = CameraPosition(
      target: defaultLatLng,
      zoom: 17.5,
    );
    gotousercurrentposition();
  }

  Future gotousercurrentposition() async {
    Position currentPosition = await determinUserCurrentPosition();
    gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  Future gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: position,
      zoom: 17.5,
    )));
    await getAddress(position);
    notifyListeners();
  }

  Future determinUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      debugPrint("User don't enable location permission");
    }
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        debugPrint("User denied location permission");
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      debugPrint("User denied permission forever");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  Future getAddress(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0];
  }
}
