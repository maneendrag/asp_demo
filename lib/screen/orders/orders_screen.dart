import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'orders_viewmodel.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrdersViewModel>.reactive(
        viewModelBuilder: () => OrdersViewModel(),
        onViewModelReady: (model) => model.getOrders(),
        builder: (context, model, child) {
          return model.isBusy == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : model.ordersResponseList.isEmpty
                  ? Scaffold(
                      body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/empty_orders_box.png",
                          height: 125,
                          width: 125,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "No Orders Found",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ],
                    )))
                  : Scaffold(
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "Orders",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: model.ordersResponseList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      model.navigateToOrderDetailsScreen(index);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 12, right: 12, bottom: 12),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22, vertical: 22),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: Colors.green),
                                      child: Text(
                                        model.ordersResponseList[0].orderId!
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    );
        });
  }
}
