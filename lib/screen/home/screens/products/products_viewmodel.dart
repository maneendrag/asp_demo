import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_services/http_service.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/screen/home/screens/products/proseducts_response.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AllProductsViewModel extends BaseViewModel{
  final ApiService _apiService = locator<ApiService>();
  final SizeConfigService sizeConfigService = locator<SizeConfigService>();
  final NavigationService navigationService = locator<NavigationService>();


  // Future fetchProducts() async{
  //   try{
  //     print("entered products try state");
  //
  //     var jsonResponse = await _apiService.get("https://dummyjson.com/products");
  //
  //     AllProducts res = AllProducts.fromJson({'data':jsonResponse.data});
  //
  //     // allProductsResponseList.addAll(res.data!);
  //
  //
  //     // print("Type ====> ${res.data!.length}");
  //     // print("Type ====> ${res.data![0].image}");
  //
  //     notifyListeners();
  //
  //     // Map<String, dynamic> data = jsonDecode(jsonResponse.toString());
  //
  //     // print("The data ====> $dataResponse");
  //
  //   }catch(e){
  //     print("WhTA THE EXCEPTION ====> $e");
  //
  //   }
  // }

  Future homeProducts() async{
    try{

      print("entered home products try state");

      var jsonResponse = await _apiService.get("https://dummyjson.com/products?limit=10");

      HomeProducts res = HomeProducts.fromJson({'data':jsonResponse.data});

      // allProductsResponseList.addAll(res.data!);


      print("Type ====> $res");
      // print("Type ====> ${res.data![0].image}");

      notifyListeners();
    }catch(e){
      print("WhTA THE EXCEPTION ====> $e");
    }
  }
}