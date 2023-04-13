import 'package:asp_base/screen/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => CartViewModel(),
        onViewModelReady: (model) => model.getCartDetails(),
        builder: (context, model, child) {
          return model.isBusy == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.orange,
                ))
              : model.cartResponseList.isEmpty
            ? Scaffold(
              body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/no_cart_items_found.png",
                        height: 125,
                        width: 125,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "No Cart Found",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    ],
                  )))
          : Scaffold(
                  // backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                "Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
                  body: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 22, right: 22),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Column(
                                  children: List.generate(
                                      model.cartResponseList.length,
                                      (index) => Column(
                                        children: [
                                          Container(color: Colors.grey.shade400,padding: EdgeInsets.only(left: 12,right: 12,top: 16),
                                            child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(height: 45,width: 145,
                                                      child: Text(model.cartResponseList[index]
                                                          .productName!, style: TextStyle(fontSize: 14, color: Color(0xff1B262C), fontWeight: FontWeight.bold),),
                                                    ),
                                                    Text(
                                                        "${model.cartResponseList[index].count!.toInt().toString()} x ${model.cartResponseList[index].productPrice.toString()}",
                                                        style: TextStyle(fontSize: 14, color: Color(0xff1B262C), fontWeight: FontWeight.bold)),
                                                    Text(
                                                        "\$ ${model.cartResponseList[index].count!.toInt() * model.cartResponseList[index].productPrice!.toInt()}",
                                                        style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                          ),

                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  padding:
                                  const EdgeInsets.only(top: 8, left: 12, right: 12,bottom: 8),
                                  color: Colors.grey.shade400,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      Text(
                                        "\$ ${model.totalCartPrice.toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                               if(model.appLevelModel.userAddress!.isEmpty || model.appLevelModel.userAddress == null || model.appLevelModel.userAddress == "" || model.appLevelModel.userAddress == "N/A") {
                                      model.navigateToAddAddressScreen();
                                    }else{
                                 model.insertOrders();
                               }
                                  },
                              child: Container(
                                margin:
                                EdgeInsets.symmetric(vertical: 32),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 65, vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(28),
                                    color: const Color(0xff0F4C75)),
                                child: const Text(
                                  "Confirm Order",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
