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
                    padding: const EdgeInsets.only(top: 25, left: 22, right: 22),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: model.cartResponseList.length,
                              itemBuilder: (context, index) {
                                return  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(model.cartResponseList[index].productName!),
                                    Text("${model.cartResponseList[index].count!.toInt().toString()} x ${model.cartResponseList[index].productPrice.toString()}"),
                                    Text("\$ ${model.cartResponseList[index].count!.toInt() * model.cartResponseList[index].productPrice!.toInt()}"),

                                  ],
                                );
                              }),
                        ),
                        Text(model.totalProductsCount.toString()),
                        Text(model.totalCartPrice.toString()),
                      ],
                    ),
                  ),
                );
        });
  }
}
