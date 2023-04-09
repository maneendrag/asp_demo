import 'dart:convert';

import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_services/api_service.dart';
import 'package:asp_base/data_model.dart';
import 'package:asp_base/hive_config.dart';
import 'package:asp_base/screen/customViewModels.dart';
import 'package:stacked_services/stacked_services.dart';

import 'cart_model.dart';

class CartViewModel extends CustomBaseViewModel{

  final HttpService _httpService = locator<HttpService>();
  final SnackbarService snackbarService = locator<SnackbarService>();
  final NavigationService navigationService = locator<NavigationService>();

  List<Cart> cartResponseList = [];
  double totalProductsCount = 0;
  double totalCartPrice = 0;



  Future getCartDetails() async {
    setBusy(true);
    print("Entered cart method");
    try {
      var resp = await _httpService.query(getCartQuery, variables: {
        "userID": "6304a45e-4c30-40b2-bc8a-73c100e4f2bc"
      });
      print(resp);

      cartResponseList = List.from(resp['cart'])
          .map((e) => Cart.fromJson(e))
          .toList();

      for(int i=0;i<cartResponseList.length;i++){
        totalProductsCount += cartResponseList[i].count!;
      }

      for(int i=0;i<cartResponseList.length;i++){
        totalCartPrice += (cartResponseList[i].count! * cartResponseList[i].productPrice!);
      }

      // CartDataResponse res = CartDataResponse.fromJson({'data': resp['cart']});

      print("RRRR ----> ${cartResponseList.length}");

      // print("Response of Cart ========> ${res.data!.length}");

      // if(res.data!.isNotEmpty){
      //   cartResponseList.addAll(res.data!);
      //   setBusy(false);
      //   print("PIN DATAARR --------> ${cartResponseList[0].productName}");
      //
        setBusy(false);
        notifyListeners();
      // }else{
      //
      //   setBusy(false);
      //
      //   notifyListeners();
      // }
    } catch (e) {
      print("ERROR ======> $e");
      setBusy(false);
    }
  }

}

String getCartQuery = r'''query GetCartQuery($userID: uuid) {
  cart(where: {user_id: {_eq: $userID}}) {
    product_id
    product_name
    count
    product_price
  }
}''';