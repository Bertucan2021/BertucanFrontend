import 'package:bertucanfrontend/utils/confirm_dialog.dart';
import "package:geolocator/geolocator.dart";
import 'package:get/get.dart';

/// Determine the current position of the device.
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services
    Get.dialog(ConfirmDialog(
      title: 'enable_location'.tr,
      content: 'enable_location_info'.tr,
      actionText: 'ok',
      actionCallback: () => Geolocator.openLocationSettings(),
    ));

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  print(permission);
  if (permission == LocationPermission.deniedForever) {
    Get.dialog(ConfirmDialog(
      title: '"Bertucan" requires Location Services to work'.tr,
      content:
          'Go to Setting to allow "Taxiye" to determine your location. This will help us set your pickup location and improve our services.'
              .tr,
      actionText: 'ok',
      actionCallback: () => Geolocator.openLocationSettings(),
    ));
  }
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

void toast(String title, String message) {
  Get.snackbar(title.tr, message.tr, snackPosition: SnackPosition.BOTTOM);
}