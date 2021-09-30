import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:myfood_delivery/repositories/address_repository.dart';

class LocationController extends GetxController {
  AddressRepository _addressRepository = Get.find();

  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  RxString _displayAddress = 'Desconhecido'.obs;

  RxDouble _latitude = 0.0.obs;
  RxDouble _longitude = 0.0.obs;

  LocationData get locationData => _locationData;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  String get displayAddress => _displayAddress.value;

  void locationInit() async {
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    _latitude.value = _locationData.latitude!;
    _longitude.value = _locationData.longitude!;

    getAddress();
  }

  void getAddress() async {
    dynamic response =
        await _addressRepository.getAddress(lat: latitude, long: longitude);
    _displayAddress.value =
        response['address']['road'] + ' - ' + response['address']['suburb'];
  }
}
