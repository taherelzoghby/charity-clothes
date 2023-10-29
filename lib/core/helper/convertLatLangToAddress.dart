import 'package:geocoding/geocoding.dart';

Future<String> getAddressFromLatLng(
    {required double latitude, required double longitude}) async {
  try {
    final addresses = await placemarkFromCoordinates(latitude, longitude);
    if (addresses.isNotEmpty) {
      final address = addresses[0];
      return "${address.street}, ${address.locality}, ${address.postalCode}, ${address.country}";
    } else {
      return "No address found";
    }
  } catch (e) {
    return "Error: $e";
  }
}
