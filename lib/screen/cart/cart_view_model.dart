import 'dart:convert';

import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
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

  final DataModel appLevelModel =
  HiveConfig.getSingleObject<DataModel>(HiveBox.DataModel);

  List<Cart> cartResponseList = [];
  double totalProductsCount = 0;
  double totalCartPrice = 0;



  Future getCartDetails() async {
    setBusy(true);
    print("Entered cart method");
    try {
      var resp = await _httpService.query(getCartQuery, variables: {
        "userID": appLevelModel.userID
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

  Future<dynamic> insertOrders() async{
    print("Entered insert order method");
    setBusy(true);
    try {

      var response = await _httpService.mutation(insertOrderQuery, variables: {
        "total_order_price": totalCartPrice,
        "total_orderd_items": totalProductsCount,
        "user_id": appLevelModel.userID,
        "address": appLevelModel.userAddress
      });

      print("BEFORE Insert Order --------> $response");

      if (response != null) {
        if (response['insert_orders']['affected_rows'] > 0) {
          print("ADDED TO Orders --------> $response}");

          deleteUserCart();

          navigateToConfirmScreen();
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

  Future<dynamic> deleteUserCart() async{
    print("Entered insert order method");
    setBusy(true);
    try {

      var response = await _httpService.mutation(deleteUserCartQuery, variables: {
        "userID": appLevelModel.userID
      });

      if (response != null) {
        if (response['delete_cart']['affected_rows'] > 0) {
          print("deleteUserCart --------> $response}");

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

  navigateToConfirmScreen(){
    navigationService.navigateTo(Routes.orderSuccessScreen);
  }

  navigateToAddAddressScreen(){
    navigationService.navigateTo(Routes.addAddressScreen);
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

String insertOrderQuery = r'''mutation InsertIntoOrders($total_order_price: Int, $total_orderd_items: Int, $user_id: uuid, $address: String) {
  insert_orders(objects: {total_order_price: $total_order_price, total_orderd_items: $total_orderd_items, usr_id: $user_id, address: $address}) {
    affected_rows
  }
}''';

String deleteUserCartQuery = r'''mutation DeleteUserCart($userID: uuid) {
  delete_cart(where: {user_id: {_eq: $userID}}) {
    affected_rows
  }
}''';