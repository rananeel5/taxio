import 'package:location/location.dart';

class LocationManager {
  postLocation() {
    // Location().getLocation().then((locationData) {
    //   LatLng location = LatLng(
    //       latitude: locationData.latitude!, longitude: locationData.longitude!);
    //   ApiController().updateUserLocation(location);
    // }).catchError((error) {});
  }

  stopPostingLocation() {
    // Location().getLocation().then((locationData) {
    //   ApiController().stopSharingUserLocation();
    // }).catchError((error) {});
  }

  getLocation(Function(double latitude, double longitude) callback) {
    Location().getLocation().then((locationData) {
      callback(locationData.latitude!, locationData.longitude!);
    }).catchError((error) {});
  }
}
