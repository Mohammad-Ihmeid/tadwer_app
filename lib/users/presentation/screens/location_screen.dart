import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tadwer_app/users/presentation/controller/location_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _getMap(),
      ],
    );
  }

  Widget _getMap() {
    return Consumer<LocationController>(builder: (context, provider, child) {
      return GoogleMap(
        initialCameraPosition: provider.cameraPosition!,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          if (!provider.googleMapController.isCompleted) {
            provider.googleMapController.complete(controller);
          }
        },
      );
    });
  }

  Widget _getCustomPin() {
    return Container();
  }
}
