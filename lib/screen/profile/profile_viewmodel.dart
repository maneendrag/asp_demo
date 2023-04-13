import 'package:asp_base/data_model.dart';
import 'package:asp_base/hive_config.dart';
import 'package:asp_base/screen/general_screens/general_model.dart';
import 'package:asp_base/screen/profile/profile_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';
import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_services/api_service.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel{
  final HttpService _httpService = locator<HttpService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  final DataModel appLevelModel =
  HiveConfig.getSingleObject<DataModel>(HiveBox.DataModel);
  List<User> profileResponseList = [];

  // Position? position;
  // String? address;

  // getCurrentPosition() async {
  //
  //
  //
  //   position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
  //
  //   print("The current position ===========> $position");
  //   print("The current position ===========> ${placemarks[0]}");
  //   return position;
  //
  //
  // }

  String? currentAddress;
  Position? currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _snackbarService.showSnackbar(message: "Service unavailable");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _snackbarService.showSnackbar(message: "Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _snackbarService.showSnackbar(message: "Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
       currentPosition = position;
       notifyListeners();
      _getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      print("Error ------> $e");
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) async{
      Placemark place = placemarks[0];

        currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';

      appLevelModel.userAddress = currentAddress;

      await HiveConfig.putSingleObject(HiveBox.DataModel, appLevelModel);

  notifyListeners();
    }).catchError((e) {
      print("Error in _getAddressFromLatLng ------> $e");
    });

  }


  Future getUserDetails() async {
    setBusy(true);
    print("Entered user method");
    try {
      var resp = await _httpService.query(getUsersQuery, variables: {
        "userID": appLevelModel.userID
      });
      print(resp);

      profileResponseList = List.from(resp['user'])
          .map((e) => User.fromJson(e))
          .toList();

      appLevelModel.userAddress = profileResponseList[0].address!;

      await HiveConfig.putSingleObject(HiveBox.DataModel, appLevelModel);


      print("RRRR ----> ${profileResponseList.length}");

      setBusy(false);
      notifyListeners();

    } catch (e) {
      print("ERROR ======> $e");
      setBusy(false);
    }
  }

  Future<dynamic> updateUserAddress() async{
    print("Entered cart method");
    setBusy(true);
    try {

      var response = await _httpService.mutation(r'''mutation UpadeUserAddress($userID: uuid, $address: String) {
  update_user(where: {user_id: {_eq: $userID}}, _set: {address: $address}) {
    affected_rows
  }
}''', variables: {
        "userID": appLevelModel.userID,
        "address": currentAddress ?? ""
      });

      print("BEFORE GET COUNT p---------> $response");

      if (response != null) {
        if (response['update_user']['affected_rows'] > 0) {
          print("ADDED TO user address --------> $response}");

        } else {
          setBusy(true);
        }
        notifyListeners();
        setBusy(false);
      }} catch (e) {
      setBusy(false);
      setError(e);
    }
  }

}
String getUsersQuery = r'''query GetUserDetails($userID: uuid) {
  user(where: {user_id: {_eq: $userID}}) {
    user_email
    user_name
    user_phone
    address
  }
}''';