import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
import 'package:asp_base/_app/enums/app_enums.dart';
import 'package:asp_base/_services/http_service.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/screen/home/product_response.dart';
import 'package:asp_base/screen/home/screens/products/proseducts_response.dart';
import 'package:stacked_services/stacked_services.dart';
import '../customViewModels.dart';

class HomeScreenViewModel extends CustomBaseViewModel {

  final ApiService _apiService = locator<ApiService>();
  final SizeConfigService sizeConfigService = locator<SizeConfigService>();
  final NavigationService navigationService = locator<NavigationService>();

  ProductsScreenView currentView = ProductsScreenView.homeScreen;
  List<Products> productsResponseList = [];
  List<P> productsResponseeList = [];

  // ProductsResponse? productsResponse;

  // HomeResponse? homeResponse;
  // List<HomeResponse>? homeResponseData = [];
//
//   Future<Either<Failure, HomeResponse>> fetchHomeData() async {
//     setBusy(true);
//     try {
//       var doc = r'''
// query GetUsers {
//   users(where: {apartment_no: {_eq: "111"}}) {
//     user_name
//     role
//     apartment_no
//     office_status
//   }
// }
//       ''';
//
//       var response =
//       await _httpService.query(doc);
//
//       print("Home response data =========> $response");
//
//       homeResponse = HomeResponse.fromJson(response as Map<String, dynamic>);
//
//       // response = homeResponse;
//       // print(
//       //     "HMResponse =========> ${homeResponse}}");
//
//       notifyListeners();
//
//       // if(response["subscription_types"] !=null){
//       //
//       //   // subscriptionTypeData = SubscriptionTypeData.fromJson(response);
//       //
//       //   response["subscription_types"].forEach((data){
//       //     subsData.add(data);
//       //   });
//       //
//       //   print("Sub data -------> $subsData");
//       //
//       //
//       // }else{
//       //   subsData.clear();
//       // }
//
//       // notifyListeners();
//
//       // // changeView(M2View.Signature_SCREEN);
//       // if(response['insert_users']['affected_rows'] > 0){
//       //   changeView(M2View.M2RegisteredSuccessfully);
//       // }
//
//       // subscriptionTypeData = response;
//
//       // print("Var data =======> $subscriptionTypeData");
//       setBusy(false);
//       return Right(homeResponse!);
//     } catch (e) {
//       setBusy(false);
//       print("Error ==========> $e");
//
//       return Left(Failure(
//           errorMessage: 'Errors => $e',
//           message: 'Error in fetching subscription hm details'));
//     }
//   }

  Future getDat() async{
    try{
      print("entered try state");

      var jsonResponse =
      await _apiService.get("https://fakestoreapi.com/products");

      ProductsResponse res = ProductsResponse.fromJson({'data':jsonResponse.data});

      productsResponseeList.addAll(res.data!);
      print("PIN DATAARR --------> ${productsResponseeList}");

      print("Type ====> ${res.data!.length}");
      print("Type ====> ${res.data![0].image}");

notifyListeners();

      // Map<String, dynamic> data = jsonDecode(jsonResponse.toString());

      // print("The data ====> $dataResponse");

    }catch(e){
      print("WhTA THE EXCEPTION ====> $e");

    }
  }

  Future getHomeProducts() async{
    setBusy(true);
    try{
      print("entered Home try state");

      var jsonResponse =
      await _apiService.get("https://dummyjson.com/products?limit=20");

      print("Data ======> $jsonResponse");

      HomeProducts res = HomeProducts.fromJson({'data':jsonResponse.data['products']});


      if(res.data!.isNotEmpty){
        productsResponseList.addAll(res.data!);
        setBusy(false);
        print("PIN DATAARR --------> ${productsResponseList[0].title}");


      }else{
        [];
        setBusy(false);
      }

      // print("Type ====> ${res.data!.length}");
      // print("Type ====> ${res.data![0].image}");

notifyListeners();

      // Map<String, dynamic> data = jsonDecode(jsonResponse.toString());

      // print("The data ====> $dataResponse");

    }catch(e){
      print("WhTA THE HOme EXCEPTION ====> $e");
      setBusy(false);
    }
  }

  // Future<Either<Failure, ProductsResponse>> getECommerceResponse() async {
  //
  //   try {
  //     print("entered try state");
  //
  //     var dataResponse =
  //     await _apiService.get("https://fakestoreapi.com/products");
  //
  //
  //     final String res = dataResponse.toString();
  //
  //     print("rtr =====> ${res.runtimeType}");
  //     var parsed = json.decode(res);
  //
  //
  //     productsResponseList = List<ProductsResponse>.from(
  //         parsed.map((e) => ProductsResponse.fromJson(e)));
  //
  //
  //     print("pprod list ========> ${productsResponseList![0].title}");
  //
  //
  //
  //     // print("rrrrtr =====> ${parseddd.runtimeType}");
  //
  //     // print("In Ecommerce data resp in Home ======> $dataResponse");
  //       setBusy(false);
  //     //
  //     //   String drp = dataResponse.toString();
  //     //
  //     //   print("Data resp string ========> ${drp.runtimeType}");
  //     //
  //     // print("data response ======> ${dataResponse.runtimeType}");
  //     // print("tttttt");
  //     //
  //
  //
  //
  //     // print("DATA ======> $data");
  //
  //     // var userMap = json.decode(dataResponse.toString());
  //     print("Map =====> ${dataResponse.runtimeType}");
  //
  //
  //     // var user = User.fromJson(userMap);
  //
  //     // productsResponse = ProductsResponse.fromJson(dataResponse);
  //     // productsResponseList = List<ProductsResponse>.from(
  //     //     dataResponse.map((e) => ProductsResponse.fromJson(e)));
  //
  //
  //     // print("prd list ------> ${productsResponseList![0].title}");
  //
  //     // print("Var data ======> ${productsResponse!.toJson()}");
  //     // if(dataResponse['message'] == )
  //     return Right(productsResponse!);
  //
  //   } catch (e, s) {
  //     setBusy(false);
  //     print("entered error state ---->$e");
  //     return Left(Failure(message: e.toString(), errorMessage: s.toString()));
  //   }
  // }

  // Future<Either<Failure, ProductsResponse>> getECommerceResponse() async {
  //   setBusy(true);
  //
  //   print("Esign statusrr ----->");
  //   try {
  //     print("try");
  //     var dataResponse =
  //     await _apiService.get("https://fakestoreapi.com/products",
  //     );
  //
  //     productsResponse = dataResponse;
  //
  //      return Right(productsResponse!);
  //
  //   } catch (e, s) {
  //     print("entered error state");
  //     setBusy(false);
  //
  //     return Left(Failure(message: e.toString(), errorMessage: s.toString()));
  //   }
  // }

  @override
  initLogger() {}

  navigateToEditProfileScreen(){
    navigationService.navigateTo(Routes.editProfileScreen);
    notifyListeners();
  }



  navigateToHomeScreen(){
    changeView(ProductsScreenView.homeScreen);
  }

  navigateToProductDetailsScreen(int productId){
    navigationService.navigateTo(Routes.productDetailsScreen,arguments: ProductDetailsScreenArguments(productID: productId));
  }


  changeView(ProductsScreenView view) {
    print("Change view tapped");
    currentView = view;
    notifyListeners();
  }




}
