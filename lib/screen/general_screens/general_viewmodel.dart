import 'package:asp_base/screen/general_screens/general_model.dart';
import 'package:stacked/stacked.dart';
import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_services/api_service.dart';

class GeneralViewModel extends BaseViewModel{
  final HttpService _httpService = locator<HttpService>();


  List<SystemSettings> generalResponseList = [];

  Future getGenerals() async {
    setBusy(true);
    print("Entered cart method");
    try {
      var resp = await _httpService.query(getGeneralsQuery);
      print(resp);

      generalResponseList = List.from(resp['system_settings'])
          .map((e) => SystemSettings.fromJson(e))
          .toList();




      print("RRRR ----> ${generalResponseList.length}");

      setBusy(false);
      notifyListeners();

    } catch (e) {
      print("ERROR ======> $e");
      setBusy(false);
    }
  }
}
String getGeneralsQuery = r'''query GetGeneralScreensQuery {
  system_settings {
    privacy_policy
    terms_conditions
    about_us
  }
}''';