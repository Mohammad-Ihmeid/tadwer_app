import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/routes/app_routes.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';
import 'package:tadwer_app/users/presentation/controller/location_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton:
          Consumer<LocationController>(builder: (context, provider, child) {
        return Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: ColorManager.darkGreen),
          child: FloatingActionButton(
            onPressed: () => provider.gotousercurrentposition(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: const Icon(
              Icons.location_on,
              color: ColorManager.lightGreen,
            ),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _getMap(),
        _getCustomPin(),
        _saveLocation(),
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
    return Center(
      child: SizedBox(
        width: 20.w,
        child: Lottie.asset(IconsAssets.pin),
      ),
    );
  }

  Widget _saveLocation() {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () => Get.offNamed(Routes.orderConfirmation),
          child: Container(
            color: ColorManager.lightGreen,
            width: 60.w,
            margin: const EdgeInsets.only(bottom: AppMargin.m8),
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p16,
            ),
            child: Text(
              "الرجاء أختيار الموقع",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.darkGreen, fontSize: 12.sp),
            ),
          ),
        ),
      ),
    );
  }
}
