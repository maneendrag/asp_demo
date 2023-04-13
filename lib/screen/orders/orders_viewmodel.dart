import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
import 'package:asp_base/_services/api_service.dart';
import 'package:asp_base/data_model.dart';
import 'package:asp_base/hive_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'orders_model.dart';

class OrdersViewModel extends BaseViewModel{
  final HttpService _httpService = locator<HttpService>();
  final SnackbarService snackbarService = locator<SnackbarService>();
  final NavigationService navigationService = locator<NavigationService>();

  final DataModel _appLevelModel =
  HiveConfig.getSingleObject<DataModel>(HiveBox.DataModel);

  List<Orders> ordersResponseList = [];

  Future getOrders() async {
    setBusy(true);
    print("Entered cart method");
    try {
      var resp = await _httpService.query(getOrdersQuery, variables: {
        "user_id": _appLevelModel.userID
      });
      print(resp);

      ordersResponseList = List.from(resp['orders'])
          .map((e) => Orders.fromJson(e))
          .toList();




      print("RRRR ----> ${ordersResponseList.length}");


      setBusy(false);
      notifyListeners();

    } catch (e) {
      print("ERROR ======> $e");
      setBusy(false);
    }
  }


  navigateToOrderDetailsScreen(int index){
    navigationService.navigateTo(Routes.orderDetailsScreen, arguments: OrderDetailsScreenArguments(orders: ordersResponseList[index]));
  }


}

String getOrdersQuery = r'''query GetOrdersQuery($user_id: uuid) {
  orders(where: {usr_id: {_eq: $user_id}}) {
    total_order_price
    total_orderd_items
    order_id
    created_at
    address
  }
}''';

