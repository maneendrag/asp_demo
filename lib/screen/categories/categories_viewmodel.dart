import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
import 'package:asp_base/_services/http_service.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'categories_response.dart';

class CategoriesViewModel extends BaseViewModel{
  final ApiService _apiService = locator<ApiService>();
  final SizeConfigService sizeConfigService = locator<SizeConfigService>();
  final NavigationService navigationService = locator<NavigationService>();

  List<String> categoriesResponseList = [];

  Future getCategories() async{
    try{
      print("entered try state");

      var jsonResponse =
      await _apiService.get("https://dummyjson.com/products/categories");

      print("PIN DATAARR --------> $jsonResponse}");


      CategoriesResponse res = CategoriesResponse.fromJson({'data':jsonResponse.data});

      print("RES DATAARR --------> ${res.data}}");


      categoriesResponseList = res.data!;

      print("Cattts ---> $categoriesResponseList");


      // categoriesResponseList.addAll(res.data!);

      // categoriesResponseList.forEach((element) {});


      notifyListeners();

    }catch(e){
      print("WhTA THE EXCEPTION ====> $e");

    }
  }

  navigateToProductsScreen(String categoryName){
    navigationService.navigateTo(Routes.productsScreen, arguments: ProductsScreenArguments(isFromCategories: true, categoryName: categoryName));
  }

}