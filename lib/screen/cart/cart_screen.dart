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
              : Scaffold(
                  backgroundColor: Colors.white,
                  body: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 22, right: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: List.generate(
                                  model.cartResponseList.length,
                                  (index) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(model.cartResponseList[index]
                                              .productName!),
                                          Text(
                                              "${model.cartResponseList[index].count!.toInt().toString()} x ${model.cartResponseList[index].productPrice.toString()}"),
                                          Text(
                                              "\$ ${model.cartResponseList[index].count!.toInt() * model.cartResponseList[index].productPrice!.toInt()}"),
                                        ],
                                      )),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "\$ ${model.totalCartPrice.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // model.addToCart(
                            //     model.productsDetailsResponse!.id!);
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
                  ),
                );
        });
  }
}
