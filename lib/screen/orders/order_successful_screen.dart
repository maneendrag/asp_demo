import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';


class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  final NavigationService navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Icon(Icons.star, color: Colors.green,size: 75,),
      const Text(
        "Order Placed Successfully",
        style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      GestureDetector(
        onTap: (){
          navigationService.pushNamedAndRemoveUntil(Routes.productsScreen);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 32,horizontal: 18),
          padding: const EdgeInsets.symmetric(
              horizontal: 65, vertical: 16),
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(28),
              color: const Color(0xff0F4C75)),
          child: Center(
            child: const Text(
              "Continue Shopping",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      )
    ],),);
  }
}
