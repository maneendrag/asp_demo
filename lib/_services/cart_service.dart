import 'package:asp_base/_app/app.locator.dart';
import 'package:dartz/dartz.dart';
import 'api_service.dart';

class CartService {
  final HttpService _httpService = locator<HttpService>();

  // Future getProductDetailsData(int productId) async {
  //   try {
  //     var resp = await _httpService.query(reasonsQuery, variables: {
  //       "userID": "6304a45e-4c30-40b2-bc8a-73c100e4f2bc",
  //       "productID": 1
  //     });
  //   } catch (e) {
  //     print("WhTA THE EXCEPTION ====> $e");
  //   }
  // }

  // Future getCartCountFromService(String userId,int productId) async {
  //   print("Entered getCartCount method");
  //
  //   try {
  //     var resp = await _httpService.query(reasonsQuery,variables: {
  //       "userID": "6304a45e-4c30-40b2-bc8a-73c100e4f2bc",
  //       "productID": 16
  //     });
  //     if (resp != null) {
  //       print(resp[0]['count']);
  //       return resp[0]['count'];
  //     }else{
  //
  //     }
  //   } catch (e) {}
  // }

//   Future<dynamic> addToCart(int productId, {showLoading = true}) async{
//     print("Entered cart method");
//
//
//
//       if(showLoading == true){
//         CircularProgressIndicator(color: Colors.deepOrange,);
//         return true;
//       }else{
//         var response = await _httpService.mutation(r'''
// mutation InsertIntoCart($count: Int!, $user_id: uuid!, $product_id: Int!) {
//   insert_cart(objects: {count: $count, user_id: $user_id, product_id: $product_id}) {
//     affected_rows
//   }
// }
//  ''', variables: {
//           "count": 1,
//           "user_id": "6304a45e-4c30-40b2-bc8a-73c100e4f2bc",
//           "product_id": productId
//         });
//
//         try{
//         if (response != null) {
//           if (response['insert_cart']['affected_rows'] > 0) {
//             print("ADDED TO CART");
//             showLoading = false;
//             return response['insert_cart']['affected_rows'];
//
//             // _appLevelModel.syncBrokersDone = true;
//
//             // await HiveConfig.putSingleObject(
//             //     HiveBox.AppLevelModel, _appLevelModel);
//           } else {
//             showLoading = false;
//             return response['insert_cart']['affected_rows'];
//             // _utilsService.showSnackBar(
//             //   msg: "user did not update",
//             // );
//           }
//         }
//       }catch(e){
//           print("Exception Occurred!");
//         }
//     }
//
//
//
//
//   }
}

String reasonsQuery = r'''query MyQuery($userID: uuid, $productID: Int) {
  cart(where: {user_id: {_eq: $userID}, product_id: {_eq: $productID}}) {
    count
  }
}''';
