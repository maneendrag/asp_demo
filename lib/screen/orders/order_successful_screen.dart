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
    return Scaffold(body: Column(children: [
      GestureDetector(
        onTap: (){
          navigationService.pushNamedAndRemoveUntil(Routes.productsScreen);
        },
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.green,size: 75,),
                Container(
                  margin:
                  EdgeInsets.symmetric(vertical: 32),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 65, vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(28),
                      color: const Color(0xff0F4C75)),
                  child: const Text(
                    "Order Placed Successfully",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],),);
  }
}
