import 'dart:convert';

import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_services/http_service.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/screen/customViewModels.dart';
import 'package:asp_base/screen/home/screens/product_details/ProductDetailsResponse.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailsViewModel extends CustomBaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final SizeConfigService sizeConfigService = locator<SizeConfigService>();
  final NavigationService navigationService = locator<NavigationService>();

  Product? productsDetailsResponsei;

  // List<ProductDetails> proDetailsResponseList = [];

  Future getProductDetailsData(int productId) async {
    try {
      setBusy(true);
      print("entered try state");

      var jsonResponse =
          await _apiService.get("https://dummyjson.com/products/$productId");

      print("PIN DATAARR --------> $jsonResponse}");

      var jsonData = json.decode(jsonResponse.toString());

      print("Jd ====> ${jsonData.toString()}");

      productsDetailsResponsei = Product.fromJson(jsonData);

      print("Data in view model -----> ${productsDetailsResponsei!.title}");

      setBusy(false);
      notifyListeners();
    } catch (e) {
      print("WhTA THE EXCEPTION ====> $e");
      setBusy(false);
    }
  }
}
