import 'dart:convert';

import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
import 'package:asp_base/_services/api_service.dart';
import 'package:asp_base/_services/cart_service.dart';
import 'package:asp_base/_services/http_service.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/data_model.dart';
import 'package:asp_base/hive_config.dart';
import 'package:asp_base/screen/customViewModels.dart';
import 'package:asp_base/screen/home/screens/product_details/ProductDetailsResponse.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailsViewModel extends CustomBaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final HttpService _httpService = locator<HttpService>();
  final CartService _cartService = locator<CartService>();
  final SizeConfigService sizeConfigService = locator<SizeConfigService>();
  final NavigationService navigationService = locator<NavigationService>();

  final DataModel _appLevelModel =

  HiveConfig.getSingleObject<DataModel>(HiveBox.DataModel);

  Product? productsDetailsResponse;

  int cartCountNumber = 0;




  // int? count;
  // String? userId;
  // int? productId;

  // addToCartButton(int productID){
  //
  //     _cartService.addToCart(productID) == true ? CircularProgressIndicator(color: Colors.white,) : _cartService.addToCart(productID);
  //
  // }

  Future<dynamic> addToCart(int productId) async{
    print("Entered cart method");
    setBusy(true);
    try {

      var response = await _httpService.mutation(r'''mutation InsertIntoCart($count: Int!, $user_id: uuid!, $product_id: Int!, $product_name: String!, $price: Int) {
  insert_cart(objects: {count: $count, user_id: $user_id, product_id: $product_id, product_name: $product_name, product_price: $price }) {
    affected_rows
  }
}''', variables: {
        "count": 1,
        "user_id": _appLevelModel.userID,
        "product_id": productsDetailsResponse!.id,
        "product_name": productsDetailsResponse!.title,
        "price": productsDetailsResponse!.price
      });

      print("BEFORE GET COUNT p---------> $response");

      if (response != null) {
        if (response['insert_cart']['affected_rows'] > 0) {
          print("ADDED TO CART --------> $response}");
          cartCountNumber = 1;
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

  Future<dynamic> updateProductCartCount(int productId, String userID, String action) async{
    print("Entered cart method");
    setBusy(true);
    try {
      print("Cart Count number in Plussing and adding ----> $cartCountNumber");
          if(cartCountNumber > 0){

        var response = await _httpService
            .mutation(r'''mutation UpdateCartCount($userID: uuid, $productID: Int, $count: Int) {
  update_cart(where: {user_id: {_eq: $userID}, product_id: {_eq: $productID}}, _set: {count: $count}) {
    returning {
      count
    }
  }
}''', variables: {
          "userID": _appLevelModel.userID,
          "productID": productsDetailsResponse!.id,
          "count":
              action == "INCREMENT" ? cartCountNumber + 1 : cartCountNumber - 1
        });

        print("BEFORE GET COUNT p---------> $response");

        if (response != null) {
          if (response['update_cart']['returning'][0]['count'] > 0) {
            print("ADDED TO CART --------> $response}");
            print(
                "ADDED TO CART --------> ${response['update_cart']['returning'][0]['count']}}");

            cartCountNumber = response['update_cart']['returning'][0]['count'];
          } else {}
          print("ADDED TO CART --------> $response}");

          notifyListeners();
          setBusy(false);
        }
      }else{

          }
    } catch (e) {
      setBusy(false);
      setError(e);
    }
  }

   Future<dynamic> deleteProductCartCount(int productId, String userID) async{
    print("Entered cart method");
    setBusy(true);
    try {

        var response = await _httpService
            .mutation(r'''mutation MyMutation($productID: Int, $userID: uuid) {
  delete_cart(where: {user_id: {_eq: $userID}, product_id: {_eq: $productID}}) {
    affected_rows
    returning {
      count
    }
  }
}
''', variables: {
          "userID": _appLevelModel.userID,
          "productID": productId
        });

        print("BEFORE GET COUNT p---------> $response");

        if (response != null) {
          if (response['delete_cart']['affected_rows'] > 0) {
            print("Deleted from Cart --------> $response}");
            print(
                "ADDED TO CART --------> ${response['delete_cart']['affected_rows']}}");

            cartCountNumber = 0;
          } else {}


          notifyListeners();
          setBusy(false);
        }

    } catch (e) {
      setBusy(false);
      setError(e);
    }
  }



  Future getProductDetailsData(int productId) async {
    try {
      setBusy(true);
      print("entered try state");

      var jsonResponse =
          await _apiService.get("https://dummyjson.com/products/$productId");

      print("PIN DATAARR --------> $jsonResponse}");

      if(jsonResponse != null){
        var jsonData = json.decode(jsonResponse.toString());

        print("Jd ====> ${jsonData.toString()}");

        productsDetailsResponse = Product.fromJson(jsonData);

      // var resp = _cartService.getCartCountFromService("productId",1);

           if(productsDetailsResponse!.id != null) {
          getCartCount("userId", productsDetailsResponse!.id!);

        }else{
             print("Count in fetch product details went wrong");
           }

        setBusy(false);
        notifyListeners();

      }else{
        print("Something went wrong!!!");
      }



    } catch (e) {
      print("WhTA THE EXCEPTION ====> $e");
      setBusy(false);
    }
  }

  Future getCartCount(String userId,int productId) async {
    setBusy(true);
    print("Entered cart method");
    try {
      var resp = await _httpService.query(reasonsQuerys, variables: {
        "userID": _appLevelModel.userID,
        "productID": productId
      });
      if (resp != null) {
        setBusy(false);
        print("Resp --========> $resp");
        print("count -----> ${resp['cart'][0]['count']}");
        _appLevelModel.cartCount = resp['cart'][0]['count'];

        await HiveConfig.putSingleObject(HiveBox.DataModel, _appLevelModel);

        if(resp['cart'][0]['count'] == null){
          cartCountNumber = 0;
        }else{
          cartCountNumber = resp['cart'][0]['count'];
        }
        notifyListeners();
      }else{

        setBusy(false);
        print("entered else condition ======> ${resp[0]['count']}");
        notifyListeners();
      }
    } catch (e) {
      setBusy(false);
    }
  }

  navigateToCartScreen(){
    navigationService.navigateTo(Routes.cartScreen, );
  }



}

String reasonsQuerys = r'''query MyQuery($userID: uuid, $productID: Int) {
  cart(where: {user_id: {_eq: $userID}, product_id: {_eq: $productID}}) {
    count
  }
}''';

